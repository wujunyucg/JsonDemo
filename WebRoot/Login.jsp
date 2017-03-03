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
    <table border="1px" id="table">
    	<tr>
    	<td>A</td>
    	<td>A</td>
    	</tr>
    	
    	<tr>
    	<td>A</td>
    	<td>A</td>
    	</tr>
	    	
    </table>
  </body>
  
  <script type="text/javascript">
	$(document).ready(function() {
		userLogin("");
		function userLogin(path){
			var url_string = "HomeServlet";
			$.ajax({
				type: "post",
				url: url_string,
				dataType:'json',
				success:function(json) {
					$.each(json.comments, function(i, item) {
						var ss = "" + item.username + " " + item.password;
						var vv = "<tr><td>" + "</td></tr>";
						$("#table").append(vv);
			        });
				},
				complete:function(){
				},
				error:function(){
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
</html>
