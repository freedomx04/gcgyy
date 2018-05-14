package com.hongmeng.gcgyy.common.utils;

import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PageUtils {
    
    static Logger log = LoggerFactory.getLogger(PageUtils.class);
    
    public static List<String> jsFiles = new LinkedList<String>();
    
    public static List<String> cssFiles = new LinkedList<String>();
   
    static {
        String dir;
        
        // demo css
        cssFiles.add("css/demo.css");
        
        // jquery
        jsFiles.add("js/jquery/1.10.1/jquery.js");
        jsFiles.add("js/jquery/jquery-doT.js");
        jsFiles.add("js/jquery/jquery.cookie.js");
        jsFiles.add("js/jquery/jquery.session.js");
        
        // base js
        jsFiles.add("js/base/base.js");
        jsFiles.add("js/base/user.js");
        jsFiles.add("js/base/utils.js");
        jsFiles.add("js/base/constant.js");
        
        // date
        jsFiles.add("js/date/date.format-1.2.3.js");
        jsFiles.add("js/date/date.js");
        
        // des 
        jsFiles.add("js/CryptoJS/3.1.2/rollups/tripledes.js");
        jsFiles.add("js/CryptoJS/3.1.2/components/mode-ecb.js");
        
        //dataTables
        jsFiles.add("js/dataTables/1.10.11/js/jquery.dataTables.min.js");
        cssFiles.add("js/dataTables/1.10.11/css/jquery.dataTables.min.css");
        
        //validate
        jsFiles.add("js/validate/jquery.validate.min.js");
        jsFiles.add("js/validate/jquery.validate.messages_cn.js");
        jsFiles.add("js/base/validate-extend.js");
        
        // doT
        jsFiles.add("js/doT/1.0.1/doT.js");
        
        // jquery ui files
        dir = "js/jquery-ui/1.11.4/";
        jsFiles.add(dir + "jquery-ui.min.js");
        cssFiles.add(dir + "jquery-ui.min.css");
        
        // main css
        cssFiles.add("css/main.css");
//        cssFiles.add("css/ui-icon.css");
        cssFiles.add("css/loading.css");
        
        // amaze ui files
        dir = "js/amaze-ui/2.7.0/";
        jsFiles.add(dir + "js/amazeui.custom.min.js");
        cssFiles.add(dir + "css/amazeui.css");
        cssFiles.add(dir + "css/admin.css");
        
        // 覆盖amaze一些样式
        cssFiles.add("css/cover-amaze.css");
        
        //highcharts
        jsFiles.add("js/highcharts/4.2.5/highcharts.js");
        
        //ueditor
        jsFiles.add("js/ueditor/ueditor.config.js");
        jsFiles.add("js/ueditor/ueditor.all.min.js");
        jsFiles.add("js/ueditor/lang/zh-cn/zh-cn.js");
        cssFiles.add("js/ueditor/themes/default/css/ueditor.min.css");
        
        // slideBox
        jsFiles.add("js/slideBox/jquery.slideBox.js");
        cssFiles.add("js/slideBox/jquery.slideBox.css");
        
        // datetimepicker
        jsFiles.add("js/date/jquery.datetimepicker.full.js");
        cssFiles.add("js/date/jquery.datetimepicker.css");
        
    }

}
