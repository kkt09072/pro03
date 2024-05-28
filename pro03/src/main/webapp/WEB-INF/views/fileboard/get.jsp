<%@ page language="java" contentType="text/html charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자료실 상세보기</title>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="full-wrap">
    <!-- 헤더 부분 인클루드 -->
    <header id="hd">
    	<div class="container">
    		<jsp:include page="../include/hd.jsp"></jsp:include>
    	</div>
    </header>
    <main id="contents" class="contents">
       	<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  <ul>
			    <li><a href="${path2 }">Home</a></li>
			    <li><a href="${path2 }/fileboard/list.do?pageNo=1">자료실</a></li>
			    <li class="is-active"><a href="#" aria-current="page">글 상세보기</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">자료실 글 상세보기</h2>
    		<div class="page-wrap">
 				<div class="clr-fix">
					<table id="tb1" class="table" width="1200">
						<tbody>
							<tr>
								<th>글 번호</th>
								<td>${board.no }</td>
							</tr>
							<tr>
								<th>글 제목</th>
								<td>${board.title }</td>
							</tr>
							<tr>
								<th>글 내용</th>
								<td>${board.content }</td>
							</tr>
							<tr>
								<th>첨부 파일</th>
								<td><a href="${path2}/resources/upload/${board.url }" download>${board.url }</a></td>
							</tr>
							<tr>
								<th>작성일시</th>		
								<td>${board.resdate }</td>
							</tr>
							<tr>
								<th>조회수</th>
								<td>${board.hits }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${board.author }</td>
							</tr>
						</tbody>
					</table>
					<hr>
					<div class="buttons">
					  <c:if test="${cus.id.equals('admin') }">
					  <a href="${path2 }/fileboard/insert.do" class="button is-danger">글 등록</a>
					  <a href="${path2 }/fileboard/update.do?no=${board.no }" class="button is-warning">글 수정</a>
					  <a href="${path2 }/fileboard/delBoard.do?no=${board.no }" class="button is-danger is-dark">글 삭제</a>
					  </c:if>
					  <a href="${path2 }/fileboard/list.do?pageNo=${pageNo}" class="button is-primary">글 목록</a>
					</div>
				</div>
    		</div>
    	</section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	<jsp:include page="../include/ft.jsp"></jsp:include>
    </footer>
    <script>
    $(document).ready(function(){
    	$("#tb1_length, #tb1_filter").css("margin-bottom", "20px");
    });
    </script>
</div>    
</body>
</html>