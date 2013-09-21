package it.paolo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement query;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		connessioneDB();
		String username = request.getParameter("UserName");
		String password = request.getParameter("Password");
		String nome = null;
		try {
			query = connection
					.prepareStatement("SELECT * from admin WHERE (username , password) = ('"+username+"' , '"+password+"')");
			ResultSet results = query.executeQuery();
			
			while(results.next()){
				
				nome = results.getString("nome");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.getRequestDispatcher( "index.html" ).forward(request,response);
			//e.printStackTrace();
		}
		
		if(nome==null){
			
			request.setAttribute("Errore", "yes");
			request.getRequestDispatcher( "index.jsp" ).forward(request,response);
			
		}else{
			

			request.setAttribute("UserName", nome);
			request.getRequestDispatcher( "books.jsp" ).forward(request,response);
			
		}
		
		
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

}
