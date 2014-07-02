<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Student> list = (List)request.getAttribute("list");
System.out.println("list.size() = "+list.size());
%>
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 6px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>

<div align="center">
<!-- <div align="center"> 
		<font size="5"><strong>录取学员名单</strong></font></div> 
		 -->
		 <div align="left"><h1>录取学员名单</h1></div>
		</div><table class="gridtable" width="100%" height="100%" align="center" style="margin-top: 20px;">
<tr>
	<th>姓名</th><th>学校/工作单位</th><th>专业</th><th>录取类型</th>
</tr>

			<% for(Student st : list) { %>
				<tr>
				<td>
					<%=st.getName() %>
				</td>
				<td>
					<%=st.getSchool() %>
				</td>
				<td>
					<%=st.getMajor() %>
				</td>				
				<td>
					<%=st.getIsAccept() %>
				</td>				
			</tr>
			<% }%>
		</table>
