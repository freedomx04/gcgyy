package com.hongmeng.gcgyy.common.wx;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.DigestException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;

import com.google.gson.Gson;
import com.hongmeng.gcgyy.common.utils.ConfigUtils;
import com.hongmeng.gcgyy.common.utils.HttpUtils;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.service.authority.UserService;

public class WxUtil {

	static Logger log = LoggerFactory.getLogger(WxUtil.class);

	public static WxUtil INSTANCE = null;

	private static Gson gson = new Gson();

	private WxUtil() {
		// TODO Auto-generated constructor stub
	}

	public static WxUtil getInstace() {
		if (INSTANCE == null) {
			synchronized (WxUtil.class) {
				if (INSTANCE == null) {
					INSTANCE = new WxUtil();
				}
			}
		}
		return INSTANCE;
	}

	private String accessToken = null;
	private long token_expireTime = 0;

	/**
	 * 获取access_token
	 * 
	 * @return access_token
	 */
	public String getToken() throws IOException {
		String corpid = ConfigUtils.get("customize.weixin.corpid");
		String corpsecret = ConfigUtils.get("customize.weixin.corpsecret");

		long current = System.currentTimeMillis();
		if (token_expireTime < current) {
			String url = String.format("https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=%s&corpsecret=%s", corpid,
					corpsecret);
			String ret = HttpUtils.getResponseAsString(url);
			TokenEntity token = gson.fromJson(ret, TokenEntity.class);

			if (token.getAccess_token() != null) {
				accessToken = token.getAccess_token();
				token_expireTime = current + 7200 * 1000;

				log.info("token from weixin --> " + accessToken);
			} else {
				throw new IOException("invalid token");
			}
		} else {
			//log.info("token from cache --> " + accessToken);
		}

		return accessToken;
	}

	private String jsapi_ticket = null;
	private long ticket_expireTime = 0;

	/**
	 * 根据token获取jsapi_ticket
	 * 
	 * @param token
	 * @return
	 * @throws IOException
	 */
	public String getTicket() {
		try {
			String token = WxUtil.getInstace().getToken();
			
			long current = System.currentTimeMillis();
			if (ticket_expireTime < current) {
				String url = String.format("https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=%s", token);
				String ret = HttpUtils.getResponseAsString(url);
				TicketEntity ticket = gson.fromJson(ret, TicketEntity.class);

				if (ticket.getTicket() != null) {
					jsapi_ticket = ticket.getTicket();
					ticket_expireTime = current + 7200 * 1000;

					log.info("ticket from weixin --> " + ticket);
				} else {
					throw new IOException("invalid ticket");
				}
			} else {
				//log.info("ticket from cache --> " + jsapi_ticket);
			}

			return jsapi_ticket;
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}

	/**
	 * 根据token和code获取userId
	 * 
	 * @param token
	 * @param code
	 * @return
	 */
	public static String getUserId(String token, String code) {
		try {
			String url = String.format("https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=%s&code=%s",
					token, code);
			String ret = HttpUtils.getResponseAsString(url);
			OAuthEntity oauth = gson.fromJson(ret, OAuthEntity.class);
			return oauth.getUserId();
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			return "";
		}
	}

	/**
	 * 根据code获取userId
	 * 
	 * @param code
	 * @return
	 */
	public static String getUserId(String code) {
		try {
			String token = WxUtil.getInstace().getToken();
			String userId = getUserId(token, code);
			return userId;
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			return "";
		}
	}
	
	public static void config(ModelMap modelMap, String url) {
		try {
			// 企业微信的cropID
			String appId = ConfigUtils.get("customize.weixin.corpid");
			
			// Ticket
			String ticket = WxUtil.getInstace().getTicket();
			
			// 生成签名的随机串
			String noncestr = UUID.randomUUID().toString();
			
			// 生成签名的时间戳
			String timestamp = Long.toString(System.currentTimeMillis() / 1000);
			
			// 对所有待签名参数按照字段名的ASCII码从小到大排序（字典序）后，使用URL键值对的格式（即key1=value1&key2=value2…）拼接成字符串str
			String str = String.format("jsapi_ticket=%s&noncestr=%s&timestamp=%s&url=%s", ticket, noncestr, timestamp, url);
			
			// 对str进行sha1签名，得到signature：
			String signature = WxUtil.SHA1(str);
			
			modelMap.addAttribute("appId", appId);
			modelMap.addAttribute("timestamp", timestamp);
			modelMap.addAttribute("nonceStr", noncestr);
			modelMap.addAttribute("signature", signature);
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	/**
	 * SHA1签名
	 * @param decript
	 * @return
	 * @throws DigestException
	 */
	public static String SHA1(String decript) {
		String signature = null;
		try {
			MessageDigest crypt = MessageDigest.getInstance("SHA-1");
			crypt.reset();
			crypt.update(decript.getBytes("UTF-8"));
			signature = byteToHex(crypt.digest());
		} catch (NoSuchAlgorithmException e) {
			log.error(e.getMessage(), e);
		} catch (UnsupportedEncodingException ee) {
			log.error(ee.getMessage(), ee);
		}
		return signature;
	}
	
	private static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}
	
	/**
	 * 微信登入跳转
	 * @param modelMap
	 * @param request
	 * @param userService
	 * @param jspPath
	 * @return
	 */
	public String redirect(ModelMap modelMap, HttpServletRequest request, UserService userService, String jspPath) {
		UserEntity user = null;
		String userId = request.getParameter("userId");
		
		// 第一次微信进入
		if (userId == null) {
			String wxUserId = getUserId(request.getParameter("code"));
			user = userService.findByWxUserId(wxUserId);
			
			// 该微信用户未绑定, 跳转到绑定页面
			if (user == null) {
				modelMap.addAttribute("wxUserId", wxUserId);
				
				String redirect = request.getRequestURL().toString();
				modelMap.addAttribute("redirect", redirect);
				
				return "wx/personal/bind";
			}
			
			// 该微信用户已绑定, 跳转到指定页面
			modelMap.addAttribute("user", user);
			return jspPath;
		} 
		
		// 绑定好后进入
		user = userService.findOne(Long.parseLong(userId));
		modelMap.addAttribute("user", user);
		return jspPath;
	}
	
	public String send(String toUser, String agentid, String content) throws IOException {
		String ret = "";
		
		String token = getToken();
		String url = String.format("https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=%s", token);
		
		String json = "{'touser': '" + toUser + "', 'msgtype': 'text', 'agentid': '" + agentid + "', 'text': {'content': '" + content + "'}}";
		json = json.replace('\'', '\"');
		
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		
		RequestConfig config = RequestConfig.custom().setSocketTimeout(2000).setConnectTimeout(5000).build();
		httpPost.setConfig(config);
		httpPost.addHeader("Content-Type", "application/json");
		
		StringEntity entity = new StringEntity(json, Consts.UTF_8);
		httpPost.setEntity(entity);
		
		CloseableHttpResponse response = httpClient.execute(httpPost, new BasicHttpContext());
		
		HttpEntity retEntity = response.getEntity();
        if (response.getStatusLine().getStatusCode() < 400) {
            ret = EntityUtils.toString(retEntity, "UTF-8");
        } else {
            EntityUtils.consume(entity);
        }
        httpClient.close();
        
        return ret;
	}
	
}
