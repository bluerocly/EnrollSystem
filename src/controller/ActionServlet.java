package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Testao;

import bean.Student;

public class ActionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response)

	throws ServletException, IOException {
		System.out.println("in ActionServlet.service...");
		request.setCharacterEncoding("utf-8");
		Testao dao = new Testao();
		String method = request.getParameter("method");
		if(method!=null && method.length()>0 && "search".equalsIgnoreCase(method)) {
			String tidcard = request.getParameter("tidcard");
			String ttel = request.getParameter("ttel");
			String status = dao.getStatusById(tidcard,ttel);
			String msg = "";
			if(status==null) {
				msg = "学员未报名或查询信息不正确，请核对！";
			} else{
				if("Y".equalsIgnoreCase(status)) {
					msg = "已录取!";
				} else if("N".equalsIgnoreCase(status)) {
					msg = "报名已成功，正在录取审核中！";
				} else if("D".equalsIgnoreCase(status)) {
					msg = "未被录取，谢谢关注！";
				} else {
					System.out.println("!!!!not contain  = " + status);
				}
			}
			System.out.println("!!!!msg  = " + msg);
			request.setAttribute("info", msg);
			request.getRequestDispatcher("zinfo.jsp").forward(request,
					response);
		} else {
			Student st = new Student();
			String tname = request.getParameter("tname");
			st.setName(tname);
			String tsex = request.getParameter("tsex");
			st.setSex(tsex);
			String ttype = request.getParameter("ttype");
			st.setType(ttype);
			String tschool = request.getParameter("tschool");
			st.setSchool(tschool);
			String tacademy = request.getParameter("tacademy");
			st.setAcademy(tacademy);
			String tmajor = request.getParameter("tmajor");
			st.setMajor(tmajor);
			String tgrade = request.getParameter("tgrade");
			st.setGrade(tgrade);
			String tresearch = request.getParameter("tresearch");
			st.setResearch(tresearch);
			String temail = request.getParameter("temail");
			st.setEmail(temail);
			String ttel = request.getParameter("ttel");
			st.setTel(ttel);
			String tteacher = request.getParameter("tteacher");
			st.setTeacher(tteacher);
			String tidcard = request.getParameter("tidcard");
			st.setIdcard(tidcard);
			
			boolean isOK;
			try {
				isOK = dao.addStudent(st);
				if (isOK) {
					request.setAttribute("info", "恭喜你 " + tname + "， 报名成功！");
					request.getRequestDispatcher("zinfo.jsp").forward(request,
							response);
				} else {
					request.setAttribute("info", "报名失败！");
					request.getRequestDispatcher("zinfo.jsp").forward(request,
							response);
				}
			} catch (Exception e) {
				String errMsg = e.getMessage();
				if(e.getMessage().contains("Duplicate entry")) {
					errMsg = "你已报名，可通过“报名状态查询”查询状态！";
				} else {
					errMsg = "报名失败，" + e.getMessage();
				}
				System.out.println("errMsg = " + errMsg);
				request.setAttribute("info", errMsg);
				request.getRequestDispatcher("zinfo.jsp").forward(request, response);
			}
		}

	}

}