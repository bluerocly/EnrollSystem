package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;

import dao.Testao;

public class AAListServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("in AAListServlet.service222...");
		Testao dao = new Testao();
		List<Student> acceptedStudents = dao.getAcceptedStudents();
		req.setAttribute("list", acceptedStudents);
		req.getRequestDispatcher("zslist.jsp").forward(req,resp);
	}
}