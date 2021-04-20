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
     
     ResultSet rs = Cmmon.getCategoryAll();
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
<table>
   <tr><th>名前*：</th><td><input type="text" name="name" value=""></td></tr>
   <tr><th>住所*：</th><td><input type="text" name="address" style="width:250px; value=""></td></tr>
   <tr><th>電話番号：</th><td><input type="text" name="tel" value=""></td></tr>
   <tr><th>カテゴリ: </th><td><select name="categoryid" style="width:154px;" >
   <option value="0"></option>
   <% while(rs.next()) { %>
    <option value=<%=rs.getString("categoryid") %>><%=rs.getString("categoryname") %></option>
    <%}     %>
    </select>
    </td>
   </tr>
</table>


</div>
<div class=botan> 
<input type="submit" value="確認" style="width:150px" id="button">
</form>
<form method="POST" action="List.java" name="seni2">
<input type="submit" value="戻る" style="width:150px" id="button2"> <!-- 戻るのtypeは保留 -->
</form>
</div>
<p><%=request.getAttribute("errmsg") %></p>
</body>
</html>