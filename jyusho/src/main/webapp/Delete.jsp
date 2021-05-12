<%@page import= "jyushoroku.Cmmon"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% 
 
 String id = request.getParameter("id");
 String name = request.getParameter("name");
 String address = request.getParameter("address");
 String tel = request.getParameter("tel");
 String categoryid = request.getParameter("categoryid");
     
     String errmsg ="";
     
     ResultSet rs = Cmmon.getCategoryAll();
     String categoryname = Cmmon.getCategoryName(categoryid);  
     
     
 %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Delete.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
<meta charset="UTF-8">
<title>Edit</title>
</head>
<body>
<h2>下記住所録を削除します。よろしいですか？</h2>
<div class="table2">
名前*：<%= name %><br>
住所*：<%=address%><br>
電話番号：<%=tel%><br>
カテゴリ:<%= categoryname %><br>
</div>
<form action="DeleteCommitBL" method="Post">
<input type="hidden" name="id" value=<%= id %>>
<input type="hidden" name="name" value=<%= name %>>
<input type="hidden" name="address" value=<%=address%>>
<input type="hidden" name="tel" value=<%=tel%>>
<input type="hidden" name="categoryid" value=<%= categoryid %>>

</div>
<div class=botan> 
<input type="submit" value="確認" style="width:150px" id="button">
</form>
<form method="POST" action="ListBL" name="seni2">
<input type="submit" value="戻る" style="width:150px" id="button2"> <!-- 戻るのtypeは保留 -->
</form>
</div>
<p><%=errmsg %></p>
</body>
</html>