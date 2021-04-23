package jyushoroku;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBL
 */
@WebServlet("/EditBL")
public class EditBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   Connection conn =null;
	    static final String URL = "jdbc:mysql://localhost/jyusyoroku_s";
	    static final String USERNAME = "root";
	    static final String PASSWORD = "";    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBL() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		// TODO Auto-generated method stub
		//doGet(request, response);
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
    	String name = request.getParameter("name");
    	String address = request.getParameter("address");
    	String tel = request.getParameter("tel");
    	
    	String errmsg = Cmmon.getError(name,address,tel);
    	
    	String categoryid = request.getParameter("categoryid");
    	
    	/*Connection connect2 = null;
    	Statement stmt2 = null;
    	
    	try {
			Class.forName("com.mysql.jdbc.Driver");
		connect2 = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		 stmt2 = connect2.createStatement();
		 
		 String getQuery ="select categoryid,categoryname from category order by categoryid ASC";
			
		 rs = stmt.executeQuery(getQuery);
    			
    	} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
    	*/
    	request.setAttribute("id", id);
    	request.setAttribute("name", name);
    	request.setAttribute("address", address);
    	request.setAttribute("tel", tel);
    	request.setAttribute("categoryid", categoryid);
    	request.setAttribute("errmsg", errmsg);
    	
    	//request.getRequestDispatcher("/Add.jsp").forward(request, response);
   
    	
    	
    	if(errmsg != null) {
    		request.getAttribute(errmsg);
    		request.getRequestDispatcher("/Edit.jsp").forward(request, response);
    	}else
    		request.getRequestDispatcher("/EditCheck.jsp").forward(request, response);

    	
	}

}