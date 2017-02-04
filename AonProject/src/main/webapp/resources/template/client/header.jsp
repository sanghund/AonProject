<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- ================== header ===========================-->
		<div id="header" >
			<div class="inner">
				<div id="top_category">
					<div class="position">
						<ul>
							<sec:authorize access="hasRole('user')">
								<li><a href="/member/logout">로그아웃</a></li>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<li><a href="/member/login">로그인/회원가입</a></li>
							</sec:authorize>
							<li><a href="#">장바구니</a></li>
							<li><a href="#">마이페이지</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
<!-- ================== header END ===========================-->