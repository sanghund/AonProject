<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="/resources/template/client/client.jspf" %>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="nav" />
		<div class="body_section">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>