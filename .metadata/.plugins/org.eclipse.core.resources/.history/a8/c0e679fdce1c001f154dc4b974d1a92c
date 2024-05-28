<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!-- 헤더 내용 기술 -->
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="${path1 }" class="logo-wrap">
                <img src="${path1}/resources/images/logo01.svg" alt="LOGO" class="logo">
            </a>

            <button class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </button>
        </div>

        <div id="navbarBasicExample" class="navbar-menu" role="menu">
            <div class="navbar-start">
            	<div class="navbar-item has-dropdown is-hoverable">
                	<a href="${path1 }/intro/intro1.do" class="navbar-link">
                    	Company
                	</a>
					<div class="navbar-dropdown">
                        <a href="${path1 }/intro/intro2.do" class="navbar-item" title="회사연혁">
                            History
                        </a>
                        <a href="${path1 }/intro/intro3.do" class="navbar-item" title="경영이념 및 비전">
                            Vision
                        </a>
                        <a href="${path1 }/intro/intro4.do" class="navbar-item" title="오시는 길">
                            Map
                        </a>
                     </div>   
				</div>
				<div class="navbar-item has-dropdown is-hoverable">
	                <a href="${path1 }/business/business1.do" class="navbar-link">
	                    Business
	                </a>
					<div class="navbar-dropdown">
                        <a href="${path1 }/business/business2.do" class="navbar-item" title="사업 영역">
                            Business Area
                        </a>
                        <a href="${path1 }/business/business3.do" class="navbar-item" title="온라인 사업">
                            Online Business
                        </a>
                        <a href="${path1 }/business/business4.do" class="navbar-item" title="해외 사업">
                            Overseas Business
                        </a>
                     </div>   
				</div>
				<div class="navbar-item has-dropdown is-hoverable">
                    <a href="${path1 }/product/list.do" class="navbar-link">
                        Product
                    </a>
                    <div class="navbar-dropdown">
                        <a href="${path1 }/product/list.do?cate=note" class="navbar-item" title="노트">
                            Note
                        </a>
                        <a href="${path1 }/product/list.do?cate=fancy" class="navbar-item" title="팬시">
                            Fancy
                        </a>
                        <a href="${path1 }/product/list.do?cate=pen" class="navbar-item" title="필기류">
                            Pen
                        </a>
                        <hr class="navbar-divider">
                        <a href="${path1 }/product/list.do?cate=file" class="navbar-item" title="파일철">
                            File
                        </a>
                        <a href="${path1 }/product/list.do?cate=binder" class="navbar-item" title="바인더">
                            Binder
                        </a>
                        <hr class="navbar-divider">
                        <a href="${path1 }/product/list.do?cate=other" class="navbar-item" title="기타 및 집기류">
                            Other
                        </a>                        
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a href="${path1 }/board/list.do" class="navbar-link">
                        Community
                    </a>
                    <div class="navbar-dropdown">
                        <a href="${path1 }/board/list.do" class="navbar-item">
                            Notice
                        </a>
                        <a href="${path1 }/qna/list.do" class="navbar-item">
                            QnA
                        </a>
                        <a href="${path1 }/free/list.do" class="navbar-item">
                            Free
                        </a>
                        <a href="${path1 }/fileboard/list.do?pageNo=1" class="navbar-item">
                            Dataroom
                        </a>
                        <hr class="navbar-divider">
                        <a href="${path1 }/service/online.do" class="navbar-item">
                            Contact
                        </a>
                    </div>
                </div>
            </div>

            <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                    <c:if test="${!empty sid}">
                        <a href="${path1}/member/mypage.do" class="button is-primary">
                            <strong>MyPage</strong>
                        </a>
                        <a href="${path1}/member/logout.do" class="button is-light">
                            LogOut
                        </a>
                    </c:if>
                    <c:if test="${empty sid}">
                        <a href="${path1}/member/term.do" class="button is-primary">
                            <strong>Sign up</strong>
                        </a>
                        <a href="${path1}/member/login.do" class="button is-light">
                            Log in
                        </a>
                    </c:if>
                    <c:if test="${sid.equals('admin')}">
                        <a href="${path1}/member/list.do" class="button is-light">
                            MemberList
                        </a>
                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <script>
	document.addEventListener('DOMContentLoaded', () => {
	    const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
	
	    if ($navbarBurgers.length > 0) {
	        $navbarBurgers.forEach(el => {
	            el.addEventListener('click', () => {
	                const target = el.dataset.target;
	                const $target = document.getElementById(target);
	                el.classList.toggle('is-active');
	                $target.classList.toggle('is-active');
	            });
	        });
	    }
	});
	</script>