<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="js/font/iconfont.css">
		<script src="js/echarts.js"></script>
		<script type="js/iconfont.js"></script>
		<style>
			.chart{
				padding:10px;
			}
		</style>
</head>
<body>
  		<table width="100%" style="border-collapse:collapse" >
			  <tr">
			  	<td colspan="4">
			  		<div style="color:#4eabf1;width: 100%;">
			  			<div class="iconfont icon-gongzuo" style="margin:0px 20px;border-bottom: 1px solid #b8b8b8;">工作督办</div>
			  		</div>
			  	</td>
			  </tr>
			  <tr id='top' style="height:100px;">
			    <td width="25%" class="chart" style="padding-left:3%">
					<div style="font-size: 20px;">本月审核总笔数</div>
			    	<img src="images/01.jpg" style="float:left"/>
			    	<div style="float:left">
			    		<div style="height: 56px;line-height: 56px;font-size: 20px;color: #f8ab77; margin-left:10px;">${pd.perSum} 个人</div>
						<div style="height: 20px;font-size: 20px;color: #f8ab77; margin-left:10px;">${pd.comSum} 企业</div>
			    	</div>
			    </td>
			    <td width="25%" class="chart" style="padding-left:3%">
					<div style="font-size: 20px;">本月审核通过笔数</div>
			    	<img src="images/02.jpg" style="float:left"/>
		    		<div style="float:left">
		    			<div style="height: 56px;line-height: 56px;font-size: 20px;color: #e46b6c; margin-left: 10px;">${pd.perSus} 个人</div>
						<div style="height: 20px;font-size: 20px;color: #e46b6c; margin-left: 10px;">${pd.comSus} 企业</div>
		    		</div>
			    </td>
			    <td width="25%" class="chart" style="padding-left:3%">
					<div style="font-size: 20px;">本月审核不通过笔数</div>
			    	<img src="images/03.jpg" style="float:left"/>
			    	<div style="float:left">
				    	<div style="height: 56px;line-height: 56px;font-size: 20px;color: #8fc8f5; margin-left: 10px;">${pd.perFail} 个人</div>
						<div style="height: 20px;font-size: 20px;color: #8fc8f5; margin-left: 10px;">${pd.comFail} 企业</div>
			   		</div>	
			    </td>
			  </tr>
		</table>
		
		<table width="100%" style="border-collapse:collapse">
			<tr height="80px">
				<td colspan="8">
					<div style="color:#4eabf1;width:100%; ">
						<div class="iconfont icon-see-icon-m3-performance" style="margin:0px 20px;border-bottom: 1px solid #b8b8b8;">详细反馈</div>
					</div>
				</td>
				
			</tr>
			<tr id="mid" height="80px">
				<td width="1.3%"></td>
			    <td width="23.7%" style="background-color: #eaf4fd; padding-left:30px;"><!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				    <div id="zhutu" style="width: 90%; " class="chart"></div>
	   			</td>
	   			<td width="23.7%" style="background-color: #eaf4fd;"><!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				    <div id="bingtu" style="width: 90%;" class="chart"></div>
	   			</td>
	   			<td width="1.3%"></td>
				<td width="47.4%" style="background-color: #eaf4fd"><!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		    		<div id="zhexiantu" style="width:90%;" ></div>
				</td>
			</tr>
		</table>

	</body>
<script src="static/ace/js/jquery.js" ></script>

