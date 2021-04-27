<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jyushoroku.ListBL"%>
<%
  ResultSet rs = null;
  int listCnt = 0;
  String nowPage = null;
  int maxPage = 0;
  
  Statement stmt = null;
  Connection con = null;
  ResultSet rs2 = null;
  
  nowPage = (String)request.getAttribute("Page");
  listCnt = (int)request.getAttribute("listCnt");
  
  //maxPageに余りがあった時
  maxPage = listCnt / 10;
  int DivisionMaxPage = listCnt % 10;
  
  if(!(DivisionMaxPage == 0)){
	  maxPage ++;
  }
  
  rs = (ResultSet)request.getAttribute("Result");

  
  try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jyusyoroku_s","root","");
      
      stmt = con.createStatement();

     //内部結合は全項目セレクト
      String sql = "select * from jyusyoroku inner join category on jyusyoroku.categoryid = category.categoryid ";
      
      rs2 = stmt.executeQuery(sql);
      
  }catch(Exception e){
		e.printStackTrace();
   }
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="list.css">
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
<h2>住所録管理システム：住所録一覧</h2>

<form method="POST" action="Add.jsp" name="">
<input type="submit" value="新規登録" style="width:150px" id="">
</form>

<div class=kensaku>
<form method="GET" action="ListBL" name="">
	住所：
	<input type="text" name="SeachName" value=>
	<p><input type="submit" value="検索" style="width:153px" id="">
</form>
</div>

<!-- ページング -->



<table border="2" style="border-collapse: collapse">
	<tr>
		<th>No.</th>
		<th>名前</th>
		<th>住所</th>
		<th>電話番号</th>
		<th>カテゴリ</th>
		<th colspan="2"></th>
	</tr>
	 <%while(rs2.next()) {
		 int id = rs2.getInt("id");
	     String name = rs2.getString("name");
	     String address = rs2.getString("address");
	     //電話番号はString
	     String tel = rs2.getString("tel");
	     String categoryname = rs2.getString("categoryname");
	     String categoryid = rs2.getString("categoryid");
	 %>
	 <tr>
	 <!--  jspに渡すときはGET-->
	 <form method="GET" name="form_<%=id %>">
	 
	<input type="hidden" name="id" value=<%= id %>>
	<input type="hidden" name="name" value=<%= name %>>
	<input type="hidden" name="address" value=<%=address%>>
	<input type="hidden" name="tel" value=<%=tel%>>
	<input type="hidden" name="categoryid" value=<%= categoryid %>>
	
	 <td><%=id %></td>
	 <td><%=name %></td>
	 <td><%=address%></td>
	 <td><%=tel%></td>
	 <td><%=categoryname%></td>
	 <td><input type="submit" value="編集" style="width:50px" formaction="Edit.jsp"></td>
	 <td><input type="submit" value="削除" style="width:50px" formaction="Delete.jsp"></td>
	 </form>
	 </tr>
	  <%}%>
</table>

<!-- ページング  -->

<form method="POST" action="Add.jsp" name="">
<input type="submit" value="新規登録" style="width:150px" id="">
</form>

</body>
</html>