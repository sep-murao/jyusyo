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
  
  nowPage = (String)request.getAttribute("Page");
  listCnt = (int)request.getAttribute("listCnt");
  
  //maxPageに余りがあった時
  maxPage = listCnt / 10;
  int DivisionMaxPage = listCnt % 10;
  
  if(!(DivisionMaxPage == 0)){
	  maxPage ++;
  }
  
  if(maxPage == 0){
	  maxPage = 1;
  }
  
  rs = (ResultSet)request.getAttribute("Result");

  
  try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jyusyoroku_s","root","");
      
      stmt = con.createStatement();

     //内部結合は全項目セレクト
      String sql = "select * from jyusyoroku inner join category on jyusyoroku.categoryid = category.categoryid ";
      
      
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

<!-- 新規登録 -->
<form method="POST" action="Add.jsp" name="">
<input type="submit" value="新規登録" style="width:150px" id="">
</form>


<!--検索ボタン -->
<div class=kensaku>
<form method="GET" action="ListBL" name="">
	住所：
	<input type="text" name="SeachName" value=>
	<p><input type="submit" value="検索" style="width:153px" id="">
</form>
</div>

<!-- ページング -->

<ul class="Paging">

<%int now = Integer.parseInt(nowPage); %>
		
		<!-- Page=1 の時文字列にする -->
	<%if(now == 1){ %>
	<li> << </li>
	<li> < </li>
	
	<%}else{ %>
	<li> <a href= "ListBL?Page=1 " > << </a> </li>
	<li> <a href= "ListBL?Page=<%=now - 1 %>" > < </a> </li>
	<%} %>
	

		<!--ページ数が１か２の時 -->
	 <%if(now == 1 || now == 2){
	 
		    for (int i = 1; i <= 5; i++){        // 5になるまで1を足して繰り返す
		    	
		    	if(i <= maxPage){                  // maxPageよりiが大きいと表示しない
		    	
			    	if(i == now){                    // 見ているページ数とiが同じ場合リンクを生成しない %> 
			    	<li> <%=i %></li>
			    	
			    	<% }else{%>
			        <li> <a href= "ListBL?Page=<%=i %>" ><%=i%></a> </li>
				<% }
		    	}
	 }%>

		<!--ページ数が３～(maxPage - 2)の時 -->
	<%}else if( now >= 3 && now <= maxPage - 2  ){
	    for (int i = now -2 ; i <= now +2; i++){        // now - 2になるまで1を足して繰り返す
	    	
	    	if(i <= maxPage){                  // maxPageよりiが大きいと表示しない
	    	
		    	if(i == now){                    // 見ているページ数とiが同じ場合リンクを生成しない %> 
		    	<li> <%=i %></li>
		    	
			    	<% }else{%>
			        <li> <a href= "ListBL?Page=<%=i %>" ><%=i%></a> </li>
				<% }
	    	}
	
	    }
	
	%>
		<!--ページ数が最終ぺージか最終ページ1つ前の時 -->	
	<%}else{ 
	    for (int i = maxPage -4 ; i <= maxPage; i++){        // now - 2になるまで1を足して繰り返す
	    	
	    	if(1 <= i){                  // maxPageよりiが大きいと表示しない
	    	
		    	if(i == now){                    // 見ているページ数とiが同じ場合リンクを生成しない %> 
		    	<li> <%=i %></li>
		    	
			    	<% }else{%>
			        <li> <a href= "ListBL?Page=<%=i %>" ><%=i%></a> </li>
				<% }
	    	}
	
	    }
	} %>
	
		<!-- Page=maxPage の時文字列にする -->
	<%if(now == maxPage){%>
	<li> > </li>
	<li> >> </li>
	
	<%}else{ %>
	<li> <a href= "ListBL?Page=<%=now + 1 %>" > > </a> </li>
	<li> <a href= "ListBL?Page=<%=maxPage %>" > >> </a> </li>
	<%} %>
