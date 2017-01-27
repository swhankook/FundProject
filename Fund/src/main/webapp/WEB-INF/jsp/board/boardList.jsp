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
				<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.IDX }</td>
						<td>${row.TITLE }</td>
						<td>${row.HIT_CNT }</td>
						<td>${row.CREA_DTM }</td>
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
<c:if test="${not empty paginationInfo}">
	<ui:pagination paginationInfo="${paginationInfo}" type="text"
		jsFunction="boardList.fn_search" />
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
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardDetail");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
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