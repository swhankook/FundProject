<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="frm">
	<table class="board_view board_table">
		<colgroup>
			<col width="15%">
			<col width="*" />
		</colgroup>
		<caption class="caption">게시글 작성</caption>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
			</tr>
			<tr>
				<td colspan="2" class="view_text"><textarea rows="15"
						cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea></td>
			</tr>
		</tbody>
	</table>

	<a href="#this" class="btn" id="write">작성하기</a> <a href="#this"
		class="btn" id="list">목록으로</a>
		<input type="hidden" id="userid" name="USERID" value="${user.email }">
</form>
<script type="text/javascript">
	var boardWrite = {
		init : function() {
			$("#list").on("click", function(e){ //목록으로 버튼
		        e.preventDefault();
		        boardWrite.fn_openBoardList();
		    });

		    $("#write").on("click", function(e){ //작성하기 버튼
		        e.preventDefault();
		        boardWrite.fn_insertBoard();
		    });
		},
		fn_openBoardList : function(){
	    	var comSubmit = new ComSubmit()
	    		, url = "boardList";
	    	comSubmit.setUrl(url);
	    	comSubmit.submit();
		},
		fn_insertBoard : function(){
			if(gfn_isNull($('#userid').val())) {
				alert("로그인이 되어있지않아 로그인화면으로 이동합니다.");
				window.location.href = "/user/login";
			} else if(gfn_isNull($('TITLE').text()) || gfn_isNull($('#CONTENTS').text())) {
				alert("제목 또는 내용이 비어있습니다.");
			} else {
			    var comSubmit = new ComSubmit("frm")
			    	, url = "boardInsert";
			    comSubmit.setUrl(url);
			    comSubmit.submit();
			}
		}
	}
	$(function() {
		boardWrite.init();
	});
</script>