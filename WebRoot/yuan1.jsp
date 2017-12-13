<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<title>Insert title here</title>
<script  src="js/echarts.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>

	<div id="main" style="width:100%;height:550px"></div>

<script type="text/javascript">




var myChart = echarts.init(document.getElementById('main'));

$(() => {
	$("#button1").click(function() {
		$("#main").slideToggle(999);
	})
});
var shuname = new Array();
var shusize = new Array();

//假数据  直接更改
		shuname=["已入住用户","未入住用户"]
		shusize=[78,55]
		
		
	
	console.log(shuname)
	console.log(shusize)
	
option = {
	backgroundColor: '#2c343c',

    title: {
        text: '用户入住报表', //文本名
        left: 'center', //文本位置
        top: 20,  // 具体位置
        textStyle: {
            color: '#FFF' //文本的颜色
        }
    },

    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    toolbox:{
    	show:true,
    	showTitle:true,
		feature:{
			mark : {
				show : true
			},
			dataView:{
				show:true, 
				readOnly:false 
			},
			restore:{
				show:true
			},
			saveAsImage:{
				show:true 
			}
		}
    },

    visualMap: {	
        show: false, 	//是否显示工具类
        min: 80,
        max: 600,
        inRange: {
            colorLightness: [0, 1]
        }
    },
    
    series : [
        {
            name:'访问来源',
            type:'pie',		
            radius : '55%',	
            center: ['50%', '50%'], 
            data:[
                {value:335, name:'已入住用户'},
                {value:210, name:'未入住用户'},
                 {value:274, name:'装修用户'},
                {value:400, name:'未装修用户'}
            ].sort(function (a, b) { return a.value - b.value; }), //sort 
            roseType: 'radius', 
            label: { 
                normal: {
                    textStyle: { 
                        color: 'rgba(255, 255, 255, 0.5)' //颜色 加 虚化
                    }
                }
            },
            labelLine: { 
                normal: {	
                    lineStyle: { //样式
                        color: 'rgba(255, 255, 255, 0.3)'
                       
                    },
                    smooth: 0.2, //是否平滑视觉引导线，默认不平滑，可以设置成 true 平滑显示，也可以设置为 0 到 1 的值，表示平滑程度。
                    length: 10,	 //视觉引导线第一段的长度。
                    length2: 20	 //视觉引导线第二段的长度
                }
            },
            itemStyle: {  
                 normal: {	 
                    color: '#c23531', //图形的颜色。 默认从全局调色盘 option.color 获取颜色
                    shadowBlur: 200,  //图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
                    shadowColor: 'rgba(0, 0, 0, 0.5)' //阴影颜色。支持的格式同color。
                } 
          //      emphasis:{
          //     	color: '#c23531',
          //     	shadowBlur: 200,
          //     	shadowColor: 'rgba(0, 0, 0, 0.5)'
          //    }  
            } ,
            
            

            animationType: 'scale',
            animationEasing: 'backOut', 
            animationDelay: function (idx) {
                return Math.random() * 200;
            }
        }
    ]
};

myChart.setOption(option);






</script>

</body>
</html>