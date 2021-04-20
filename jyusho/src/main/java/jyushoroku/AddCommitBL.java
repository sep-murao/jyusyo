package jyushoroku;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class AddCommitBL
 */
@WebServlet("/AddCommitBL")
public class AddCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connect = null;
	    static final String URL = "jdbc:mysql://localhost/jyusyoroku_s";
	    static final String USERNAME = "root";
	    static final String PASSWORD = ""; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommitBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 
		 String name = request.getParameter("name");
		 String address = request.getParameter("address");
		 String tel = request.getParameter("tel");
		 String categoryid = request.getParameter("categoryid");
		 
		 try {
		 Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = connect.prepareStatement(
			"insert into jyusyoroku (name,address,tel,categoryid)values(?,?,?,?)");
		
			stmt.setString(1, name);
   		    stmt.setString(2, address );
   		    stmt.setString(1, tel );
		    stmt.setString(2, categoryid );
		    
		     int rs = stmt.executeUpdate();
			 
		 } catch(Exception e){
				e.printStackTrace();
	}
		// return rs;
}
	
}

