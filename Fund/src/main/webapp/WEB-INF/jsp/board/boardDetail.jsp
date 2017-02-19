<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="forum-view">
	 <input id="fm-id" type="hidden" value="13010">
	 <input id="fm-pid" type="hidden" value="628576">
	 <div class="container">
		  <div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<ul class="forum-user-info">
					<li class="user-image tpl-forum-myimage">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
							<pattern id="forum-view-image" patternUnits="userSpaceOnUse" width="40" height="40">
								<image x="-10" width="60" height="40" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="//i.addblock.net/member/profile_default.png?_1485763659482" />
							</pattern>
							<polygon fill="url(#forum-view-image)" points="20,0 37,10 37,30 20,40 3,30 3,10" />
						</svg>
					</li>
					<li class="user-info">
						<div class="tpl-forum-name">${map.CREA_ID }</div>
						<div class="tpl-forum-date date">${map.CREA_DTM }</div>
						<div class="tpl-forum-hit hit">${map.HIT_CNT }</div></li>
					<li class="user-ctrl navbar-right">
						<img id="forum-ctrl" aria-expanded="true" aria-haspopup="true" src="//i.addblock.net/icon/icon-user-ctrl.png" data-toggle="dropdown">
						<ul class="dropdown-menu" aria-labelledby="forum-ctrl">
							<li>
								<a class="tpl-forum-write" href="#this" data-id="13010" data-pid="628576" class="btn" id="update">수정</a>
							</li>
							<li>
								<a class="tpl-forum-delete" href="#" data-id="13010" data-pid="628576">삭제</a>
							</li>
						</ul>
					</li>
				</ul>
				<div class="tpl-forum-title">${map.TITLE }</div>
				<div class="tpl-forum-content">${map.CONTENTS }</div>
				<div class="tpl-forum-list-footer">
					<ul class="tpl-page-toolbar" data-page-option="">
				 		<li class="tpl-forum-toolbar-button share">
							<i class="fa fa-share"></i>
						</li>
					</ul>
					<div class="tpl-forum-control-wrap" style="float: right;">
						<button class="btn btn-default btn-round btn-modal btn-list tpl-forum-list" type="button" id="list">
							 <i class="fa fa-bars"> </i>
							 <a href="#this" class="btn" >목록</a>
						</button>
						<button class="btn btn-default btn-round btn-modal btn-list tpl-forum-write" type="button" data-pid="628576" data-reply="13010">
							<i class="fa fa-reply"></i>
							&nbsp;답글
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="page-comments" style="background-position: center; text-align: center; font-size: 20px; margin-top: 467px; min-height: 50px; background-image: none; background-repeat: no-repeat;" data-id="13029">
	<div class="container">
		<div class="tpl-comment-form">
			<table class="comment-textarea">
				<tbody>
					<tr>
						<td class="form-profile" valign="top" rowspan="2" colspab="2">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
								<pattern id="comment-write-image" patternUnits="userSpaceOnUse" width="40" height="40">
									<image x="-10" width="60" height="40" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="//i.addblock.net/member/profile_default.png?_1485764580161" />
								</pattern>
								<polygon fill="url(#comment-write-image)" points="20,0 37,10 37,30 20,40 3,30 3,10" />
							</svg>
						</td>
					</tr>
					<tr>
						<td class="comm-area">
							<textarea class="form-control" id="comm-content" placeholder="Write here..." data-autoresize=""></textarea>
							<div class="btn-mobile comment-submit">
								<span class="btn btn-submit btn-round">댓글</span>
							</div>
						</td>
						<td class="form-submit comment-submit">
							<span class="btn btn-submit btn-round">댓글</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<ul class="comment-list"></ul>
	</div>
</div>

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