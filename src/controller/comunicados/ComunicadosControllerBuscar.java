package controller.comunicados;


import java.io.IOException;
import java.util.List;
import controller.PMF;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.Kids;
import model.entity.User;

public class ComunicadosControllerBuscar extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//resp.setContentType("text/plain");
		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query q = pm.newQuery(Kids.class);
		
		if( req.getParameter("grado")!="todos" ){
			
			String grado = req.getParameter("grado");
			try{
				
				@SuppressWarnings("unchecked")
				String query1 = "select from " + Kids.class.getName() + " where grado=='" + grado + "'";
				List<Kids> kids = (List<Kids>) pm.newQuery(query1).execute();
				req.setAttribute("kids", kids);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Views/Comunicados/add.jsp");
				RequestDispatcher dr = getServletContext().getRequestDispatcher("/comunicados/add");
				rd.forward(req, resp);
				dr.forward(req, resp);
			
			}catch(Exception e){
				System.out.println(e);
			}finally{
				q.closeAll();
				pm.close();
			}
		}
		else{
			String query = "select from " + Kids.class.getName();

			List<Kids> niños = (List<Kids>) pm.newQuery(query).execute();

			// pasar la lista al jsp
			req.setAttribute("kids", niños);

			RequestDispatcher var = getServletContext()
					.getRequestDispatcher("/WEB-INF/Views/Comunicados/add.jsp");
			RequestDispatcher dr = getServletContext().getRequestDispatcher("/comunicados/add");
			var.forward(req, resp);
			dr.forward(req, resp);
		}
	}
}