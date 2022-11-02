<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%
	BoardDAO dao = new BoardDAO();

	Map<String, Object> param = new HashMap<String, Object>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	Integer searchInt = (Integer) session.getAttribute("search"); // search 이라는 세션 값을 불러옴
	
	if(searchInt == null){
		searchInt = 5;
	}
	
	if(request.getParameter("search") != null){
		searchInt = Integer.parseInt(request.getParameter("search"));
		session.setAttribute("search", searchInt);
	}
	
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);
	int total = totalCount;
	String page1 = request.getParameter("page");
	
	if(page1 == null){
		page1 = "1";
	}
		
	int result = total / searchInt ;
	if(result % searchInt >= 0){
		result += 1;
	}
	
	int first = Integer.parseInt(page1);
	List<BoardDTO> boardLists = dao.selectList(param,(first-1)*searchInt,searchInt);
	
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>   
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="Link.jsp" />  <!-- 공통 링크 -->
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>게시판</b></h1>
		</div> 
   	</div>
   	
  	 <div class="container">
		<div class="row" >
    <form method="get">  
    <table class = "table table-striped" style = "text-align: center; border:1px solid #dddddd; width:100%; margin-left: 300px;">
    <tr>
        <td align="center"  style="background-color : #D9E5FF">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" maxlength="50"/>
            <input type="submit" value="검색하기" class="btn btn-primary "/>
	 </td>
    </tr>  
    </table>
    </form>
    	</div>
    </div>
     
    <!-- 임시 선택숫자 -->
    
    <form method = "post" action="List.jsp">
    <table style = "width:93%; margin-left: 500px; margin-bottom: 10px;  ">
    <tr>
    	<td> <b>전체 게시글 수 : <%= totalCount %></b></td>
        <td>
            <select name="search"> 
                <option value="5" <%= searchInt == 5 ? "selected" : "" %>>5개</option> 
                <option value="10" <%= searchInt == 10 ? "selected" : "" %>>10개</option>
                <option value="15" <%= searchInt == 15 ? "selected" : "" %>>15개</option>
                <option value="20" <%= searchInt == 20 ? "selected" : "" %>>20개</option>
            </select>
            <button type="submit" id="id_btn_reset" class="btn btn-primary">적용</button> 
        </td>
    </tr>   
    </table>
    </form>
    	
    

    <div class="container">
		<div class="row" align="center">
    <!-- 게시물 목록 테이블(표) -->
    <table class = "table table-striped" style="text-align: center; border:1px solid #dddddd; align:center; " >
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용 --> 
<%
if (boardLists.isEmpty()) {
    // 게시물이 하나도 없을 때 
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
    // 게시물이 있을 때 
    for (BoardDTO dto : boardLists)
    {
%>
        <tr align="center">
            <td><%= dto.getNum() %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                <a href="view.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getId() %></td>          <!--작성자 아이디-->
            <td align="center"><%= dto.getVisitcount() %></td>  <!--조회수-->
            <td align="center"><%= dto.getPostdate() %></td>    <!--작성일-->
        </tr>
<%
    }
}
%>
    </table>
    <div class="container">
		<div class="row" align="center">
			<table style="width: 100%; margin-left: 80px;" >
				<tr>
					<td align="center">
						<ul class="pagination">
							<% if(searchField != null && searchWord != null){%>
								<li><a href="List.jsp?page=1&searchField=<%=searchField %>&searchWord=<%=searchWord%>"><span>«</span></a></li>
							<%
							} else {
							%>
								<li><a href="List.jsp?page=1"><span>«</span></a></li>
							<%
							}
							%>
							<%
							for(int i = 1; i <= result; i++){
								if(searchField != null && searchWord != null){ // searchFiled 랑 searchWord 가 널이 아닐때(둘 다)
							%>
									<li class="<%= first == i ? "active" : "" %>"><a href="List.jsp?page=<%= i %>&searchField=<%=searchField%>&searchWord=<%=searchWord%>"><%= i %></a></li>
							<%
								} else{
							%>
									<li class="<%= first == i ? "active" : "" %>"><a href="List.jsp?page=<%= i %>"><%= i %></a></li>
							<%
								}
							}
							%>
							<% if(searchField != null && searchWord != null){%>
							<li><a href="List.jsp?page=<%=result%>&searchField=<%=searchField%>&searchWord=<%=searchWord%>"><span>»</span></a></li>
							<%
							} else {
							%>
							<li><a href="List.jsp?page=<%=result%>"><span>»</span></a></li>
							<%
							}
							%>
						</ul>
					</td>
					<% if(session.getAttribute("user") == null){} else{ %>
					<td  align="right" width="70px;">
						<input type="button"  onclick="location.href='Write.jsp';" class="btn btn-primary " value="글쓰기"/>
					</td>
					<%} %>
				</tr>
			</table> 
		</div>
	</div>
		</div>
			<hr>
			<jsp:include page="footer.jsp"/>
		</div>

</body>
</html>