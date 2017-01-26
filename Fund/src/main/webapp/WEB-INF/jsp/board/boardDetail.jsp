<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<td>${map.TITLE }</td>
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
			<td colspan="3">${map.TITLE }</td>
		</tr>
		<tr>
			<td colspan="4">${map.CONTENTS }</td>
		</tr>
	</tbody>
</table>

<a href="#this" class="btn" id="list">목록으로</a>
<a href="#this" class="btn" id="update">수정하기</a>
<script type="text/javascript">
	var boardDetail = {
		init : function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				boardDetail.fn_openBoardList();
			});

			$("#update").on("click", function(e) {
				e.preventDefault();
				boardDetail.fn_openBoardUpdate();
			});
		},
		fn_openBoardList : function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardList");
			comSubmit.submit();
		},
		fn_openBoardUpdate : function() {
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardUpdate");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	}
	$(function() {
		boardDetail.init();
	});
</script>