<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
	.temp {margin-left:70px;}
</style>
    
<body class="nav-md">
    <div class="temp right_col nav-md">
    	<p>안녕하세요 메인입니다.</p>
    </div>
<!-- </div> -->
	<%-- ${vo.a_id }님<br />
	<input type = "button" id = "logOut" value = "로그아웃">
	<input type = "button" value = "신규가입" id = "gogo"> --%>
<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#logOut").click(function(){
				location.href = "/admin/logout";
			});
			
			$("#gogo").click(function(){
				location.href = "/admin/joinForm";
			});
		});
</script>
