<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="${basePath }/js/jquery-1.7.2.min.js"></script>
	
  </head>
  
  <body>

<div id="login-container">
	<div id="login-header">
		<h3>登录</h3>
	</div> <!-- /login-header -->
	
	<div id="login-content" class="clearfix">
		<form action="./" />
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="username">账号</label>
						<div class="controls">
							<input type="text" class="" id="username" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls">
							<input type="password" class="" id="password" />
						</div>
					</div>
				</fieldset>
				
				<div id="remember-me" class="pull-left">
					<!-- <input type="checkbox" name="remember" id="remember" />
					<label id="remember-label" for="remember">记住我</label> -->
					<label class="error-box" style="color:red;"></label>
				</div>
				
				<div class="pull-right">
					<button type="button" class="btn btn-warning btn-large" id="login_sub">
						登录
					</button>
				</div>
			</form>
			
		</div> <!-- /login-content -->
		
		
		<div id="login-extra">
			<p>若忘记密码，请联系系统管理员. &copy; 2015 西南交通大学.</p>
		</div> <!-- /login-extra -->
	
</div> <!-- /login-wrapper -->


  <script type="text/javascript">
	$(document).ready(function() {
		$("#login_sub").click(function(){
			userLogin('${basePath}');
		});
		function userLogin(path){
			var username = $("#username").val();
			var password = $("#password").val();
			if(username == "" || password == ""){
				$(".error-box").html("用户名或密码不能为空！");
				if($("#username").val() == ""){
					$("#username").focus();
				}else{
					$("#password").focus();
				}
				return;
			}
			var url_string = "LoginServlet";
			$.ajax({
				type: "post",
				url: url_string,
				data: {'username':username, 'password':password},
				dataType:'json',
				beforeSend:function(){
		   			$("#login_sub").attr("disabled", true);
		   			$(".error-box").html("登录中，请稍等！");
				},
				success:function(json) {
					var result = json.result;
					if (result == "1"){
						location.href="${basePath}HomeServlet";
					}
					else if (result == "0"){
						$(".error-box").html("用户名或密码错误！");
						$("#pwd").val("");
						$("#pwd").focus();
					}
					else {
						$(".error-box").html("发生内部错误，请重试！");
					}
				},
				complete:function(){
					$("#login_sub").attr("disabled", false);
				},
				error:function(){
					$(".error-box").html("发生内部错误，请重试！");
				}
			});
		}
		
		document.onkeydown = function(e){ 
		    var ev = document.all ? window.event : e;
		    if(ev.keyCode==13) {
		    	userLogin('${basePath}');
		     }
		}
	});
	</script>
  </body>
</html>
