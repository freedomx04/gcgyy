<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template AreaIntroduce" type="text/x-jquery-tmpl">
<div class="introduce_right border">
	<div>
		<div class="hd">
			<span class="title">平台简介</span>
		</div>
		<div class="yuanqu_w">
			<div style="margin-bottom: 60px;text-indent:2rem;color:#000;">
				 <img src="./img/gyy.gif" height="144" hspace="10" vspace="10" width="300" align="left">
				 <div>广昌工业园区成立于2002年，2006年被省政府批准为省级工业园。园区坐落于县城北面，东至旴江河，南与县城相连接，规划面积529公顷，总体结构为“一心两轴八区”(一心：依托206国道，结合山体公园，成为行政服务、商业金融及文化活动中心;两轴：沿206国道和迎宾大道形成两条产业发展轴;八区：食品产业区、玩具工艺品产业区、电子产业区、服装产业区、综合产业区、化工产业区、有色金属产业区及居住小区)。按“高起点规划、高标准设计、高质量施工、高效能管理”的要求，将建设为一个集物流、商贸、研发、居住为一体的现代化、生态型城市新区和抚州独具特色的先进制造业基地。</div>
　　				   <div>目前，广昌工业园区全面完成了一期(含扩区)基础设施建设，基本完成了二期A区基础设施建设，建设了二期A-2土方平整工程，二期A区道路网络、二期A区排水工程以及供水、供电、通讯等工程。园区新区规划选址论证和征地工作全面完成，正在进行土石方平整工作，园区污水处理厂正在施工。工业园区亮化、绿化、美化工作也正在逐步完善，为招商项目落户工业园区搭建良好的承接平台。工业园区初步形成了食品加工业、电子加工业、玩具工艺品加工业、服装鞋业、有色金属等五大特色产业。
　　2009年上半年，工业园区实现主营业务收入同比增长72.4%,增幅全市第一;实现工业增加值同比增长72.3%,增幅全市第一;税收同比增长147.1%,增幅全市第一;工业用电同比增长104.2%，增幅全市第一。
				</div>
　　<div>广昌工业园区实行“准政府、大服务”的管理模式，在工业园区设立了中国共产党广昌工业园区工作委员会(简称党工委)和江西广昌工业园区管理委员会(简称管委)，为县委、县政府的派驻机构(正科级)，工业园区党工委、管委会统一领导和管理工业园区内经济社会发展各项事务及党的建设和精神文明建设。工业园区内设副科级机构为党政办公室、经济发展办公室、建设环保分局、财政分局、综合执法大队;公安、工商、国土、国税、地税等部门在工业园区设立了派驻机构。</div>
　　<div>广昌县委、县政府从土地、水电、扶持、服务、管理等方面为工业园区发展制定了一系列优惠政策，坚持“只要来广昌，一切都宽松”的开放理念，着力打造“人无我有、人有我优”的投资发展环境。广昌工业园区本着“大开放促大发展”、“你投资我发展”的原则，坚持“诚信相待”的观念，以“一切为了园区企业”的服务宗旨，以“简捷的效率，优惠的政策，出色的服务”，为企业提供一条龙服务。</div>
　　<div>广昌工业园区是一个充满生机活力的工业平台，又是一个功能配套设施齐全的新区，它正展开热情的双臂，诚邀海内外有识之士来广昌工业园区观光考察、投资合作、发展事业。</div>
			</div>
		</div>
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "AreaIntroduce";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				return self;
			}
		},
		draw: {
			value: function(id) {
				var self = this;
				self.$tar.html(self.$tempTar.doT({
				}));
				return self;
			}
		}
	});

})( jQuery );
</script>