<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.excd.bean.ComposerRecordY"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords"
	content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ">
<meta name="description"
	content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。">
<title>作曲家紹介</title>
<link rel="stylesheet" href="/webA/css/main.css">
<script src="/webA/js/jquery-3.3.0.min.js"></script>
<script src="/webA/js/util.js"></script>
<!-- 画像の圧縮表示設定 -->
<style>
div.song_list ul li div.cell div.song1 img {
	position: relative;
	left: 0px;
	top: -11px;
	width: 275px;
	height: 182px;
}

div.song_list ul li div.cell div.song2 img {
	position: relative;
	left: 0px;
	top: -134.5px;
	width: 275px;
	height: 429px;
}

div.song_list ul li div.cell div.song3 img {
	position: relative;
	left: 0px;
	top: -30.5px;
	width: 275px;
	height: 220px;
}
</style>
</head>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->

	<%
		List<ComposerRecordY> composerList = (List<ComposerRecordY>) request.getAttribute("composerList");
		String count = (String)request.getAttribute("count");
		String sum_str1 = (String)request.getAttribute("sum_str1");
		double avg = (double)request.getAttribute("avg");
		String sum_str2 = (String)request.getAttribute("sum_str2");
	%>


	<div id="layer_marker"></div>

	<div class="wrapper">

		<!-- タイトルバー -->
		<div class="title_bar">
			<p class="page_title">作曲家紹介</p>
			<a href="#" id="menu_open"> <img alt="メニュー"
				src="/webA/images/menu.png" class="menu-icon">
			</a>
		</div>

		<!-- メニューの起点 -->
		<div id="menu_marker"></div>

		<!-- 基本情報 -->
		<div class="double_rows_table">
			<table>
				<tr>
					<td class="label">ID</td>
					<td class="value"><%=composerList.get(0).getUnique_code()%></td>
				</tr>
				<tr>
					<td class="label">ニックネーム</td>
					<td class="value"><%=composerList.get(0).getNickname()%></td>
				</tr>
			</table>
		</div>

		<!-- メッセージ -->
		<div class="single_row_table">
			<table>
				<tr>
					<td class="label">メッセージ</td>
				</tr>
				<tr>
					<td class="value"><%=composerList.get(0).getMessage()%></td>
				</tr>
			</table>
		</div>

		<!-- プロフィール -->
		<div class="single_row_table">
			<table>
				<tr>
					<td class="label">プロフィール</td>
				</tr>
				<tr>
					<td class="value"><span class="label_top">性別：</span> <span
						class="value"><%=composerList.get(0).getGender()%></span> <span class="label">誕生日：</span> <span
						class="value"><%=composerList.get(0).getBirthday()%></span> <br> <span class="label_top">FB：</span>
						<span class="value"><a href="https://google.co.jp"><%=composerList.get(0).getFb_link()%></a></span>
						<br> <span class="label_top">Twitter：</span> <span
						class="value"><a href="https://google.co.jp"><%=composerList.get(0).getTw_link()%></a></span>
					</td>
				</tr>
			</table>
		</div>

		<!-- 情報 -->
		<div class="single_row_table">
			<table>
				<tr>
					<td class="label">情報</td>
				</tr>
				<tr>
					<td class="value"><span class="label_top">登録：</span> <span
						class="value"><%=composerList.get(0).getJoined_date()%></span> <br> <span class="label_top">作品数：</span>
						<span class="value"><%=count%></span> <br> <span class="label_top">総感動指数：</span>
						<span class="value"><%=sum_str1%></span> <br> <span
						class="label_top">平均感動指数：</span> <span class="value"><%=avg%></span> <br>

						<span class="label_top">総再生回数：</span> <span class="value"><%=sum_str2%></span>
						<br></td>
				</tr>
			</table>
		</div>

		<!-- 関連リンク -->
		<div class="single_row_table">
			<table>
				<tr>
					<td class="label">関連リンク</td>
				</tr>
				<tr>
					<td class="value"><a href="https://google.co.jp"><%=composerList.get(0).getOther_link_url()%></a></td>
				</tr>
			</table>
		</div>

		<!-- 公開曲一覧のヘッダー -->
		<div class="sub_header">
			<p>公開曲一覧</p>
		</div>

		<!-- ソングテーブル -->
		<div class="song_list">
			<ul>
			
			<%
						for(ComposerRecordY record : composerList){
						%>
				<li>
					<div class="cell">
						<div class="song_title"><%=record.getTitle() %></div>
						<div class="image_base">
							<a href="S00003.html">
								<div class="image song1">
									<img alt="希望の扉" src="/webA/images/<%=record.getImage_file_name() %>"> <img
										alt="play" class="play" src="/webA/images/play.png">
								</div>
							</a>
						</div>
						<div class="detail">
							<span class="label_top">総感動指数：</span> <span class="value"><%=record.getRating_total() %></span>
							<span class="label">平均感動指数：</span> <span class="value"><%=record.getRating_average() %></span>
							<span class="label">再生回数：</span> <span class="value"><%=record.getTotal_listen_count() %></span>
							<span class="label">公開：</span> <span class="value"><%=record.getRelease_datetime() %></span>
						</div>
					</div>
				</li>
			<%} %>
			</ul>
		</div>


		<!-- ページトップへjavaScript -->
		<div id="pagetop" hidden>
			<img alt="ページトップ" src="../images/pagetop.png">
		</div>

		<!-- フッター -->
		<footer>
			Copyright <a href="https://www.excd.jp/">© EXCEED Co., Ltd.</a> All
			Rights Reserved.
		</footer>

	</div>
</body>
</html>