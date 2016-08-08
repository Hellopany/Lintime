function getXmlDoc(){
	var xmlDoc;
	try{
		//给IE浏览器 创建一个空的微软 XML文档对象
		if(window.ActiveXObject){  //判断是否为IE浏览器
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
/*		alert("ie");*/
		}else if (document.implementation && document.implementation.createDocument) {//这里主要是对谷歌浏览器进行处理
			   var xmlhttp = new window.XMLHttpRequest();  
			   xmlhttp.open("GET","../../js/province_city.xml",false);  
			   xmlhttp.send(null);  
			   xmlDoc = xmlhttp.responseXML; 
/*			   alert("Chrome");*/
			   return xmlDoc;
		}else{
			//在 Firefox及其他浏览器(opera)中的 XML解析器创建一个空的 			XML文档对象。 
			xmlDoc=document.implementation.createDocument("","",null);
/*			alert("Firefox 和Opear");*/
		}
	}catch(err){
		alert("当前浏览器不支持XML,请更换浏览器后再试");
	}
	//关闭异步加载，这样确保在文档完全加载之前解析器不会继续脚本的执行
	xmlDoc.async=false;
	//解析器加载名为 "xxx.xml" 的 XML 文档
	xmlDoc.load("../../js/province_city.xml");
	return xmlDoc;
}
window.onload=function(){
	var xmlDoc=getXmlDoc();
	//获取xml文件的根节点
	var root=xmlDoc.documentElement;
	//获取xml文件的根节点下面的省节点
	var provinces=root.childNodes;	
	//获取页面中要显示的省、市和县的控件dom对象
	var sheng=document.getElementById("sheng");
	var shi=document.getElementById("shi");
	var xian=document.getElementById("xian");
	var s1= $("#s1").val();
	var s2= $("#s2").val();
	var s=$("#s").val();
		
	 //遍历所有的省 
	for(var i=0;i<provinces.length;i++){
		 //查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节Node.ELEMENT_NODE---1 -- 元素节点)
		if(provinces[i].nodeType==1){
			//创建一个option节点对象
			var shengopt=document.createElement("option");
			//为option省节点添加文本													
			shengopt.appendChild(document.createTextNode(provinces[i].getAttribute("value")));
			//为option省节点设置属性													
			shengopt.setAttribute("value",provinces[i].getAttribute("code"));
			if(s==1 && s1==provinces[i].getAttribute("value")){
				shengopt.setAttribute("selected","selected");				
			}
		    //添加省到页面dom对象中
			sheng.appendChild(shengopt);
		}
	}
	if(s==1){
		//获取省节点所有的option对象的集合
		var shengs=sheng.options;
		//获取选中option对象的selectedIndex(下标值)
		var num=shengs.selectedIndex;
		//清空市 区   
		shi.length=0;
/*		xian.length=0;*/
		//根据选中的省获取其value值的内容  即xml文件中的postcode对应的		值
		var ppostcode=shengs[num].getAttribute("value");
		//遍历所有的省
		for(var i=0;i<provinces.length;i++){
			//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点	Node.ELEMENT_NODE---1-- 元素节点)
			if(provinces[i].nodeType==1){
				//根据省获取其postcode值的内容  即html文件中的value对应的值
				var postcode=provinces[i].getAttribute("code");
				if(postcode==ppostcode){
					//获取省节点的子节点
					var cities=provinces[i].childNodes;
					//清空
					shi.length=0;
					//遍历所有的市
					for(var i=0;i<cities.length;i++){
						//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点												Node.ELEMENT_NODE    ---1    -- 元素节点)
						if(cities[i].nodeType==1){
							//创建一个option节点对象
							var shiopt=document.createElement("option");
							//为option市节点添加文本									
							shiopt.appendChild(document.createTextNode(cities[i].getAttribute("value")));
							//为option市节点设置属性
							shiopt.setAttribute("value",cities[i].getAttribute("code"));
							if(s2==cities[i].getAttribute("value")){
								shiopt.setAttribute("selected","selected");				
							}
							 //添加市到页面dom对象中
							shi.appendChild(shiopt);
						}
					}
					break;
				}
			}
		}
	}

	//当省节点发生改变时 触发事件
	sheng.onchange=function(){
		//获取省节点所有的option对象的集合
		var shengs=sheng.options;
		//获取选中option对象的selectedIndex(下标值)
		var num=shengs.selectedIndex;
		//清空市 区   
		shi.length=0;
/*		xian.length=0;*/
		//根据选中的省获取其value值的内容  即xml文件中的postcode对应的		值
		var ppostcode=shengs[num].getAttribute("value");
		//遍历所有的省
		for(var i=0;i<provinces.length;i++){
			//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点	Node.ELEMENT_NODE---1-- 元素节点)
			if(provinces[i].nodeType==1){
				//根据省获取其postcode值的内容  即html文件中的value对应的值
				var postcode=provinces[i].getAttribute("code");
				if(postcode==ppostcode){
					//获取省节点的子节点
					var cities=provinces[i].childNodes;
					//清空
					shi.length=0;
					//遍历所有的市
					for(var i=0;i<cities.length;i++){
						//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点												Node.ELEMENT_NODE    ---1    -- 元素节点)
						if(cities[i].nodeType==1){
							//创建一个option节点对象
							var shiopt=document.createElement("option");
							//为option市节点添加文本									
							shiopt.appendChild(document.createTextNode(cities[i].getAttribute("value")));
							//为option市节点设置属性
							shiopt.setAttribute("value",cities[i].getAttribute("code"));
							 //添加市到页面dom对象中
							shi.appendChild(shiopt);
						}
					}
					break;
				}
			}
		}
		var eng=$("#sheng option:selected");
		var i=$("#shi option:selected");
		$("#registeaddress").val(eng.text()+"-"+i.text());
	}
	shi.onchange=function(){
		var eng=$("#sheng option:selected");
		var i=$("#shi option:selected");
		$("#registeaddress").val(eng.text()+"-"+i.text());
	}
	
	
	
		
	
	
	

	//当市节点发生改变时 触发事件   
	shi.onchange=function(){
		//获取市节点所有的option对象的集合
		var shis=shi.options;
		//获取选中option对象的selectedIndex(下标值)
		var num=shis.selectedIndex;
		//根据选中的市获取其value值的内容  即xml文件中的postcode对应的		值
		var spostcode=shis[num].getAttribute("value");
		//遍历所有的省
		for(var i=0;i<provinces.length;i++){
			//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点	Node.ELEMENT_NODE---1 -- 元素节点)
			if(provinces[i].nodeType==1){
				//获取省节点的子节点
				var cities=provinces[i].childNodes;
				//遍历所有的市
				for(var j=0;j<cities.length;j++){
					//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点	Node.ELEMENT_NODE    								---1    -- 元素节点)
					if(cities[j].nodeType==1){
						//根据市获取其postcode值的内容  即html文件中的value对应的值
						var postcode=cities[j].getAttribute("code");
						if(postcode==spostcode){
							//清空
							xian.length=0;
							//获取市节点的子节点
							var areas=cities[j].childNodes;
							//遍历所有的区(县)
							for(var k=0;k<areas.length;k++){
								//查看该节点是否是元素节点 也是为了实现不同浏览器之间的兼容性问题(1是元素节点										Node.ELEMENT_NODE    ---1    -- 元素节点)
								if(areas[k].nodeType==1){
									//创建一个option节点对象
									var xianopt=document.createElement("option");
									//为option区节点添加文本
									xianopt.appendChild(document.createTextNode(areas[k].getAttribute("value")));
									//为option区节点设置属性
									xianopt.setAttribute("value", areas[k].getAttribute("code"));
									 //添加区到页面dom对象中
									xian.appendChild(xianopt);
								}
							}
							break;
						}
					}
				}
			}
		}
	}
}
