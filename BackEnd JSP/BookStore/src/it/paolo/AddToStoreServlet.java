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
 * Servlet implementation class AddToStoreServlet
 */
@WebServlet("/add")
public class AddToStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement query;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToStoreServlet() {
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
		String tipo = request.getParameter("tipo");
		
		if (tipo.equals("Aggiungi Autore")){
			
			String nome = request.getParameter("nome");
			
			try {
				query = connection
						.prepareStatement("insert into autori (autoreNome) values ('"+nome+"')");
				query.execute();
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 request.setAttribute("autore", "yes");
			 
			 request.getRequestDispatcher( "lsAutori.jsp" ).forward(request,response);
		}
		
		
		
		if (tipo.equals("Aggiungi Editore")){
			
			String editoreNome = request.getParameter("nome");
			
			try {
				query = connection
						.prepareStatement("insert into editori (editoreNome) values ('"+editoreNome+"')");
				query.execute();
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("editore", "yes");
			 
			 request.getRequestDispatcher( "lsEditori.jsp" ).forward(request,response);
		}
		
		
		if (tipo.equals("Aggiungi Libro")){
			
			String titolo = request.getParameter("nome");
			String isbn = request.getParameter("isbn");
			String prezzo = request.getParameter("prezzo");
			String autore = request.getParameter("autore");
			String editore = request.getParameter("editore");
			String fotoUrl = request.getParameter("fotoUrl");
			String anteprimaUrl = request.getParameter("anteprimaUrl");
			
			try {
				query = connection
						.prepareStatement("INSERT INTO `libri` (`isbn`,`titolo`,`prezzo` ,`autore` ,`editore`,`fotoUrl` ,`anteprimaUrl`)VALUES('"+isbn+"' , '"+titolo+"' , '"+prezzo+"' , '"+autore+"' , '"+editore+"' , '"+fotoUrl+"' , '"+anteprimaUrl+"' );");
				query.execute();
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 request.setAttribute("libro", "yes");
			 
			 request.getRequestDispatcher( "lsLibri.jsp" ).forward(request,response);
		}
		
if (tipo.equals("Aggiungi Utente")){
			
			String nome = request.getParameter("nome");
			String user = request.getParameter("username");
			String paswd = request.getParameter("password");
			try {
				query = connection
						.prepareStatement("insert into utenti (nome,username,password) values ('"+nome+"','"+user+"','"+paswd+"')");
				query.execute();
				
				connection.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 request.setAttribute("utente", "yes");
			 
			 request.getRequestDispatcher( "lsUtenti.jsp" ).forward(request,response);
		}


if (tipo.equals("Aggiungi Admin")){
	
	String nome = request.getParameter("nome");
	String user = request.getParameter("username");
	String paswd = request.getParameter("password");
	try {
		query = connection
				.prepareStatement("insert into admin (nome,username,password) values ('"+nome+"','"+user+"','"+paswd+"')");
		query.execute();
		
		connection.close();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	 request.setAttribute("admin", "yes");
	 
	 request.getRequestDispatcher( "lsAdmin.jsp" ).forward(request,response);
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
