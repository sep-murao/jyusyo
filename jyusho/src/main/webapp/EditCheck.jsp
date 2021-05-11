<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jyushoroku.EditBL"%>
<%@page import= "jyushoroku.Cmmon"%>
    
 <%  
     String id =(String)request.getAttribute("id");
     String name =(String)request.getAttribute("name");
     String address =(String)request.getAttribute("address");
     String tel =(String)request.getAttribute("tel");
     String categoryid =(String)request.getAttribute("categoryid");
     String categoryname = Cmmon.getCategoryName(categoryid);     
     
 %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Check.css">
<meta charset="UTF-8">
<title>EditCheck</title>


</head>
<body>
<h2>住所録管理システム：住所録変更</h2>

<div class="table2">
名前*：<%= name %><br>
住所*：<%=address%><br>
電話番号：<%=tel%><br>
カテゴリ:<%= categoryname %><br>
</div>
<form action="EditCommitBL" method="Post">
<input type="hidden" name="id" value=<%= id %>>
<input type="hidden" name="name" value=<%= name %>>
<input type="hidden" name="address" value=<%=address%>>
<input type="hidden" name="tel" value=<%=tel%>>
<input type="hidden" name="categoryid" value=<%= categoryid %>>

<div class=botan2> 
<input type="submit" value="確認" style="width:150px" id="button">
</form>

<!-- actionでデータを送信する。hiddenに送るデータを格納  -->
<form method="GET" action="Edit.jsp" name="seni2">
<input type="hidden" name="id" value=<%= id %>>
<input type="hidden" name="name" value=<%= name %>>
<input type="hidden" name="address" value=<%=address%>>
<input type="hidden" name="tel" value=<%=tel%>>
<input type="hidden" name="categoryid" value=<%= categoryid %>>

<input type="submit" value="戻る" style="width:150px" id="button2"> <!-- 戻るのtypeは保留 -->
</form>
</div>
</body>
</html>