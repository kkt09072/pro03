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
	<title>회원 정보 수정</title>
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
			    <li><a href="${path2 }">Member</a></li>
			    <li class="is-active"><a href="#" aria-current="page">Member Info Update</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<div class="page-wrap">
	    		<div class="clr-fix">
	                <h2 class="page-title">회원 정보 수정</h2>
		            <hr>
		            <form action="${path2 }/member/myUpdatePro.do" method="post" onsubmit="return updateCheck(this)">
		                <div class="table_form_wrap">
		                    <table class="table_form">
		                        <tbody>
		                        <tr>
		                            <th><label for="id">아이디</label></th>
		                            <td><input type="text" name="id" id="id" size="100" class="input" value="${cus.id }" readonly required>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th><label for="pw">비밀번호</label></th>
		                            <td><input type="password" name="pw" id="pw"  class="input" value="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
		                                <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th><label for="pw2">비밀번호 확인</label></th>
		                            <td><input type="password" name="pw2" id="pw2"  class="input" value="" required></td>
		                        </tr>
		                        <tr>
		                            <th><label for="name">이름</label></th>
		                            <td><input type="text" name="name" id="name" class="input"  value="${cus.name }" required></td>
		                        </tr>
		                        <tr>
		                            <th><label for="email">이메일</label></th>
		                            <td><input type="email" name="email" id="email" class="input" value="${cus.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
		                        </tr>
		                        <tr>
		                            <th><label for="tel">전화번호</label></th>
		                            <td><input type="tel" name="tel" id="tel" class="input"  value="${cus.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required></td>
		                        </tr>
		                        <tr>
		                            <th><label for="" onclick="findAddr()">주소</label></th>
		                            <td>
		                                <input type="text" name="addr1" id="addr1" class="input" value="${addr1 }"><br>
		                                <input type="text" name="addr2" id="addr2" class="input" value="${addr2 }"><br>
		                                <input type="text" name="postcode" id="postcode"  class="input" value="${cus.postcode }">
		                                <input type="button" value="주소찾기" onclick="findAddr()" class="button is-primary">
		                            </td>
		                        </tr>
		                        <tr>
		                            <td colspan="2">
		                            	<div class="buttons">
			                                <input type="submit" class="button is-warning" value="회원정보수정">
			                                <a href="${path2 }/member/myInfo.do" class="button is-info">취소</a>
		                                </div>
		                            </td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </div>
		            </form>
		            <script>
		                function updateCheck(f){
		                    if(f.userpw.value!=f.userpw2.value){
		                        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
		                        return false;
		                    }
		                }
		            </script>
		            <script>
		                function findAddr() {
		                    new daum.Postcode({
		                        oncomplete: function(data) {
		                            console.log(data);
		                            var roadAddr = data.roadAddress;
		                            var jibunAddr = data.jibunAddress;
		                            document.getElementById("postcode").value = data.zonecode;
		                            if(roadAddr !== '') {
		                                document.getElementById("addr1").value = roadAddr;
		                            } else if(jibunAddr !== ''){
		                                document.getElementById("addr1").value = jibunAddr;
		                            }
		                        }
		                    }).open();
		                }
		            </script>
		            <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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