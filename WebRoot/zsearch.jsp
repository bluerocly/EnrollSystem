<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>报名状态查询</title>
		<script src="js/jquery-1.5.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#regbutton").click(function(event) {
			var ttel = $("#ttel").val();
			var tidcard = $("#tidcard").val();
			if(ttel==''|| tidcard=='') {  
				alert('请输入查询信息!');  
				return false; 
			}
			$.get('ActionServlet?method=search', {
				ttel : ttel,
				tidcard : tidcard
				
			}, function(responseText) {
				$("#regresult").text(responseText);
			});
		});
	});
</script>
<div id="register">
	<!--
	<p align="left">
		<font color="#ff3300" size="+3">申请报名<span id="cke_bm_102E" style="display: none">&nbsp;</span><span id="cke_bm_101E" style="display: none">&nbsp;</span></font></p>
-->
	<h1>
		报名状态查询</h1>
	<form id="reg">
		<table align="left" border="0" width="340">
			<tbody>
				
				<tr>
					<td width="141">
						联系号码：</td>
					<td width="189">
						<label><input id="ttel" name="ttel" type="text" /> </label><font color="#ff8080"></font></td>
				</tr>
				<tr>
					<td width="141">
						身份证号：</td>
					<td width="189">
						<label><input id="tidcard" name="tidcard" type="text" /> </label> <font color="#ff8080"></font> </td>
				</tr>
				<tr>
					<td>
						<label><input id="regbutton" name="Submit" type="button" value="查询" /> </label></td>
				</tr>
				<tr><td colspan="2"><font color="#ff8080"><strong>&nbsp;<div align="center" id="regresult"></div></strong></font></td></tr>
			</tbody>
		</table>
		<br />
	
	</form>
</div>
<p>
	&nbsp;</p>
</html>