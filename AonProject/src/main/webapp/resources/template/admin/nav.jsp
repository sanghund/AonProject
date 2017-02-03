<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	  $(function() {
		  // 회원조회 클릭 시
		  $(".memberI").click(function() {
			  location.href = "/admin/memberInquiry";
		  });
	  });
	</script>

  <!-- sidebar menu -->
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
                      <li><a href="form_validation.html">null</a></li>
                      <li><a href="form_wizards.html">null</a></li>
                      <li><a href="form_upload.html">null</a></li>
                      <li><a href="form_buttons.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="memberI" id="memberI">회원조회</a></li>
                      <li><a href="media_gallery.html">null</a></li>
                      <li><a href="typography.html">null</a></li>
                      <li><a href="icons.html">null</a></li>
                      <li><a href="glyphicons.html">null</a></li>
                      <li><a href="widgets.html">null</a></li>
                      <li><a href="invoice.html">null</a></li>
                      <li><a href="inbox.html">null</a></li>
                      <li><a href="calendar.html">null</a></li>
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
                      <li><a href="tables.html">null</a></li>
                      <li><a href="tables_dynamic.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> 배송관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">null</a></li>
                      <li><a href="chartjs2.html">null</a></li>
                      <li><a href="morisjs.html">null</a></li>
                      <li><a href="echarts.html">null</a></li>
                      <li><a href="other_charts.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i> 매출관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">null</a></li>
                      <li><a href="fixed_footer.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bug"></i> 게시판관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">공지사항관리</a></li>
                      <li><a href="projects.html">후기관리</a></li>
                      <li><a href="project_detail.html">문의관리</a></li>
                      <li><a href="contacts.html">null</a></li>
                      <li><a href="profile.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 공통코드관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/commonCode">사이즈관리</a></li>
                      <li><a href="page_404.html">색상관리</a></li>
                      <li><a href="page_500.html">null</a></li>
                      <li><a href="plain_page.html">null</a></li>
                      <li><a href="login.html">null</a></li>
                      <li><a href="pricing_tables.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 거래처관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">null</a></li>
                      <li><a href="page_404.html">null</a></li>
                      <li><a href="page_500.html">null</a></li>
                      <li><a href="plain_page.html">null</a></li>
                      <li><a href="login.html">null</a></li>
                      <li><a href="pricing_tables.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 카테고리관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/category">카테고리</a></li>
                      <li><a href="pricing_tables.html">null</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> 이벤트 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->