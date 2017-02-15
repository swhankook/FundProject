<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="boardList">
    <div class="container">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12">
    			<h3 data-edit="true" data-selector="h1">Board List</h3>
   			</div>

            <div class="col-xs-8 col-sm-6 col-md-4 col-xs-offset-4 col-sm-offset-6 col-md-offset-8 search-box">
                <div class="input-group">
                    <div class="input-group-btn">
                        <select id="sfl" class="form-control" name="sfl" placeholder="Search">
                            <option value="all">전체</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                    </div>
                    <input name="stx" class="form-control" id="stx" type="text" value="">
                    <span class="input-group-btn">
                        <button class="btn btn-default search-btn" type="button"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 clear-left">
                <table class="table">
                    <thead class="thead-top-line">
                        <tr class="thead-bottom-line">
                            <th class="tpl-forum-num">no</th>
                            <th class="tpl-forum-title">title</th>
                            <th class="tpl-forum-name">name</th>
                            <th class="tpl-forum-date">date</th>
                            <th class="tpl-forum-hit">view</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    	<c:when test="${fn:length(list) > 0}">
                    		<c:forEach var="row" items="${list}" varStatus="status">
                        		<tr>
                            		<td class="tpl-forum-list-num">${row.IDX }</td>
                            		<td class="tpl-forum-list-content"><a href="#this" name="title">${row.TITLE }</a>
										<input type="hidden" id="IDX" value="${row.IDX }"></td>
                            		<td class="tpl-forum-list-name">${row.CREA_ID }</td>
                            		<td class="tpl-forum-list-date">${row.CREA_DTM }</td>
                            		<td class="tpl-forum-list-hit">${row.HIT_CNT }</td>
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
                <div class="pagination">
	                <c:if test="${not empty paginationInfo}">
						<ui:pagination paginationInfo="${paginationInfo}" type="text"
							jsFunction="boardList.fn_search" />
					</c:if>
					<input type="hidden" id="currentPageNo" name="currentPageNo" />
					<br />
				</div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	var boardList = {
		init : function() {
			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				boardList.fn_openBoardDetail($(this));
			});
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