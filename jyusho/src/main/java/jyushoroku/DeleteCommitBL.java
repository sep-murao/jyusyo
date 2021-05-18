package jyushoroku;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCommitBL
 */
@WebServlet("/DeleteCommitBL")
public class DeleteCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connect = null;
	    static final String URL = "jdbc:mysql://localhost/jyusyoroku_s?useUnicode=true&characterEncoding=utf8";
	    static final String USERNAME = "root";
	    static final String PASSWORD = ""; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommitBL() {
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
		 request.setCharacterEncoding("UTF-8");			//日本語文字コード リクエスト前に記入
		 Connection connect = null;
		 PreparedStatement stmt = null;
		
		 String id = request.getParameter("id");

		 
		 try {
		 Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = connect.prepareStatement(
			"UPDATE jyusyoroku SET delete_flg ='1' WHERE id=?;");
			
			stmt.setString(1, id);
		    
		   int rs = stmt.executeUpdate();
			 
		 } catch(Exception e){
				e.printStackTrace();
	}
	
		 request.getRequestDispatcher("/ListBL").forward(request, response);
		 
}
	
}

