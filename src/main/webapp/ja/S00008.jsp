<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.excd.servlet.ComposerRecord_s"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ja">

<%
List<ComposerRecord_s> composer = (List<ComposerRecord_s>) request.getAttribute("list");
%>

<head>
<style type="text/css">
.font_test {
	font-size: 15px; /* 文字サイズ指定 */
	color: #0000FF; /* 文字色指定 */
}

.font_test2 {
	font-size: 15px; /* 文字サイズ指定 */
	color: #000000; /* 文字色指定 */
}

.font_test3 {
	font-size: 18px; /* 文字サイズ指定 */
	color: #000000; /* 文字色指定 */
}

hr {
	height: 2.0px;
	background: blue;
	border: none;
}

label {
	display: inline-block;
	width: 110px;
}

body {
	width: 100%;
	max-width: 700px;
	margin: auto;
}
</style>

<style>
input.back {
	position: absolute;
	display: block;
	height: 40px;
	width: 60px;
	top: 0px;
	left: 0px;
	box-sizing: border-box;
	font-size: 12px;
	line-height: 40px;
	color: #333333;
	text-align: center;
	background-color: #cccccc;
	text-decoration: none;
}

div.main_button input {
	margin-top: 8px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 40px;
	width: 95%;
}

div.main_button input {
	display: block;
	box-sizing: border-box;
	font-size: 18px;
	text-align: center;
	width: 100%;
	height: 36px;
	line-height: 36px;
	border: thin solid #333333;
	background-color: #cccccc;
	color: #000080;
	text-decoration: none;
}

div.message_with_right_button div.right_button input {
	display: block;
	box-sizing: border-box;
	font-size: 18px;
	text-align: center;
	width: 120;
	height: 36px;
	line-height: 36px;
	border: thin solid #333333;
	background-color: #cccccc;
	color: #000080;
	text-decoration: none;
}
</style>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords"
	content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ">
<meta name="description"
	content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。">

<title>作曲家検索</title>
<link rel="stylesheet" href="/webA/css/main.css">

