<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jyushoroku.ListBL"%>
<%
  ResultSet rs = null;
  int listCnt = 0;
  String nowPage = null;
  int maxPage = 0;
  
  nowPage = (String)request.getAttribute("Page");
  listCnt = (int)request.getAttribute("listCnt");
  
  //maxPageに余りがあった時
  maxPage = listCnt / 10;
  int DivisionMaxPage = listCnt % 10;
  if(!(DivisionMaxPage == 0)){
	  maxPage ++;
  }
  
  rs = (ResultSet)request.getAttribute("Result");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
<h2>住所録管理システム：住所録一覧</h2>
<form method="POST" action="Add.jsp" name="">
<input type="submit" value="新規登録" style="width:150px" id="">
</form>

<form method="POST" action="ListBL" name="">
住所：<input type="text" name="SeachName" value=>
<p><input type="submit" value="検索" style="width:150px" id=""></p>
</form>

<table>
 <%while(rs.next()) {%>
 <tr>
 <td><%id %></td>
 <td><%name %></td>
 <td><%address%></td>
 <td><%tel%></td>
 <td><%category%></td>
 </tr>
 <%} %>
</table>
</body>
</html>