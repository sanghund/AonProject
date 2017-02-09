<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
*{margin:0;padding:0;}
    
body{
    font-family:'돋움'
}
    li{list-style:none;}
    .content{
        width:800px;
        margin:100px auto;
    }
    .content_box{
        border:1px solid #e5e5e5;
        padding:15px 10px;
        box-sizing:border-box;
    }
    .content_head{overflow:hidden;}
    .title{
        float:left;
        font-size:12px;
        font-weight:600;
    }
    .date{
        float:right
    }
    .date td{
        font-size:12px;
        padding-left:5px;
        color:#666;
    }
    .user_info{
        clear:both;
        float:left;
        width:100%;
        margin-top:8px;
        padding-top:10px;
        border-top:1px dashed #e5e5e5;
    }
    .user_photo img{
        width:100%;
        height:100%;
    }
    .u_name{
        float:left;
        font-size:12px;
        font-weight:600;
        color:#666;
        line-height:20px;
    }
    .content_body{
        margin:30px 0 18px;
        font-size:12px;
    }
    .content_tail{
        margin-top:10px;
    }
    .content_tail>a{
        display:block;
        float:right;
        width:40px;
        height:24px;
        font-size:13px;
        text-decoration:none;
        color:#666;
        border:1px solid #ececec;
        text-align:center;
        line-height:24px;
        border-radius:3px;
        background: rgb(255,255,255); /* Old browsers */
        background: -moz-linear-gradient(top,  rgba(255,255,255,1) 0%, rgba(247,247,247,1) 60%, rgba(232,232,232,1) 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(247,247,247,1) 60%,rgba(232,232,232,1) 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to bottom,  rgba(255,255,255,1) 0%,rgba(247,247,247,1) 60%,rgba(232,232,232,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e8e8e8',GradientType=0 ); /* IE6-9 */
    }
</style>

        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
		<script type="text/javascript">
		
    $(function() {
    	/* 목록 버튼 처리*/
        $("#NoticeListBtn").click(function() {
    	    location.href = "/client/noticeList";
    	});
    });
</script>

<style>
*{margin:0;padding:0;}
    
body{
    font-family:'돋움'
}
    li{list-style:none;}
    .content{
        width:800px;
        margin:100px auto;
    }
    .content_box{
        border:1px solid #e5e5e5;
        padding:15px 10px;
        box-sizing:border-box;
    }
    .content_head{overflow:hidden;}
    .title{
        float:left;
        font-size:12px;
        font-weight:600;
    }
    .date{
        float:right
    }
    .date td{
        font-size:12px;
        padding-left:5px;
        color:#666;
    }
    .user_info{
        clear:both;
        float:left;
        width:100%;
        margin-top:8px;
        padding-top:10px;
        border-top:1px dashed #e5e5e5;
    }
    .user_photo img{
        width:100%;
        height:100%;
    }
    .u_name{
        float:left;
        font-size:12px;
        font-weight:600;
        color:#666;
        line-height:20px;
    }
    .content_body{
        margin:30px 0 18px;
        font-size:12px;
    }
    .content_tail{
        margin-top:10px;
    }
    .content_tail>a{
        display:block;
        float:right;
        width:40px;
        height:24px;
        font-size:13px;
        text-decoration:none;
        color:#666;
        border:1px solid #ececec;
        text-align:center;
        line-height:24px;
        border-radius:3px;
        background: rgb(255,255,255); /* Old browsers */
        background: -moz-linear-gradient(top,  rgba(255,255,255,1) 0%, rgba(247,247,247,1) 60%, rgba(232,232,232,1) 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(247,247,247,1) 60%,rgba(232,232,232,1) 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to bottom,  rgba(255,255,255,1) 0%,rgba(247,247,247,1) 60%,rgba(232,232,232,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e8e8e8',GradientType=0 ); /* IE6-9 */
    }
</style>

<body>
   <div>공지사항 게시판</div>
      <form id="getNo" name="getNo">
         <input type="hidden" name="no_num" value="${detail.no_num}">
      </form>
<div class="content">
   <div class="content_box">
        <div class="content_head">
          <div class="title">${detail.no_title}</div>
          <div class="date">
              <table>
                 <tbody>
                    <tr>
                      <td>${detail.no_date}</td>
                    </tr>
                  </tbody>
              </table>
          </div>
          <div class="user_info">
              <div class="u_1">
                <div class="u_name">
                ${adminInfo.a_id}
                </div>
              </div>
          </div> 
        </div>
        <div class="content_body">
            ${detail.no_content}
        </div>
    </div>
    <div class="content_tail">
        <input type="button" id="NoticeListBtn" name="NoticeListBtn" value="목록">
    </div>
</div>
</body>