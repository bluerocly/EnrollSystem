<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Student> list = (List)request.getAttribute("list");
%>

<html>
<head>
<title>无标题文档</title>
<link rel="stylesheet" href="css.css" type="text/css">
<script language="JavaScript">

function update(keyword)
{
	window.location.href = "UUServlet?method=update&id=" + keyword;
}

function updateD(keyword)
{
	window.location.href = "UUServlet?method=updateD&id=" + keyword;
}
function del(keyword)
{
	window.location.href = "UUServlet?method=delete&id="+keyword;
}

</script>
</head>
	<body><div align="center"><div align="center"> 
		<font size="5"><strong>报名学员名单</strong></font></div> 
		</div><table width="800" height="94" align="center"><br>
		<tr>
				<td align="center"><strong> 
					姓名 
				</strong></td>
				<td align="center"><strong> 
					性别 
				</strong></td>				
				<td align="center"><strong> 
					学员类型 
				</strong></td>			
				<td align="center"><strong> 
					学校/工作单位
				</strong></td>
				<td align="center"><strong> 
					学院 
				</strong></td>				
				<td align="center"><strong> 
					专业 
				</strong></td>
					<td align="center"><strong> 
					年级/工作年限 
				</strong></td>			
				<td align="center"><strong> 
					研究方向 
				</strong></td>
				<td align="center"><strong> 
					电子邮箱 
				</strong></td>	
				<td align="center"><strong> 
					联系号码 
				</strong></td>
				<td align="center"><strong> 
					导师 
				</strong></td>	
				<td align="center"><strong> 
					身份证号 
				</strong></td>															
				<td align="center"><strong> 
					报名时间 
				</strong></td>						
				<td align="center"><strong> 
					是否录取 
				</strong></td>				
				<td align="center"><strong>操作</strong></td>
			</tr>
			<% if(list!=null) { for(Student st : list) { %>
				<tr>
				<td>
					<%=st.getName() %>
				</td>
				<td>
					<%=st.getSex() %>
				</td>				
				<td>
					<%=st.getType() %>
				</td>				
				<td>
					<%=st.getSchool() %>
				</td>
				<td>
					<%=st.getAcademy() %>
				</td>
				<td>
					<%=st.getMajor() %>
				</td>	
				<td>
					<%=st.getGrade() %>
				</td>													
				<td>
					<%=st.getResearch() %>
				</td>
				<td>
					<%=st.getEmail() %>
				</td>
				<td>
					<%=st.getTel() %>
				</td>
				<td>
					<%=st.getTeacher() %>
				</td>												
				<td>
					<%=st.getIdcard() %>
				</td>				
				<td>
					<%=st.getAddtime() %>
				</td>				
				<td>
					<%=st.getIsAccept() %>
				</td>				
				<td><a  href="javascript:update('<%=st.getId()%>')">录取</a> <a  href="javascript:updateD('<%=st.getId()%>')">不录取</a>　<a href="javascript:del('<%=st.getId()%>')">删除</a></td>
			</tr>
			<% } }%>
		</table>
		<div align="center"><a href="UUServlet?method=excel">导出Excel</a></div>
	</body>
</html>
