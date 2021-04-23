<%@page import= "jyushoroku.Cmmon"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% 
 
     /*
     String name =null;
     String address =null;
     String tel =null;
     String categoryid =null;
     
     //★☆★TODO 前画面からのリクエストを変数に格納★☆★
     */
     //動作確認用	--start
     String id = "1";
     String name ="村尾美波";
     String address ="平塚";
     String tel ="090-1111-2222";
     String categoryid ="1";
     //動作確認用	--end
     
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
<form method="POST" action="List.java" name="seni2">
<input type="submit" value="戻る" style="width:150px" id="button2"> <!-- 戻るのtypeは保留 -->
</form>
</div>
</body>
</html>