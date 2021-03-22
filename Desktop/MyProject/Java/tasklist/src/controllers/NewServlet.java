package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DButil;

/**
 * Servlet implementation class NewServlet
 */
@WebServlet("/new")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EntityManager em = DButil.createEntityManager();

		Message m = new Message();

		String content="hello";
		m.setContent(content);

		Timestamp currentTime=new Timestamp(System.currentTimeMillis());
		m.setCreated_at(currentTime);
		m.setUpdated_at(currentTime);

		em.getTransaction().begin();
		em.persist(m);
		em.Transaction().commit();

		response.getWriter().append(Integer.valueOf(m.getId()).toString());
		em.close();
	}

}
