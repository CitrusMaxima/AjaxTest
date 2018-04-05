<span style="font-size:18px;"><%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  </head>
  <body>
   <!-- AJAX方式下不需要用表单来提交数据,因此不用写表单标签 -->
   <!-- AJAX方式不需要name属性，需要id属性 -->
   输入用户名后，当光标离开用户名输入框，即响应onblur事件。
   用户名：<input type="text" id="username" onblur="verify()"/>
   密   码：<input type="text" id="password"/>

   <!-- 这个div用来存入服务器返回的信息，开始为空 -->
   <!-- id属性定义是为了利用dom的方式找到一个节点进行操作 -->
   <div id="result"></div>

  </body>
<script type="text/javascript">
  var xmlhttp;
  function verify(){
      var username=document.getElementById("username").value;

      //创建XMLHttpRequest对象

      if(window.XMLHttpRequest){
          //针对FireFox,Mozillar,Opera,Safari,IE7,IE8
          xmlhttp = new XMLHttpRequest();

          //对某些特定版本的mozillar浏览器的bug进行修正
          if(xmlhttp.overrideMineType){
              xmlhttp.overrideMineType("text/xml");
          }
      }else if(window.ActiveXObject){
          //针对IE5，IE5.5，IE6

          //两个可以用于创建XMLHTTPRequest对象的控件名称。保存在一个JS数组中。
          var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
          for(var i = 0; i<activeName.length; i++){
              //取出一个控件名进行创建，如果成功就终止循环
              try{
                  xmlhttp = new ActiveXObject(activexName[i]);
                  break;
              }catch(e){}
          }

      }

      if(xmlhttp){
          alert("XMLHttpRequest对象创建成功！");
          //return;
      }else{
          alert("XMLHttpRequest对象创建失败！");
      }


      //注册回调函数,只写函数名，不能写括号，写括号表示调用函数。
      xmlhttp.onreadystatechange = callback;

      //设置连接信息(请求方式，请求的url,true表示异步方式交互)
      xmlhttp.open("GET","AJAXServer?name=" + username, true);

      //发送数据，开始和服务器进行交互。
      xmlhttp.send(null);


      //使用POST方式请求，需要手动设置http的请求头
      //xmlhttp.setRequestHeader("Content-Type","aplication/x-www-form-urlencoded");
      //xmlhttp.send("name=" + username);

  }

  //回调函数
  function callback(){
      //判断对象的状态是否交互完成
      if(xmlhttp.readyState == 4){

          //判断http的交互是否成功
          if(xmlhttp.status == 200){

              //获取服务器端返回的数据（文本）
              var responseText = xmlhttp.responseText;

              //将数据显示在页面上
              var divNode = document.getElementById("result");

              //设置元素节点中的html内容
              divNode.innerHTML = responseText;

          }

      }
  }
</script>
</html>