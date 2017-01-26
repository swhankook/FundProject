<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form id="frm">
	<table class="board_view board_table">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX }<input type="hidden" id="IDX" name="IDX"
					value="${map.IDX }">
				</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID }</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3"><input type="text" id="TITLE" name="TITLE"
					class="wdp_90" value="${map.TITLE }" /></td>
			</tr>
			<tr>
				<td colspan="4" class="view_text"><textarea rows="20"
						cols="100" title="내용" id="CONTENTS" name="CONTENTS">${map.CONTENTS }</textarea>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<a href="#this" class="btn" id="list">목록으로</a>
<a href="#this" class="btn" id="update">저장하기</a>
<a href="#this" class="btn" id="delete">삭제하기</a>

<script type="text/javascript">
	var boardUpdate = {
		init : function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				boardUpdate.fn_openBoardList();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				boardUpdate.fn_updateBoard();
			});

			$("#delete").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				boardUpdate.fn_deleteBoard();
			});
		},
		fn_openBoardList : function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardList");
			comSubmit.submit();
		},
		fn_updateBoard : function() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("updateBoard");
			comSubmit.submit();
		},
		fn_deleteBoard : function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("deleteBoard");
			comSubmit.addParam("IDX", $("#IDX").val());
			comSubmit.submit();
		}
	}
	$(function() {
		boardUpdate.init();
	})
</script>