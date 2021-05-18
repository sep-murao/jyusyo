<%@page import= "jyushoroku.Cmmon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jyushoroku.AddBL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%  String name =null;
     String address =null;
     String tel =null;
     String categoryid =null;
     String errmsg ="";
     
     //カテゴリをプルダウンで表示するためにCmmon.javaでDBから昇順に取ってくる
     ResultSet rs = Cmmon.getCategoryAll();
     
     if( (String)request.getAttribute("name")== null){
    	 
    	 if(request.getParameter("name")== null){
   
    	 name ="";
    	 address ="";
    	 tel ="";
    	 categoryid ="";
    	 errmsg ="";
    	 //新規登録の選択肢
    	 
    	 }else{
    	     	name= request.getParameter("name");
    	     	address= request.getParameter("address");
    	     	tel= request.getParameter("tel");
    	     	categoryid= request.getParameter("categoryid");
    	     	errmsg ="";
    	     	//確認画面から戻った時
    	 }
     }else{
    	name= (String)request.getAttribute("name");
     	address= (String)request.getAttribute("address");
     	tel= (String)request.getAttribute("tel");
     	categoryid= (String)request.getAttribute("categoryid");
     	errmsg= (String)request.getAttribute("errmsg");
     	//エラーが出た時
     }
 %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Add.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
<meta charset="UTF-8">
<title>Add</title>
</head>
<body>
<h2>住所録管理システム：住所録登録</h2>
<form action="AddBL" method="Post">
<div class="table">

<!-- jspでjavaの変数を格納する時は % で囲む -->
<table>
   <tr><th>名前*：</th><td><input type="text" name="name" value=<%=name %>></td></tr>
   <tr><th>住所*：</th><td><input type="text" name="address" style="width:250px;" value=<%=address %>></td></tr>
   <tr><th>電話番号：</th><td><input type="text" name="tel" value=<%=tel %>></td></tr>
   <tr><th>カテゴリ: </th><td><select name="categoryid" style="width:154px;" >
  <% while(rs.next()) { %>
 <%if( rs.getString("categoryid").equals(categoryid) ){ %>
   <option value=<%=rs.getString("categoryid") %> selected><%=rs.getString("categoryname") %></option>
     <%} %><%else{ %>
    <option value=<%=rs.getString("categoryid") %>><%=rs.getString("categoryname") %></option>
    <%}} %>
    </select>
    </td>
   </tr>
</table>


</div>
<div class=botan> 
<input type="submit" value="確認" style="width:150px" id="button">
</form>
<form method="POST" action="ListBL" name="seni2">
<input type="submit" value="戻る" style="width:150px" id="button2"> <!-- 戻るのtypeは保留 -->
</form>
</div>
<!-- errmsgの変数を呼び出してエラー文を表示 -->
<p><%=errmsg %></p>
</body>
</html>