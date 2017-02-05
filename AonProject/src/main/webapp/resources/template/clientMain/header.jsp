<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
	<div class="topMenuContainer">
	  <ul class="topMenu">
	    <sec:authorize access="hasRole('user')">
			<li id = "logout"><a href="/member/logout">로그아웃</a></li>
			<script type = "text/javascript">
				$(document).ready(function(){
					$("#logout a").click(function(event){
						event.preventDefault();
						$.ajax({
							url : "/member/logout",
							type : "post",
							dataType : "json",
							beforeSend: function(xhr) { 
								xhr.setRequestHeader("Accept", "application/json"); 
							}
						}).done(function(body){
							var returnUrl = body.response.returnUrl;
							var url = '${referer}'; 
							if(url == '') url = returnUrl;
							if(url == "") location.reload();
							location.href = url; 
						});
					});
				});
			</script>
		</sec:authorize>
		<sec:authorize ifNotGranted="user">
			<li><a href="/member/login">로그인/회원가입</a></li>
			<li id = "login"><a href="/member/login">로그인/회원가입</a></li>
			<script type = "text/javascript">
				$(document).ready(function(){
					$("#login a").click(function(event){
						event.preventDefault();
						location.href = "/member/login";
					});
				});
			</script>
		</sec:authorize>
	    <li><a href="#">장바구니</a></li>
	    <li><a href="#">마이페이지</a></li>
	    <li><a href="#">공지사항</a></li>
	  </ul>
	</div>
</header>