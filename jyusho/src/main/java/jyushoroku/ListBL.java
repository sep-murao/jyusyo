package jyushoroku;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListBL
 */
@WebServlet("/ListBL")
public class ListBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection conn =null;
    static final String URL = "jdbc:mysql://localhost/jyusyoroku_s?useUnicode=true&characterEncoding=utf8";
    static final String USERNAME = "root";
    static final String PASSWORD = "";  

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection connect = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String nowPage;
		int limitSta;
		int listCnt = 0;
		 request.setCharacterEncoding("UTF-8");
		
		if( (String)request.getParameter("Page")== null){
			nowPage = "1";
		}else {
			nowPage = request.getParameter("Page");
		}
		
		int nowPage2 = Integer.parseInt(nowPage);
		limitSta = (nowPage2 - 1)*10;
		
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
				connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				
				//全件数取得
				String CntQuery = "select count(*) cnt from jyusyoroku;";
				
				ps = connect.prepareStatement(CntQuery);
				rs = ps.executeQuery();
				rs.next();
				listCnt = rs.getInt("cnt");
				
		 } catch(Exception e){
				e.printStackTrace();
		 }

		 
		 if( (String)request.getParameter("SeachName")== null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				
				String SelectQuery = "select*from jyusyoroku inner join category on jyusyoroku.categoryid = category.categoryid where delete_flg = 0 limit ?,10; ";
				
				ps = connect.prepareStatement(SelectQuery);
				ps.setInt(1, limitSta);
				rs = ps.executeQuery();
			
		 }catch(Exception e){
				e.printStackTrace();
		 }
	
			
		 }else {
			 String SeachName = request.getParameter("SeachName");
			 
			 try {
					Class.forName("com.mysql.jdbc.Driver");
					connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					String SelectQuery = "select * from jyusyoroku inner join category on jyusyoroku.categoryid = category.categoryid where delete_flg = 0 and address like ? limit ?,10; ";

					
					ps = connect.prepareStatement(SelectQuery);
					ps.setString(1, SeachName + "%" );
					ps.setInt(2, limitSta);
					rs = ps.executeQuery();
				
			 }catch(Exception e){
					e.printStackTrace();
	             }
		
         }
		 request.setAttribute("listCnt", listCnt);
		 request.setAttribute("Result", rs);
		 request.setAttribute("page", nowPage);
		 
		 request.getRequestDispatcher("/List.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	
		 
		 
	}

}
		 

