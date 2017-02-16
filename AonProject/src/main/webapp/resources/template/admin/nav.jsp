<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	  $(function() {
		  // 회원조회 클릭 시
		  $(".mInfo").click(function() {
			  location.href = "/admin/mInfoList";
		  });
		  
		  $(".notice").click(function() {
			  location.href = "/admin/noticeList";
		  });
		  
		  $(".reviewList").click(function(){
			location.href = "/admin/review/reviewList";
		  });
		  
		  $(".commentQnAList").click(function(){
			  location.href = "/admin/commentQnA/commentQnAList"
		  });
		  
		  $(".mImage").click(function() {
			  location.href = "/admin/imageUploadList";
		  });
		  
		  $(".size").click(function() {
			  location.href = "/admin/sCommonCodeList";
		  });
		  
		  $(".color").click(function() {
			  location.href = "/admin/cCommonCodeList";
		  });
		  
		  $(".type").click(function() {
			  location.href = "/admin/tCommonCodeList";
		  });
	  });
	</script>

  <!-- sidebar menu -->
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
        
            <div class="clearfix"></div>
  
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <p>&nbsp;</p>
                <h3>Menu</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-gift"></i> 상품관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/product">상품관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 주문관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html">null</a></li>
                      <li><a href="form_advanced.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="mInfo" id="mInfo">회원조회</a></li>
                      <li><a href="media_gallery.html">null</a></li>
                      <li><a href="typography.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 약관관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/policy">약관목록</a></li>
                      <li><a href="/admin/policyAgr">약관여부</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 재고관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/stockList">재고관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> 배송관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i> 매출관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bug"></i> 게시판관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="notice" id="notice">공지사항관리</a></li>
                      <li><a class="reviewList">후기관리</a></li>
                      <li><a class="commentQnAList">문의관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 공통코드관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="size" id="size">사이즈관리</a></li>
                      <li><a class="color" id="color">색상관리</a></li>
                      <li><a class="type" id="type">상품타입관리</a></li>
                      <li><a href="plain_page.html">null</a></li>
                      <li><a href="login.html">null</a></li>
                      <li><a href="pricing_tables.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 화면 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="mImage" id="mImage">메인 이미지 관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 카테고리관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/category">카테고리</a></li>
                    </ul>
                  </li>                  
                </ul>
              </div>
            </div>
          </div>
        </div>
            <!-- /sidebar menu -->