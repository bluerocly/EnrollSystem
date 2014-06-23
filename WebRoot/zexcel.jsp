<%@ page contentType="application/vnd.ms-excel; charset=gbk" %>
<%@ page language="java" import="java.util.*,bean.*"%>
<%
	List<Student> list = (List)request.getAttribute("list");
    String filename = new String(("报名学员列表").getBytes("GBK"),"ISO-8859-1"); 
    response.addHeader("Content-Disposition", "filename=" + filename + ".xls");
%>
<html>
<head>
    <meta name="Generator" content="Microsoft Excel 11">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body >
<center><b>报名学员列表</b></center><br>
<table width="800" height="94" align="center" border="1" cellpadding="0" cellspacing="1"><br>
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
			</tr>
			<% } }%>
		</table>
</body>
</html>