<script src="/webA/js/jquery-3.3.0.min.js"></script>
<script src="/webA/js/util.js"></script>
<script src="/webA/js/input.js"></script>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->
	<div id="layer_marker"></div>

	<div class="wrapper"></div>

	<!-- タイトルバー -->

	<div class="title_bar">
		<p class="page_title">作曲家検索</p>

		<form method="post" action="/webA/ja/S00008/back">
			<input name="nickname_radio" type="hidden" value="<%=request.getAttribute("nickname_radio")%>">
				<input name="nickname_type_radio" type="hidden" value="<%=request.getAttribute("nickname_type_radio")%>">
				<input name="nickname" type="hidden" value="<%=request.getAttribute("nickname")%>">
				<input name="joined_date_radio" type="hidden" value="<%=request.getAttribute("joined_date_radio")%>">
				<input name="joined_date_from" type="hidden" value="<%=request.getAttribute("joined_date_from")%>">
				<input name="joined_date_to" type="hidden" value="<%=request.getAttribute("joined_date_to")%>">
				<input name="gender_radio" type="hidden" value="<%=request.getAttribute("gender_radio")%>">
				<input name="gender" type="hidden" value="<%=request.getAttribute("gender")%>">
				<input name="birthday_radio" type="hidden" value="<%=request.getAttribute("birthday_radio")%>">
				<input name="birthday_from" type="hidden" value="<%=request.getAttribute("birthday_from")%>">
				<input name="birthday_to" type="hidden" value="<%=request.getAttribute("birthday_to")%>">
				<input name="listener_count_radio" type="hidden" value="<%=request.getAttribute("listener_count_radio")%>">
				<input name="listener_count_from" type="hidden" value="<%=request.getAttribute("listener_count_from")%>">
				<input name="listener_count_to" type="hidden" value="<%=request.getAttribute("listener_count_to")%>">
				<input name="language_type_jp" type="hidden" value="<%=request.getAttribute("language_type_jp")%>">
				<input name="language_type_en" type="hidden" value="<%=request.getAttribute("language_type_en")%>">
				<input name="sort_order" type="hidden" value="<%=request.getAttribute("sort_order")%>">
			<input type="submit" id="back" value="&lt;&nbsp;戻る" class="back"></input>
		</form>
		<a href="#" id="menu_open"> <img alt="メニュー" src="/webA/images/menu.png" class="menu-icon">
		</a>
	</div>


	<!-- メニューの起点 -->
	<div id="menu_marker"></div>

	<!-- フォーム -->
	<form name="main" method="post" action="/webA/ja/S00008/change">
			<input name="nickname_radio" type="hidden" value="<%=request.getAttribute("nickname_radio")%>">
				<input name="nickname_type_radio" type="hidden" value="<%=request.getAttribute("nickname_type_radio")%>">
				<input name="nickname" type="hidden" value="<%=request.getAttribute("nickname")%>">
				<input name="joined_date_radio" type="hidden" value="<%=request.getAttribute("joined_date_radio")%>">
				<input name="joined_date_from" type="hidden" value="<%=request.getAttribute("joined_date_from")%>">
				<input name="joined_date_to" type="hidden" value="<%=request.getAttribute("joined_date_to")%>">
				<input name="gender_radio" type="hidden" value="<%=request.getAttribute("gender_radio")%>">
				<input name="gender" type="hidden" value="<%=request.getAttribute("gender")%>">
				<input name="birthday_radio" type="hidden" value="<%=request.getAttribute("birthday_radio")%>">
				<input name="birthday_from" type="hidden" value="<%=request.getAttribute("birthday_from")%>">
				<input name="birthday_to" type="hidden" value="<%=request.getAttribute("birthday_to")%>">
				<input name="listener_count_radio" type="hidden" value="<%=request.getAttribute("listener_count_radio")%>">
				<input name="listener_count_from" type="hidden" value="<%=request.getAttribute("listener_count_from")%>">
				<input name="listener_count_to" type="hidden" value="<%=request.getAttribute("listener_count_to")%>">
				<input name="language_type_jp" type="hidden" value="<%=request.getAttribute("language_type_jp")%>">
				<input name="language_type_en" type="hidden" value="<%=request.getAttribute("language_type_en")%>">
				<input name="sort_order" type="hidden" value="<%=request.getAttribute("sort_order")%>">
				
		<!-- 検索結果表示 -->

		<div class="right_button">
			<div class="message_with_right_button">
				<p class="font_test3">
					<%=request.getAttribute("hits")	%>
				</p>
				<div class="right_button">
						<input type="submit" id="change1" value="&nbsp;&nbsp;条件変更&nbsp;&nbsp;"></input>
					</form>
				</div>
			</div>
		</div>


		<form>
			<div class="detail">
				<ul>
					<%
					for (ComposerRecord_s record : composer) {
					%>
					<p>
					<a href="/webA/ja/S00004/<%=record.getUnique_code()%>" style="font-size: 20pt; color: #0000FF;"><%=record.getNickname()%></a>
					</p>
					<label for="name"><span class="font_test">登録日：</span></label>
					<span class="font_test2"> <%=record.getDate()%>
					</span>
					<br>

					<% if(record.getGender() != null){ %>
					<label for="name"><span class="font_test">性別：</span></label>
					<span class="font_test2"> <%=record.getGender()%>
					</span> <%} %>
					<br>

					<% if(record.getBirthday() != null){ %>
					<label for="name"><span class="font_test">誕生日：</span></label>
					<span class="font_test2"> <%=record.getBirthday()%>
					</span> <%} %>
					<br>

					<label for="name"><span class="font_test">リスナー数：</span></label>
					<span class="font_test2"> <%=record.getListener()%>
					</span>
					<br>

					<label for="name"><span class="font_test">言語：</span></label>
					<span class="font_test2"> <%=record.getLanguage()%>
					</span>
					<hr>
					<%}%>
				</ul>
			</div>
			<br>
		</form>

		<!-- メインボタン -->

		<div class="main_button">
			<form method="post" action="/webA/ja/S00008/change">
			<input name="nickname_radio" type="hidden" value="<%=request.getAttribute("nickname_radio")%>">
				<input name="nickname_type_radio" type="hidden" value="<%=request.getAttribute("nickname_type_radio")%>">
				<input name="nickname" type="hidden" value="<%=request.getAttribute("nickname")%>">
				<input name="joined_date_radio" type="hidden" value="<%=request.getAttribute("joined_date_radio")%>">
				<input name="joined_date_from" type="hidden" value="<%=request.getAttribute("joined_date_from")%>">
				<input name="joined_date_to" type="hidden" value="<%=request.getAttribute("joined_date_to")%>">
				<input name="gender_radio" type="hidden" value="<%=request.getAttribute("gender_radio")%>">
				<input name="gender" type="hidden" value="<%=request.getAttribute("gender")%>">
				<input name="birthday_radio" type="hidden" value="<%=request.getAttribute("birthday_radio")%>">
				<input name="birthday_from" type="hidden" value="<%=request.getAttribute("birthday_from")%>">
				<input name="birthday_to" type="hidden" value="<%=request.getAttribute("birthday_to")%>">
				<input name="listener_count_radio" type="hidden" value="<%=request.getAttribute("listener_count_radio")%>">
				<input name="listener_count_from" type="hidden" value="<%=request.getAttribute("listener_count_from")%>">
				<input name="listener_count_to" type="hidden" value="<%=request.getAttribute("listener_count_to")%>">
				<input name="language_type_jp" type="hidden" value="<%=request.getAttribute("language_type_jp")%>">
				<input name="language_type_en" type="hidden" value="<%=request.getAttribute("language_type_en")%>">
				<input name="sort_order" type="hidden" value="<%=request.getAttribute("sort_order")%>">
				
				<input type="submit" id="change2" value="条件変更"></input>
		</div>
	</form>

	<input type="hidden" id="context_path" value="<%= contextPath %>">

	<!-- ページトップへjavaScript -->
	<div id="pagetop">
		<a href="#"><img alt="ページトップ" src="/webA/images/pagetop.png"></a>
	</div>

	<!-- フッター -->
	<footer>
		Copyright <a href="https://www.excd.jp/">© EXCEED Co., Ltd.</a> All Rights Reserved.
	</footer>
</body>
</html>