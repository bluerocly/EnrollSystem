<%@ page contentType="application/vnd.ms-excel; charset=gbk" %>
<%@ page language="java" import="java.util.*,bean.*"%>
<%
	List<Student> list = (List)request.getAttribute("list");
    String filename = new String(("����ѧԱ�б�").getBytes("GBK"),"ISO-8859-1"); 
    response.addHeader("Content-Disposition", "filename=" + filename + ".xls");
%>
<html>
<head>
    <meta name="Generator" content="Microsoft Excel 11">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body >
<center><b>����ѧԱ�б�</b></center><br>
<table width="800" height="94" align="center" border="1" cellpadding="0" cellspacing="1"><br>
		<tr>
				<td align="center"><strong> 
					���� 
				</strong></td>
				<td align="center"><strong> 
					�Ա� 
				</strong></td>				
				<td align="center"><strong> 
					ѧԱ���� 
				</strong></td>			
				<td align="center"><strong> 
					ѧУ/������λ
				</strong></td>
				<td align="center"><strong> 
					ѧԺ 
				</strong></td>				
				<td align="center"><strong> 
					רҵ 
				</strong></td>
					<td align="center"><strong> 
					�꼶/�������� 
				</strong></td>			
				<td align="center"><strong> 
					�о����� 
				</strong></td>
				<td align="center"><strong> 
					�������� 
				</strong></td>	
				<td align="center"><strong> 
					��ϵ���� 
				</strong></td>
				<td align="center"><strong> 
					��ʦ 
				</strong></td>	
				<td align="center"><strong> 
					���֤�� 
				</strong></td>															
				<td align="center"><strong> 
					����ʱ�� 
				</strong></td>						
				<td align="center"><strong> 
					�Ƿ�¼ȡ 
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