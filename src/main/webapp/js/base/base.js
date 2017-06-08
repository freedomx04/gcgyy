;(function() {
	
	$k = {
		page: {},
		proto: {},
		util: {},
		constant: {
			pageSize: 10,
			latest: 5
		},
		user: {
			resource: [{
				name: "权限管理",
				list: [{
					name: "角色管理",
					value: "authority_role"
				}, {
					name: "企业管理",
					value: "authority_enterprise"
				}, {
					name: "部门管理",
					value: "authority_department"
				}, {
					name: "用户管理",
					value: "authority_user"
				}, {
					name: "访问量",
					value: "authority_visit"
				}]
			}, {
				name: "基础数据",
				list: [{
					name: "区域管理",
					value: "base_area"
				}, {
					name: "产业类别",
					value: "base_productType"
				}, {
					name: "诉求类别",
					value: "base_appealType"
				}, {
					name: "行业类别",
					value: "base_industryType"
				}, {
					name: "上报时间",
					value: "base_report"
				}, {
					name: "县区管理",
					value: "base_county"
				}]
			}, {
				name: "机构",
				list: [{
					name: "企业",
					value: "agency_enterprise"
				}, {
					name: "政府部门",
					value: "agency_department"
				}]
			}, {
				name: "工业经济监测分析平台",
				list: [{
					name: "信息直报",
					value: "monitor_report"
				}, {
					name: "企业主要指标",
					value: "monitor_enterprise_target"
				}, {
					name: "行业主要指标",
					value: "monitor_business_target"
				}, {
					name: "区域主要指标",
					value: "monitor_area_target"
				},{
					name: "重点企业主要指标",
					value: "monitor_point_enterprise_target"
				},{
					name: "企业预警",
					value: "monitor_warning"
				}, {
					name: "积分排名",
					value: "monitor_ranking"
				}]
			},  {
				name: "全市排名",
				list: [{
					name: "全市排名上报",
					value: "rank_report"
				},{
					name: "全市排名查看",
					value: "rank_read"
				}]
			}, {
				name: "企业帮扶平台",
				list: [/*{
					name: "诉求中心(监督)",
					value: "assist_appeal_monitor"
				},*/ {
					name: "诉求中心(派单)",
					value: "assist_appeal_dispatcher"
				}]
			}, {
				name: "工业服务平台",
				list: [{
					name: "招工平台",
					value: "service_jobPlatform"
				}]
			}, {
				name: "新闻发布",
				list: [{
					name: "首页图片",
					value: "point_news_photo"
				},{
					name: "图片新闻",
					value: "news_photo"
				}, {
					name: "公示公告",
					value: "news_announce"
				}, {
					name: "政策法规",
					value: "news_policy"
				},{
					name: "工业信息",
					value: "news_overview"
				}]
			}]
		},
		config: {
			datatables: {
				displayLength: 12
			},
			serviceUrl: 'http://www.jxgcgxw.gov.cn/service'
		},
		system: {}
	};

})();
