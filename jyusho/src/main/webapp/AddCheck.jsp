<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jyushoroku.AddBL"%>
<%@page import= "jyushoroku.Cmmon"%>
    
 <%  String name =(String)request.getAttribute("name");
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
<title>AddCheck</title>


</head>
<body>
<h2>住所録管理システム：住所録登録</h2>
<form action="AddCommitBL" method="Post">
<div class="table2">
名前*：<%= name %><br>
住所*：<%=address%><br>
電話番号：<%=tel%><br>
カテゴリ:<%= categoryname %><br>
</div>
<div class=botan2> 
<input type="submit" value="確認" style="width:150px" id="button">
</form>
<form method="GET" action="Add.jsp" name="seni2">
<input type="submit" value="戻る" style="width:150px" id="button2"> <!-- 戻るのtypeは保留 -->
</form>
</div>
</body>
</html>