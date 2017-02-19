<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="boardList">
    <div class="container">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12">
    			<h3 data-edit="true" data-selector="h1">Loan List</h3>
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
                            		<td class="tpl-forum-list-content"><a href="#this" name="title">
                            		<c:choose>
                            			<c:when test="${row.purpose eq 1}">채무통합</c:when>
                            			<c:when test="${row.purpose eq 2}">고금리 대환대출</c:when>
                            			<c:when test="${row.purpose eq 3}">생활비</c:when>
                            			<c:when test="${row.purpose eq 4}">자동차 구매</c:when>
                            			<c:when test="${row.purpose eq 5}">보증금</c:when>
                            			<c:when test="${row.purpose eq 6}">병원비</c:when>
                            			<c:when test="${row.purpose eq 7}">결혼비용</c:when>
                            			<c:otherwise>관리자에게 문의바랍니다.</c:otherwise>
                            		</c:choose>
                            		</a>
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
	var loanList = {
		init : function() {
			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				boardList.fn_openBoardDetail($(this));
			});
		},
		fn_openBoardDetail : function(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("loanDetail");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		},
		fn_search : function(pageNo) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("loanList");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
	}
	$(function() {
		loanList.init();
	});
</script>