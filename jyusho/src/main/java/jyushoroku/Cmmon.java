package jyushoroku;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.regex.Pattern;
import java.sql.ResultSet;

public class Cmmon {
	private static final String ResultSet = null;
	
	   Connection conn =null;
	    static final String URL = "jdbc:mysql://localhost/jyusyoroku_s?useUnicode=true&characterEncoding=utf8";
	    static final String USERNAME = "root";
	    static final String PASSWORD = "";  

	    //エラー処理
	public static String getError(String name,String address,String tel) throws UnsupportedEncodingException{
		
		String ERRMSG_NAME01 ="名前は全角20文字以内で入力してください";
		String ERRMSG_NAME02 ="名前は必須項目です";
		String ERRMSG_ADDRESS01 ="住所は全角40文字以内で入力してください";
		String ERRMSG_ADDRESS02 ="住所は必須項目です";
		String ERRMSG_TEL ="電話番号は「000-0000-0000」の形式で入力してください";
		String returnVal = null;
		Pattern p=Pattern.compile("^\\d{3}-\\d{4}-\\d{4}$");
		
	try {
			
		if(name.getBytes("UTF-8").length>40) {
			returnVal = ERRMSG_NAME01+"<br>";
			
		}else if(name.getBytes("UTF-8").length==0) {
			returnVal = ERRMSG_NAME02+"<br>";
			
		}else if(address.getBytes("UTF-8").length>80) {
			returnVal = ERRMSG_ADDRESS01+"<br>";
			
		}else if(address.getBytes("UTF-8").length==0) {
			returnVal = ERRMSG_ADDRESS02+"<br>";
			
		} else if(tel.getBytes("UTF-8").length> 0 && !(p.matcher(tel).find())) {
			returnVal = ERRMSG_TEL+"<br>";	
			}
				
				
	} catch (UnsupportedEncodingException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
		
		

	}
	return returnVal;
	

}
   //プルダウン カテゴリー表示
	public static ResultSet getCategoryAll()	{
	 Connection connect = null;
	 Statement stmt = null;
	 ResultSet rs =null;
	 
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		 stmt = connect.createStatement();
		 
		 String getQuery ="select categoryid,categoryname from category order by categoryid ASC";
		
		 rs = stmt.executeQuery(getQuery);
	} catch(Exception e){
		e.printStackTrace();
	}
	
	 
	return rs;

	}
	
	public static String getCategoryName(String id) {
	 Connection connect = null;
	 PreparedStatement ps = null;
	 String categoryname = null;
	 ResultSet rs = null;
	 try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			String getQuery ="select categoryid,categoryname from category where categoryid = ? ";
			ps = connect.prepareStatement(getQuery);
		    ps.setString(1, id );
			 
			 rs = ps.executeQuery();
			
			 while(rs.next()) {
				 categoryname=rs.getString("categoryname");
			 }
			 
			
		} catch(Exception e){
			e.printStackTrace();
		}
	 return categoryname;
	}
	
	
}
