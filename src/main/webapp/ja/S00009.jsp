<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<title>アプリダウンロード</title>
<link rel="stylesheet" href="../css/main.css">
<script src="../js/jquery-3.3.0.min.js"></script>
<script src="../js/util.js"></script>

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
p{
padding-bottom: 10px;
}
.pic1 img {
	border-radius: 20px;
	padding-left: 10px;
}
.img{
padding-bottom: 250px;
}
div.wrapper {
  width: 100%;
  margin: 0 auto;
  max-width: 450px;
}
div.title_bar {
  /* absoluteの起点 */
  position:relative;
  width: 100%;
  height: 40px;
  background-color: #e6e6fa;
}
div.title_bar p.sub_title {
position:absolute;
  display: flex;
  align-items: center;
  height: 40px;
  top: 0px;
  left: 120px;
  font-size: 24px;
  vertical-align: middle;
  padding-right: 62px;
  white-space: nowrap;
}

</style>
</head>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->
	<div id="layer_marker"></div>
	
	<div class="wrapper">
		<!-- タイトルバー -->
		<div class="title_bar">
		
			<p class="sub_title">アプリダウンロード</p>
			
			<a href="#" id="menu_open"> <img alt="メニュー"
				src="../images/menu.png" class="menu-icon">
			</a>
			<!-- メニューの起点 -->
			<div id="menu_marker"></div>
		</div>
		<p>当コミュニティーの参加には、専用アプリ「メロコ」が必要です。
			専用アプリ「メロコ」をお使いになれば、曲の視聴、コメントなど行うことができます。</p>
		<div class="img">
			<figure class="pic1">
				<a
					href="https://apps.apple.com/jp/app/%E3%83%A1%E3%83%AD%E3%82%B3/id1440134774">
					<img alt="melokoicon" class="melokoicon"
					src="../images/melokoIcon.png" width="100" height="100">
				</a>
			</figure>
			<br> <a
				href="https://apps.apple.com/jp/app/%E3%83%A1%E3%83%AD%E3%82%B3/id1440134774">
				<img alt="melokoicon" class="app" src="../images/applestore.png">
			</a>
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