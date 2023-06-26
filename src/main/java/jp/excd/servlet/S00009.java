package jp.excd.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class S00009 extends HttpServlet {

	public void doGet(
			HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException {
		
		getServletConfig().getServletContext().getRequestDispatcher("/ja/S00009.jsp").forward(request, response);
	}

	public void doPost(
			HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException {

		getServletConfig().getServletContext().getRequestDispatcher("/jsp/404.jsp").forward(request, response);
	}
}