<!-- 首页---->
<script type="text/javascript">
var winHeight = window.innerHeight-200;
        document.getElementById("top").style.height = (winHeight*0.3-25) +"px";
        document.getElementById("mid").style.height = (winHeight*0.4+30) +"px";
        //document.getElementById("bottom").style.height = (winHeight*0.4+10) +"px";
        
        document.getElementById("zhutu").style.height = (winHeight*0.7) +"px";
        document.getElementById("bingtu").style.height = (winHeight*0.7) +"px";
        document.getElementById("zhexiantu").style.height = (winHeight*0.7) +"px";
        
		
		var y1 = 2;
		var myChart1 = echarts.init(document.getElementById('zhutu'));
        // 指定图表的配置项和数据
        var option1 = {
		    title : {
		        text: '本月个人审核统计',
		        subtext: '',
		        x:'center',
		        bottom:0,
		        left:'center',
		        textStyle: {
		        	fontSize: 16,
		        	fontWeight: 'normal'
		        }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    
		    series : [
		        {
		            name: '审核状态',
		            type: 'pie',
		            radius : '58%',
		            center: ['50%', '50%'],
		            data:[
		                {value:${pd.PmSucess}, name:'审核通过'},
		                {value:${pd.PmFail}, name:'审核不通过'},
		                {value:${pd.PmCheck}, name:'待审核'},
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};

        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
  // 基于准备好的dom，初始化echarts实例
	   var myChart2 = echarts.init(document.getElementById('bingtu'));
	   var option2 = {
		    title : {
		        text: '本月企业审核统计',
		        subtext: '',
		        x:'center',
		        bottom:0,
		        left:'center',
		        textStyle: {
		        	fontSize: 16,
		        	fontWeight: 'normal'
		        }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    
		    series : [
		        {
		            name: '审核状态',
		            type: 'pie',
		            radius : '58%',
		            center: ['50%', '50%'],
		            data:[
		                {value:${pd.CmSucess}, name:'审核通过'},
		                {value:${pd.CmFail}, name:'审核不通过'},
		                {value:${pd.CmCheck}, name:'待审核'},
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		}; 
	   // 使用刚指定的配置项和数据显示图表。
	   myChart2.setOption(option2);
       
  
        // 基于准备好的dom，初始化echarts实例
        var myChart3 = echarts.init(document.getElementById('zhexiantu'));
		var option3 = {
			    title: {
			        text: '最近15天审核统计',
			        left: 'center',
			        textAlign: '60%',
			        bottom: 0,
			        textStyle: {
			        	fontSize: 16,
			        	fontWeight:'normal'
			        }
			    },
			    tooltip: {
			        trigger: 'asix',
			        axisPointer: {
			            lineStyle: {
			                color: '#ddd'
			            }
			        },
			        backgroundColor: 'rgba(255,255,255,1)',
			        padding: [5, 10],
			        textStyle: {
			            color: '#000000',
			        },
			        extraCssText: 'box-shadow: 0 0 5px rgba(0,0,0,0.3)'
			    },
			    legend: {
			        right: 20,
			        orient: 'horizontal',
			        data: ['个人','企业']
			    },
			    xAxis: {
			        type: 'category',
					name:'时间(号)',
			        data: ${QueryRecodeTime},
			        boundaryGap: false,
			        splitLine: {
			            show: true,
			            interval: '0',
			            lineStyle: {
			                color: ['#D4DFF5']
			            }
			        },
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#000000'
			            }
			        },
			        axisLabel: {
			            interval:0,
						rotate:0
			        }
			    },
			    yAxis: {
			        type: 'value',
					name:"次数(次)",
			        splitLine: {
			            lineStyle: {
			                color: ['#D4DFF5']
			            }
			        },
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#000000'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                fontSize: 14
			            }
			        }
			    },
			    series: [{
			        name: '个人',
			        type: 'line',
			        //smooth: true,
			        showSymbol: true,
			        symbol: 'circle',
			        symbolSize: 2,
			        data: ${perQueryRecode},
			        itemStyle: {
			            normal: {
			                color: '#F30F11',
			                width:2
			            }
			        },
			        label: {normal: {
			           	show: true,
			        	textStyle:{
			        		color:'#000000'
			        	}   
			        }},
			        lineStyle: {
			            normal: {
			                width: 1
			            }
			        }
			    },
				{
			        name: '企业',
			        type: 'line',
			        //smooth: true,
			        showSymbol: true,
			        symbol: 'circle',
			        symbolSize: 2,
			        data: ${comQueryRecode},
			        itemStyle: {
			            normal: {
			                color: '#3e99dc',
			                width:2
			            }
			        },
			        label: {normal: {
			           	show: true,
			        	textStyle:{
			        		color:'#000000'
			        	}   
			        }},
			        lineStyle: {
			            normal: {
			                width: 1
			            }
			        }
			    }]
			};
		 // 使用刚指定的配置项和数据显示图表。
		   myChart3.setOption(option3);
	
	/*function goMenu(){
	window.location.href='<%=basePath%>bhreport/list.do?menuId=64';
		$.ajax({
				type: "POST",
				url: '<%=basePath%>bhreport/list.do',
				dataType:'json',
				success: function(){}
				})
	}*/
</script>
<script>
$(top.hangge());
</script>

</html>