<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="/resources/template/clientMain/client.jspf" %>

</head>
  <body>
	  <div id="wrap">
	    <!-- header start -->
	    <tiles:insertAttribute name="header" />
	    <!-- header end -->
	
	    <!-- nav start -->
		<tiles:insertAttribute name="nav" />
	    <!-- nav end -->
	
	    <!-- content start -->
	    <section class="contentContainer">
	    	<tiles:insertAttribute name="main" />
	    </section>
	    <!-- content end -->
	
		<!-- footer start -->
		<tiles:insertAttribute name="footer" />
		<!-- footer end -->
	  </div>
  </body>
</html>