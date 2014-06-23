package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;

import dao.Testao;

public class UUServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Student> list = new ArrayList<Student>();
		System.out.println("in UUServlet.service2..." + list.size());
		String method = req.getParameter("method");
		String id = req.getParameter("id");
		Testao testao = new Testao();
		if("update".equalsIgnoreCase(method)) {
			testao.acceptStudent(id);
		} else if("delete".equalsIgnoreCase(method)) {
			testao.deleteStudent(id);
		} else if("updateD".equalsIgnoreCase(method)) {
			testao.denyStudent(id);
		}
		list = testao.getAllStudents();
		req.setAttribute("list", list);
		if("excel".equalsIgnoreCase(method)) {
			req.getRequestDispatcher("zexcel.jsp").forward(req,resp);
		} else {
			req.getRequestDispatcher("zsmanager.jsp").forward(req,resp);
		}
	}
}