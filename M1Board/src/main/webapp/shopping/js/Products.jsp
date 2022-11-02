<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "com.dto.Product" %>
<%@ page import ="java.sql.*" %>
<%@page import = "java.text.DecimalFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
        
<!DOCTYPE html>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/> 
<html>
	<head>
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<title>상품목록</title>
		 <style>
            .my_modal {
                display: none;
                width: 800px;
                padding: 20px 30px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
                overflow-x: hidden;
               	overflow-y: auto;
            }

            .my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
            }
            iframe{
            	width : 60vh; 
            	height: 70vh;
            	margin-top: 20px;
               
            	
            }
            button{
            	background-color:#008CBA; 
    			border: none;
    			padding: 10px 25px;
    			text-align: center;
    			text-decoration: none;
    			border-radius: 12px;
    			display: inline-block;
    			font-size: 16px;
    			}
    			
            .prewrap {
            	width: 330px;
            	height: 40px;
            	overflow:hidden;
            	word-break: break-word;
            	text-overflow:ellipsis;
            	font-size: 15px;
            	display: -webkit-box;
            	-webkit-line-clamp: 2;
            	-webkit-box-orient: vertical;
           }
           
        </style>
	</head>
	<body>
		<jsp:include page="Link.jsp"/>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3"><b>상품목록</b></h1>
			</div> 
   		</div>
   		<%
   			ArrayList<Product> listProducts = productDAO.getAllProducts();
   		%>
   		<c:set var="listOfProducts" value="<%=listProducts%>" />
		<div class="container">
			<div class="row" align="center">
				<%@ include file="dbconn.jsp"%>
				<%
					
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "select * from product";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
			
				%>
        		
				<div class="col-md-4" style="margin-bottom: 50px;">
						<img alt="이미지" src="resources/images/<%=rs.getString("filename") %>" style="width: 200px; height:200px; margin-top: 10px; ">
						<h3 style="font-weight: bold;"><%=rs.getString("pname")%></h3>
						<p class="prewrap"><%=rs.getString("description") %></p>
						<p><%=dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %>원</p>
							<div class="my_modal">
              				<iframe src="./product.jsp?id=<%=rs.getString("productID")%>" name="iframe" frameborder="0" scrolling="on"></iframe>
            			<a class="modal_close_btn">X</a>
        				</div>
						<div>
        					<button class ="btn btn-info" name="button" style="font-size: 16px;padding: 6px 30px;">상세정보</button>
        				</div>
				</div>
			
				<%
				}
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				%>
			</div>
			<hr>
		</div>
		<script>
            function modal(id, j) {
                var zIndex = 9999;
                var modal = document.getElementsByClassName(id)[j];
                var funcs = [];
                
                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                	
                    bg.remove();
                    modal.style.display = 'none';
                });

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }
            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };
            
            var elements = document.getElementsByClassName("btn btn-info");

            for (var i = 0; i < elements.length; i++) {
            	let j = i; // (?)
                elements[i].addEventListener('click', function () {
                	modal('my_modal', j)
                });
            }
            </script>
            <hr>
		<jsp:include page="footer.jsp"/>
	</body>
</html>