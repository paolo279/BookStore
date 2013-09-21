package it.paolo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DelToStoreServlet
 */
@WebServlet("/elimina")
public class DelToStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement query;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelToStoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
protected void connessioneDB(){
		
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/book", "root", "" );
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		connessioneDB();
		
		if(request.getParameterMap().containsKey("isbn"))
		{
			
			String isbn = request.getParameter("isbn");
			try {
				query = connection
						.prepareStatement("DELETE from libri WHERE (isbn) = "+isbn);
				query.execute();
				
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("del", isbn);
		 
			 request.getRequestDispatcher( "lsLibri.jsp" ).forward(request,response);
			
		}
		
		if(request.getParameterMap().containsKey("editore")){
			
			String editore = request.getParameter("editore");
			try {
				query = connection
						.prepareStatement("DELETE from editori WHERE (editoreID) = "+editore);
				query.execute();
				
				query = connection
						.prepareStatement("DELETE from libri WHERE (editore) = "+editore);
				query.execute();
				
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("del", editore);
		 
			 request.getRequestDispatcher( "lsEditori.jsp" ).forward(request,response);
			
		}
		
		if(request.getParameterMap().containsKey("autore")){
			
			String autore = request.getParameter("autore");
			try {
				query = connection
						.prepareStatement("DELETE from autori WHERE (autoreID) = "+autore);
				query.execute();
				
				query = connection
						.prepareStatement("DELETE from libri WHERE (autore) = "+autore);
				query.execute();
				
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("del", autore);
		 
			 request.getRequestDispatcher( "lsAutori.jsp" ).forward(request,response);
			
		}
		
		if(request.getParameterMap().containsKey("utente")){
			
			String utente = request.getParameter("utente");
			try {
				query = connection
						.prepareStatement("DELETE from utenti WHERE (username) = '"+utente+"'");
				query.execute();

				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("del", utente);
		 
			 request.getRequestDispatcher( "lsUtenti.jsp" ).forward(request,response);
			
		}
		
		if(request.getParameterMap().containsKey("admin")){
			
			String utente = request.getParameter("admin");
			try {
				query = connection
						.prepareStatement("DELETE from admin WHERE (username) = '"+utente+"'");
				query.execute();

				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("del", utente);
		 
			 request.getRequestDispatcher( "lsAdmin.jsp" ).forward(request,response);
			
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
