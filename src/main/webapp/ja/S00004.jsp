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
<link rel="stylesheet" href="/webA/css/main.css?<?php echo date('YmdHis'); ?>">
<script src="/webA/js/jquery-3.3.0.min.js"></script>
<script src="/webA/js/util.js"></script>
<!-- 画像の圧縮表示設定 -->
<style>
img.a {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
</head>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->

	<%
		List<ComposerRecordY> composerList = (List<ComposerRecordY>) request.getAttribute("composerList");
		int count = (int)request.getAttribute("count");
		String sum_str1 = (String)request.getAttribute("sum_str1");
		double avg = (double)request.getAttribute("avg");
		String sum_str2 = (String)request.getAttribute("sum_str2");
		
		String contextPath = request.getContextPath();
	%>

	<input type="hidden" id="context_path" value="<%= contextPath %>">

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
			<% if(composerList.get(0).getMessage() != null){ %>
			<table>
				<tr>
					<td class="label">メッセージ</td>
				</tr>
				<tr>
					<td class="value"><%=composerList.get(0).getMessage()%></td>
				</tr>
			</table>
			<% } %>
			
		</div>

		<!-- プロフィール -->
		<div class="single_row_table">
			<table>
				<tr>
					<td class="label">プロフィール</td>
				</tr>
				<tr>
					<td class="value">
						<% if(composerList.get(0).getGender() != null){ %>
						<span class="label_top">性別：</span> <span class="value"><%=composerList.get(0).getGender()%></span> 
						<% } %>
						
						<% if(composerList.get(0).getBirthday() != null ){ %>
						<span class="label_top">誕生日：</span> <span class="value"><%=composerList.get(0).getBirthday()%></span> 
						<% } %> <br>
						
						<% if(composerList.get(0).getFb_link() != null){ %>
						<span class="label_top">FB：</span> <span class="value"> <a href="<%=composerList.get(0).getFb_link()%>"> <%=composerList.get(0).getFb_link()%></a></span><br>
						<% } %> 
						
						<% if(composerList.get(0).getTw_link() != null){ %>
						<span class="label_top"> Twitter：</span> <span class="value"> <a href="<%=composerList.get(0).getTw_link()%>"> <%=composerList.get(0).getTw_link()%></a></span>
						<% } %>
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
					<td class="value">
						<span class="label_top">登録：</span> <span class="value"><%=composerList.get(0).getJoined_date()%></span> <br> 
						<span class="label_top">作品数：</span> 
						<%-- リストの中に曲名がない場合(曲を公開していない作曲家もいるため) --%>
						<% if(composerList.get(0).getTitle() == null ){ %>
						<%-- レコード数から-1した値を表示する --%>
						<span class="value"><%= count-1 %> </span> <br>
						<% }else{ %>
						<%-- レコード数を表示する --%>
						<span class="value"><%= count %> </span> <br>
						<% } %>
						<span class="label_top">総感動指数：</span> <span class="value"><%=sum_str1%></span> <br> 
						<span class="label_top">平均感動指数：</span> <span class="value"><%=avg%></span> <br>
						<span class="label_top">総再生回数：</span> <span class="value"><%=sum_str2%></span> <br>
					</td>
				</tr>
			</table>
		</div>

		<!-- 関連リンク -->
		<div class="single_row_table">
			<% if(composerList.get(0).getOther_link_description() != null && composerList.get(0).getOther_link_url() != null){ %>
			<table>
				<tr>
					<td class="label">関連リンク</td>
				</tr>
				<tr>
					<td class="value"><a href="<%=composerList.get(0).getOther_link_url()%>"><%=composerList.get(0).getOther_link_description()%></a></td>
				</tr>
			</table>
			<% } %>
		</div>

		<!-- 公開曲一覧のヘッダー -->
		<div class="sub_header">
			<p>公開曲一覧</p>
		</div>

		<!-- ソングテーブル -->
		<div class="song_list">
			<ul>
			<% for(ComposerRecordY record : composerList){ %>
			<%-- 曲名がnullでなかった場合、以下の処理をする --%>
			<% if(record.getTitle() != null){ %>
				<li>
					<div class="cell">
						<div class="song_title"><%=record.getTitle() %></div>
						<div class="image_base">
							<a href="http://localhost:8080/webA/ja/S00003/<%=record.getID() %>">
								<div class="image song1">
									<img alt="title" class = "a" src="/webA/images/<%=record.getImage_file_name() %>"> 
									<img alt="play" class="play" src="/webA/images/play.png">
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
			<%} %>
			</ul>
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
</body>
</html>