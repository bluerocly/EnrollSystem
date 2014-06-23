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

		<title>申请报名</title>
		<script src="js/jquery-1.5.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#regbutton").click(function(event) {
			var tname = $("#tname").val();
			var tsex = $("input[name='tsex'][checked]").val();
			var ttype = $(".ttype").val();
			var tschool = $("#tschool").val();
			var tacademy = $("#tacademy").val();
			var tmajor = $("#tmajor").val();
			var tgrade = $("#tgrade").val();
			var tresearch = $("#tresearch").val();
			var temail = $("#temail").val();
			var ttel = $("#ttel").val();
			var tteacher = $("#tteacher").val();
			var tidcard = $("#tidcard").val();
			if(tname == '' || tschool == '' || tmajor=='' || tgrade==''|| tresearch==''|| tgrade==''|| temail==''|| ttel==''|| tteacher==''|| tidcard=='') {  
				alert('*为必填项，不能为空!');  
				return false; 
			}
			$.get('ActionServlet', {
				tname : tname,
				tsex : tsex,
				ttype : ttype,
				tschool : tschool,
				tacademy : tacademy,
				tmajor : tmajor,
				tgrade : tgrade,
				tresearch : tresearch,
				temail : temail,
				ttel : ttel,
				tteacher : tteacher,
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
		申请报名</h1>
	<form id="reg">
		<table align="left" border="0" width="340">
			<tbody>
				<tr>
					<td width="141">
						姓名：</td>
					<td width="189">
						<label><input id="tname" name="tname" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td>
						性别：</td>
					<td>
						<label><input checked="checked" name="tsex" type="radio" value="male" /> 男 <input name="tsex" type="radio" value="female" /> 女 </label></td>
				</tr>
				<tr>
					<td>
						学员类型：</td>
					<td>
						<label><select name="ttype" class="ttype">
								  <option value ="青年教师">青年教师</option>
								  <option value ="博士研究生">博士研究生</option>
								  <option value="硕士研究生">硕士研究生</option>
								  <option value="本科">本科</option>
								  <option value="其它">其它</option>
								</select>
 						</label>
 					</td>
				</tr>				
				<tr>
					<td>
						学校/工作单位：</td>
					<td>
						<label><input id="tschool" name="tschool" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td>
						学院：</td>
					<td>
						<label><input id="tacademy" name="tacademy" type="text" /> </label></td>
				</tr>
				<tr>
					<td>
						专业：</td>
					<td>
						<label><input id="tmajor" name="tmajor" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td>
						年级/工作年限：</td>
					<td>
						<label><input id="tgrade" name="tgrade" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td width="141">
						研究方向：</td>
					<td width="189">
						<label><input id="tresearch" name="tresearch" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td width="141">
						电子邮箱：</td>
					<td width="189">
						<label><input id="temail" name="temail" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td width="141">
						联系号码：</td>
					<td width="189">
						<label><input id="ttel" name="ttel" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td width="141">
						导师：</td>
					<td width="189">
						<label><input id="tteacher" name="tteacher" type="text" /> </label><font color="#ff8080">  *</font></td>
				</tr>
				<tr>
					<td width="141">
						身份证号：</td>
					<td width="189">
						<label><input id="tidcard" name="tidcard" type="text" /> </label> <font color="#ff8080">  *</font> </td>
				</tr>
				<tr>
					<td>
						<label><input id="regbutton" name="Submit" type="button" value="提交" /> </label></td>
					<td>
						<label><input name="Submit2" type="reset" value="重置" /> </label></td>
				</tr>
			</tbody>
		</table>
		<br />
	<font color="#ff8080" size="3"><strong>&nbsp;<div align="center" id="regresult"></div></strong></font>
	</form>
</div>
<p>
	&nbsp;</p>
</html>