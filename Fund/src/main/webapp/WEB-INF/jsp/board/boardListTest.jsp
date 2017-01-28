<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<!DOCTYPE html>
<h2>게시판 목록</h2>
<table class="board_table">
	<colgroup>
		<col width="10%" />
		<col width="*" />
		<col width="15%" />
		<col width="20%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="row" items="${list}" varStatus="status">
					<tr>
						<td>${row.idx }</td>
						<td class="title"><a href="#this" name="title">${row.title }</a>
							<input type="hidden" id="IDX" value="${row.idx }">
							<input type="hidden" id="EMAIL" value="${row.crea_id }"></td>
						<td>${row.hit_cnt }</td>
						<td>${row.crea_dtm }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<input type="hidden" id="user_email" value="${user.email }">
<c:if test="${not empty paginationInfo}">
	<ui:pagination paginationInfo="${paginationInfo}" type="text"
		jsFunction="fn_search" />
</c:if>
<input type="hidden" id="currentPageNo" name="currentPageNo" />

<br />
<a href="#this" class="btn" id="write">글쓰기</a>
<script type="text/javascript">
	var boardList = {
		init : function() {
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				boardList.fn_openBoardWrite();
			});

			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				boardList.fn_openBoardDetail($(this));
			});
		},
		fn_openBoardWrite : function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardWrite");
			comSubmit.submit();
		},
		fn_openBoardDetail : function(obj) {
			var comSubmit = new ComSubmit()
				, user_email = $('#user_email').val()
				, crea_id = obj.parent().find("#E").val();

			if (user_email === crea_id) {
				comSubmit.setUrl("boardDetail");
				comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
				comSubmit.submit();
			} else {
				alert("비공개 글입니다. 해당고객아이디로 로그인해주세요.");
			}
		},
		fn_search : function(pageNo) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardList");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
	}
	$(function() {
		boardList.init();
	});
</script>