</ul>

<!-- 表一覧 -->
<table border="2" style="border-collapse: collapse">
	<tr>
		<th>No.</th>
		<th>名前</th>
		<th>住所</th>
		<th>電話番号</th>
		<th>カテゴリ</th>
		<th colspan="2"></th>
	</tr>
	 <%while(rs.next()) {
		 int id = rs.getInt("id");
	     String name = rs.getString("name");
	     String address = rs.getString("address");
		 String tel = rs.getString("tel");
		 
		 if(!(tel.equals(""))) {
	     
	     //ハイフンを付ける
	     String tel4 = tel.substring(0,3);
		 String tel5 = tel.substring(3,7);
		 String tel6 = tel.substring(7,11);
		 
		 tel = tel4 + "-" + tel5 + "-" + tel6;
	     //電話番号はString 
		 }
	     
	     String categoryname = rs.getString("categoryname");
	     String categoryid = rs.getString("categoryid");
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

<!-- ページング -->

<ul class="Paging">

<% now = Integer.parseInt(nowPage); %>
		
		<!-- Page=1 の時文字列にする -->
	<%if(now == 1){ %>
	<li> << </li>
	<li> < </li>
	
	<%}else{ %>
	<li> <a href= "ListBL?Page=1 " > << </a> </li>
	<li> <a href= "ListBL?Page=<%=now - 1 %>" > < </a> </li>
	<%} %>
	

		<!--ページ数が１か２の時 -->
	 <%if(now == 1 || now == 2){
	 
		    for (int i = 1; i <= 5; i++){        // 5になるまで1を足して繰り返す
		    	
		    	if(i <= maxPage){                  // maxPageよりiが大きいと表示しない
		    	
			    	if(i == now){                    // 見ているページ数とiが同じ場合リンクを生成しない %> 
			    	<li> <%=i %></li>
			    	
			    	<% }else{%>
			        <li> <a href= "ListBL?Page=<%=i %>" ><%=i%></a> </li>
				<% }
		    	}
	 }%>

		<!--ページ数が３～(maxPage - 2)の時 -->
	<%}else if( now >= 3 && now <= maxPage - 2  ){
	    for (int i = now -2 ; i <= now +2; i++){        // now - 2になるまで1を足して繰り返す
	    	
	    	if(i <= maxPage){                  // maxPageよりiが大きいと表示しない
	    	
		    	if(i == now){                    // 見ているページ数とiが同じ場合リンクを生成しない %> 
		    	<li> <%=i %></li>
		    	
			    	<% }else{%>
			        <li> <a href= "ListBL?Page=<%=i %>" ><%=i%></a> </li>
				<% }
	    	}
	
	    }
	
	%>
		<!--ページ数が最終ぺージか最終ページ1つ前の時 -->	
	<%}else{ 
	    for (int i = maxPage -4 ; i <= maxPage; i++){        // now - 2になるまで1を足して繰り返す
	    	
	    	if(1 <= i){                  // maxPageよりiが大きいと表示しない
	    	
		    	if(i == now){                    // 見ているページ数とiが同じ場合リンクを生成しない %> 
		    	<li> <%=i %></li>
		    	
			    	<% }else{%>
			        <li> <a href= "ListBL?Page=<%=i %>" ><%=i%></a> </li>
				<% }
	    	}
	
	    }
	} %>
	
		<!-- Page=maxPage の時文字列にする -->
	<%if(now == maxPage){%>
	<li> > </li>
	<li> >> </li>
	
	<%}else{ %>
	<li> <a href= "ListBL?Page=<%=now + 1 %>" > > </a> </li>
	<li> <a href= "ListBL?Page=<%=maxPage %>" > >> </a> </li>
	<%} %>
</ul>



<form method="POST" action="Add.jsp" name="">
<input type="submit" value="新規登録" style="width:150px" id="">
</form>

</body>
</html>