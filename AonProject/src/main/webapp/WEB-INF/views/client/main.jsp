<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" type="text/css" href="/resources/include/css/main.css">
	<section class = "section one"></section>
	<section class = "section two"></section>
	<section class = "section three"></section>
	<section class = "section four"></section>
	<section class = "section five"></section>
	<script type = "text/javascript">
		$(document).ready(function(){
			$(".section.one").css("background-image", "url(/productUpload/<c:out value="${main[0] }"/>)");
			$(".section.two").css("background-image", "url(/productUpload/<c:out value="${main[1] }"/>)");
			$(".section.three").css("background-image", "url(/productUpload/<c:out value="${main[2] }"/>)");
			$(".section.four").css("background-image", "url(/productUpload/<c:out value="${main[3] }"/>)");
			$(".section.five").css("background-image", "url(/productUpload/<c:out value="${main[4] }"/>)");
		})
	</script>