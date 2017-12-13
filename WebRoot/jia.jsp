<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta content="utf-8">
<title>My JSP 'index.jsp' starting page</title>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>

<body>

	<div id="main" style="width:100%;height:500px"></div>
	<button type="button" id="button1" style="
    border-radius: 10px;
    border: none;
    width: 100px;
    height: 35px;
    margin-left: 25px;
    color: white;
    background: deepskyblue;
    cursor: pointer;
">显示/隱藏</button>
	<!--<button type="button" id="button2">刷新</button>-->
	<script type="text/javascript">
	
		var shuname = new Array();
		var shusize = new Array();
		shuname=["已处理","正在处理","未处理"]
	
		$(() => {
			$("#button1").click(function() {
				$("#main").slideToggle(999);
			})
			
/* 			$("#button2").click(function(){
					$.ajax({
			type : "post", //提交方式 get/post
			url : "shuTestAction_getAllPower", //请求服务器的路径
			dateType : "json", //返回数据类型
			async : false,
			success : function(jsonArray1) {
				console.log("我到这里来了")
					shusize = jsonArray1;
				console.log(shusize)
			}
		})
	
			}) */
		});
	
		$.ajax({
			type : "post", //提交方式 get/post
			url : "complaintAction_getAllPower", //请求服务器的路径
			dateType : "json", //返回数据类型
			async : false,
			success : function(jsonArray1) {
				console.log("我到这里来了")
					shusize = jsonArray1;
				console.log(shusize)
			}
		})
		
	
		
	
		console.log(shusize[1], shuname[2])
	
	
	
	
	
		var myChart = echarts.init(document.getElementById('main'));
	
	
	
		var downloadJson = shusize[0] + shusize[1] + shusize[2];
		console.log(downloadJson)
	
	
		option = {
			backgroundColor : {
				type : 'pattern',
				repeat : 'repeat'
			},
			tooltip : {},
			title : [ { //标题
				text : '投诉报表',
				subtext : '投诉量',
				x : '25%',
				textAlign : 'center'
			}, {
				text : '投诉报表',
				subtext : '总计 ' + downloadJson,
				x : '75%',
				textAlign : 'center'
			} ],
			toolbox : { //工具栏 内置有导出图片，数据视图，动态类型切换，数据区域缩放，重置五个工具。
				show : true, //是否显示工具栏组件。
				showTitle : true, //是否在鼠标 hover 的时候显示每个工具 icon 的标题
				feature : {
					mark : { //API中未找到，待测试
						show : true
					},
					dataView : { //数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新。
						show : true, //是否显示改工具
						readOnly : false //是否不可编辑（只读）。
					},
					magicType : { //动态类型切换
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : { //配置还原项
						show : true
					},
					saveAsImage : { //保存为图片
						show : true, //是否显示工具
					}
				}
			},
			grid : [ { //应该是样式 整体
				top : 50,
				width : '40%',
				left : 10,
				containLabel : true
			} ],
			xAxis : [ { //x轴 最大值
				type : 'category',
				boundaryGap: true,
				data : shuname,  //X轴最大值  3个数据相加的
				splitLine : {   //表格虚线
					show : true
				}
			} ],
			yAxis : [ {
				type : 'value',				
				max : downloadJson,    //Y轴上的最大数字为 所有投诉的总和
				axisLabel : {    //Y轴上的数字
					interval : 0,
					rotate : 40
				},
				splitLine : {
					show : true
				}
			}
			],
			series : [ {
				type : 'bar',  //柱形图
		
				stack : 'chart',
				z : 3,	
				label : {
					normal : {
						position : '',  //数字在柱状 左 中 右
						show : true //是否显示数据数字
					}
				},
				data : shusize,
			
			}, {
				type : 'pie',
				radius : [ '0%', '60%' ],
				center : [ '75%', '50%' ],
				data : [
					{
						value : shusize[0],
						name : shuname[0]
					},
					{
						value : shusize[1],
						name : shuname[1]
					},
					{
						value : shusize[2],
						name : shuname[2]
					}
				].sort(function(a, b) {
					return a.value - b.value;
				}),
				roseType : 'radius', //[ default: false ] 是否展示成南丁格尔图，通过半径区分数据大小。可选择两种模式：'radius' 扇区圆心角展现数据的百分比，半径展现数据的大小。'area' 所有扇区圆心角相同，仅通过半径展现数据大小。
				label : { //饼图图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
					normal : {
						textStyle : { // 文本标签的样式
							color : 'rgba(0, 0, 0, 0.5)' //颜色 加 虚化
						}
					}
				}
			} ]
		}
	
		myChart.setOption(option);
	</script>

</body>
</html>
