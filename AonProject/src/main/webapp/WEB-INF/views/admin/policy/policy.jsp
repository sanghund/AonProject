<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style type = "text/css">
	#pTitle{
		font-size: 3rem;
		display: inline-block;
		border-bottom: 1px solid #73879C;
		margin-bottom: 3rem;
	}
	#viewShow{
		font-size: 12px;
	}
	#viewShow > div{
		margin: 0 auto;
		text-align: center;
		width: 1200px;
		margin-bottom: 50px;
	}
	#viewShow textarea{
		resize: none;
		overflow: auto;
		height: 200px;
		width: 100%;
		margin-bottom: 12px;
	}
	.chkLine input{
		font-size: 18px;
		width: 200px;
	}
</style>
<div class= "main">
	<h2 id = "pTitle">약관 목록</h2>
	<div id = "viewShow">
		<div id = "tou">
			<h3>${view1.po_name }</h3>
			<textarea readonly="readonly" class = "po_content" name = "po_content">${view1.po_content }</textarea>
			<div class = "chkLine">
				<input type="button" class = "goUp" value="변경하기">
			</div>
		</div>
		<div id = "privacy">
			<h3>${view2.po_name }</h3>
			<textarea readonly="readonly" class = "po_content" name = "po_content">${view2.po_content }</textarea>
			<div class = "chkLine">
				<input type="button" class = "goUp" value="변경하기">
			</div>
		</div>
	</div>
	
</div>

<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<script src = "/resources/include/js/inputChk.js"></script>
<script type = "text/javascript">
	$(document).ready(function(){
		
		$(".goUp").click(function(){
			$(this).hide();
			$(this).closest(".chkLine").append('<input type="button" class = "gogoUp" value="수정하기">&nbsp<input type="button" class = "clear" value="취소하기">');
			$(this).parent().parent().find("textarea").removeAttr("readonly");
		});
		
		$(".chkLine").on("click", ".clear", function(){
			$(this).closest(".chkLine").find(".goUp").show();
			$(this).closest(".chkLine").find(".gogoUp").remove();
			$(this).parent().parent().find("textarea").attr("readonly", "readonly");
			$(this).remove();
		});
		
		$(".chkLine").on("click", ".gogoUp", function(){
			if(!(vacuumChkAlert($(this).parent().parent().find("textarea"), "약관을", true))) return;
			else{
				var content = $(this).parent().parent().find("textarea").val();
				var type = 0;
				if($(this).parent().parent().attr("id") == "tou"){
					type = 1;
				}
				else{
					type = 2;
				};
				
				$("#viewShow").append("<form id = 'gogo'><textarea id = 'po_content' name = 'po_content'></textarea><input type = 'hidden' id = 'po_type' name = 'po_type' value = '" + type + "'></form>");
				$("#po_content").val(content);
				$("#gogo > *").hide();
	
				$.ajax({
					url : "/admin/newPolicy",
					type : "post",
					data : $("#gogo").serialize(),
					dataType : "text",
					error : function(){
						alert("시스템 에러입니다. 관리자에게 문의하세요.");
					},
					success : function(result){
						if(result == 'success'){
							alert("약관이 변경되었습니다!");
							location.reload();
						}
						else{
							alert("시스템 에러입니다. 관리자에게 문의하세요.");
						};
					}
				})
			};
		});
	});
</script>