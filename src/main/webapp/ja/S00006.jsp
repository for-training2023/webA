<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.excd.bean.SongRecord"%>
<%@ page import="jp.excd.bean.SongBean"%>
<!DOCTYPE html>
<html>
<%
List<SongBean> songs = (List<SongBean>) request.getAttribute("list");
%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords"
	content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ">
<meta name="description"
	content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。">
<title>作品検索</title>
<link rel="stylesheet" href="/webA/css/main.css" />
<script src="/webA/js/jquery-3.3.0.min.js"></script>
<script src="/webA/js/util.js"></script>
<%@ page import = "jp.excd.servlet.S00006"%>
<style>
img.torimingu {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
</head>
<body>



	<!-- メニューのキャンセルレイヤの起点 -->
	<div id="layer_marker">


		<div class="wrapper">

			<!-- メニューの起点 -->
			<div id="menu_marker"></div>

			<!-- フォーム -->
			<form name="main" action="/webA/ja/S00005/search" method="post">
				<!-- タイトルバー -->
				<div class="title_bar">
					<p class="page_title">作品検索</p>
					<a href="javascript:Back.submit()" class="back">&lt;&nbsp;戻る</a> <a
						href="#" id="menu_open"> <img alt="メニュー"
						src="/webA/images/menu.png" class="menu-icon">
					</a>
				</div>
			</form>
			<!-- 検索結果表示 -->
			<div class="message_with_right_button">
				<div class="right_button">
					<a href="javascript:Change.submit()">条件変更</a>
				</div>
			</div>
			<!-- Songテーブル -->
			<div class="bottom_main">
				<div class="gaitou">
					<p><%=request.getAttribute("hits")%>
					</p>
				</div>
			</div>
			<div class="song_list">
				<ul>
					<%
					for (SongBean record : songs) {
					%>
					<li>
				
						<div class="cell">
							<div class="song_title">
								<h1><%=record.getTitle()%></h1>
							</div>
							<div class="image_base">
								<a href="/webA/ja/S00003/<%=record.getSong_id()%>">
								<div class="image">
										<div class="image song">
											<img class = "torimingu"src="/webA/images/<%=record.getImage_file_name()%>">
											<img alt = "play" class = "play" src="/webA/images/play.png">
 										</div>
									</div>
								</a>
							</div>

							<div>
								<p>
									<span class="label">総感動指数:</span><span class="value"><%=record.getRating_total_formated()%></span>
									<span class="label">平均感動指数:</span><span class="value"><%=record.getRating_average_formated()%></span>
									<span class="label">再生回数</span><span class="value"><%=record.getTotal_listen_count_formated()%></span><br>
									<span class="label">公開:</span><span class="value"><%=record.getRelease_datetime_formated()%></span>
								</p>
							</div>
						</div>
					</li>
					<%
					}
					%>
				</ul>

			</div>

			<!-- メインボタン -->
			<div class="main_button">
				<a href="javascript:Change.submit()">条件変更</a>
			</div>
		</div>
				<!-- ページトップへjavaScript -->
		<div id="pagetop" hidden>
			<img alt="ページトップ" src="/webA/images/pagetop.png">
		</div>

		<!-- フッター -->
		<footer>
			Copyright <a href="https://www.excd.jp/">© EXCEED Co., Ltd.</a> All
			Rights Reserved.
		</footer>
	</div>


	<form name = "Back"id="formBack" method="POST" action="/webA/ja/S00006/back">
		<input name="release_date_is_radio" type="hidden"
			value="<%=request.getAttribute("release_date_is_radio")%>"> <input
			name="release_date_is_from" type="hidden"
			value="<%=request.getAttribute("release_date_is_from")%>"> <input
			name="release_date_is_to" type="hidden"
			value="<%=request.getAttribute("release_date_is_to")%>"> <input
			name="rating_radio" type="hidden"
			value="<%=request.getAttribute("rating_radio")%>"> <input
			name="rating_from" type="hidden"
			value="<%=request.getAttribute("rating_from")%>"> <input
			name="rating_to" type="hidden"
			value="<%=request.getAttribute("rating_to")%>"> <input
			name="rating_average_radio" type="hidden"
			value="<%=request.getAttribute("rating_average_radio")%>"> <input
			name="rating_average_from" type="hidden"
			value="<%=request.getAttribute("rating_average_from")%>"> <input
			name="rating_average_to" type="hidden"
			value="<%=request.getAttribute("rating_average_to")%>"> <input
			name="views_radio" type="hidden"
			value="<%=request.getAttribute("views_radio")%>"> <input
			name="views_from" type="hidden"
			value="<%=request.getAttribute("views_from")%>"> <input
			name="views_to" type="hidden"
			value="<%=request.getAttribute("views_to")%>"> <input
			name="title_radio" type="hidden"
			value="<%=request.getAttribute("title_radio")%>"> <input
			name="title_type_radio" type="hidden"
			value="<%=request.getAttribute("title_type_radio")%>"> <input
			name="title" type="hidden" value="<%=request.getAttribute("title")%>">
		<input name="sort_order" type="hidden"
			value="<%=request.getAttribute("sort_order")%>">
	</form>
	<form name = "Change"id="formChange" method="POST" action="/webA/ja/S00006/change">
		<input name="release_date_is_radio" type="hidden"
			value="<%=request.getAttribute("release_date_is_radio")%>"> <input
			name="release_date_is_from" type="hidden"
			value="<%=request.getAttribute("release_date_is_from")%>"> <input
			name="release_date_is_to" type="hidden"
			value="<%=request.getAttribute("release_date_is_to")%>"> <input
			name="rating_radio" type="hidden"
			value="<%=request.getAttribute("rating_radio")%>"> <input
			name="rating_from" type="hidden"
			value="<%=request.getAttribute("rating_from")%>"> <input
			name="rating_to" type="hidden"
			value="<%=request.getAttribute("rating_to")%>"> <input
			name="rating_average_radio" type="hidden"
			value="<%=request.getAttribute("rating_average_radio")%>"> <input
			name="rating_average_from" type="hidden"
			value="<%=request.getAttribute("rating_average_from")%>"> <input
			name="rating_average_to" type="hidden"
			value="<%=request.getAttribute("rating_average_to")%>"> <input
			name="views_radio" type="hidden"
			value="<%=request.getAttribute("views_radio")%>"> <input
			name="views_from" type="hidden"
			value="<%=request.getAttribute("views_from")%>"> <input
			name="views_to" type="hidden"
			value="<%=request.getAttribute("views_to")%>"> <input
			name="title_radio" type="hidden"
			value="<%=request.getAttribute("title_radio")%>"> <input
			name="title_type_radio" type="hidden"
			value="<%=request.getAttribute("title_type_radio")%>"> <input
			name="title" type="hidden" value="<%=request.getAttribute("title")%>">
		<input name="sort_order" type="hidden"
			value="<%=request.getAttribute("sort_order")%>">
	</form>

</body>
</html>
