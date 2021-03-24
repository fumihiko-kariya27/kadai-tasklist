package controllers;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DButil;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EntityManager em = DButil.createEntityManager();

		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		List<Message> message = em.createNamedQuery("getAllMessages", Message.class).setFirstResult(10 * (page - 1))
				.setMaxResults(10).getResultList();

		long messages_count=(long)em.createNamedQuery("getMessageCount", Long.class).getSingleResult();

		em.close();

		request.setAttribute("message", message);
		request.setAttribute("messages_count", messages_count);
		request.setAttribute("page", page);

		if (request.getSession().getAttribute("flush") != null) {
			request.setAttribute("flush", request.getSession().getAttribute("flush"));
			request.getSession().removeAttribute("flush");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/messages/index.jsp");
		rd.forward(request, response);
	}

}
