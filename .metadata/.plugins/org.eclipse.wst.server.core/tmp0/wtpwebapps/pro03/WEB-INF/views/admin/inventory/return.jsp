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
	<title>상품 반출</title>
	<jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<body>
<div class="full-wrap">
    <!-- 헤더 부분 인클루드 -->
    <header id="hd">
    	<div class="container">
    		<jsp:include page="../../include/hd.jsp"></jsp:include>
    	</div>
    </header>
    <main id="contents" class="contents">
    	<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  <ul>
			    <li><a href="${path2 }">Home</a></li>
			    <li><a href="${path2 }/admin/listInventory.do">재고</a></li>
			    <li class="is-active"><a href="#" aria-current="page">반출</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">상품 반출</h2>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	    			<br>
					<form action="${path2 }/admin/productReturnPro.do" method="post">
						<table class="table">
							<tbody>
								<tr>
									<th><label for="cate">카테고리</label></th>
									<td>
										<select id="cate" class="select">
											<option value="">선택안함</option>
											<option value="note">노트</option>
											<option value="fancy">팬시</option>
											<option value="pen">필기구</option>
											<option value="binder">파일철/바인더</option>
											<option value="other">집기류/기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th><label for="pno">상품명</label></th>
									<td>
										<select name="pno" id="pno" class="select">
											<option value="">선택안함</option>

										</select>
										<input type="hidden" name="pname" id="pname" />
									</td>
								</tr>
								<tr>
									<th><label for="iprice">반출가격</label></th>
									<td>
										<input type="number" name="iprice" id="iprice" min="0" step="100" class="input" required>
									</td>
								</tr>
								<tr>
									<th><label for="oprice">판매가격</label></th>
									<td>
										<input type="number" name="oprice" id="oprice" min="0" step="100" class="input" required>
									</td>
								</tr>
								<tr>
									<th><label for="amount">반출 수량</label></th>
									<td>
										<input type="number" name="amount" id="amount" min="0" step="1" class="input" required>
									</td>
								</tr>
								<tr>
									<th><label for="remark">참고 사항</label></th>
									<td>
										<input type="text" name="remark" id="remark" class="input">
									</td>
								</tr>
							</tbody>
						</table>
						<hr>
						<div class="buttons">
						  <button type="submit" class="button is-danger">상품 반출 처리</button>
						  <a href="${path2 }/admin/listInventory.do" class="button is-primary">상품 재고 목록</a>
						</div>
					</form>
					<script>
					$(document).ready(function(){
						$("#cate").change(function(){
							var value = $(this).val();
							if(value!=""){
								$.ajax({
			                        url:"${path2 }/admin/categoryLoading.do",	//아이디가 전송되어질 곳
			                        type:"get",		//전송방식
			                        data: { cate : value },
			                        dataType:"json",	//데이터 반환 방식
                                    success: function(result){
                                    	console.log(result);
                                        var $pno = $("#pno");
                                        $pno.empty(); // 기존 옵션 비우기
                                        $pno.append("<option value=''>선택안함</option>");
                                        if (result && result.length > 0) {
                                            $.each(result, function(index, item) {
                                                var option = $("<option></option>").val(item.pno).text(item.pname);
                                                $pno.append(option);
                                            });
                                        } else {
                                            $pno.append('<option value="">해당 카테고리에 상품이 없습니다</option>');
                                        }
                                    },
                                    error: function() {
                                        alert("상품 목록을 불러오는 중 오류가 발생했습니다.");
                                    }
			                    });
							}
						});
						
						$("#pno").change(function(){
							var value = $(this).text();
							$("#pname").val(value);
						});
					});
					</script>
				</div>
    		</div>
    	</section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	<jsp:include page="../../include/ft.jsp"></jsp:include>
    </footer>
    <script>
    $(document).ready(function(){
    	$("#tb1_length, #tb1_filter").css("margin-bottom", "20px");
    });
    </script>
</div>    
</body>
</html>