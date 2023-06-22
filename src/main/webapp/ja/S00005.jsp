<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jp.excd.servlet.S00005"%>
<!DOCTYPE HTML>
<html>
<%
// (1) 「エラー情報(error)」が設定されている場合は、画面に「エラー情報(error)」を表示する。
String errorMessage = (String) request.getAttribute("error");
if (errorMessage == null)
	errorMessage = "";
// (2) 「公開日_エラー状態(release_date_is_error)」= "1"の場合
String release_date_is_error = "";
if ("1".equals(request.getAttribute("release_date_is_error"))) {
	release_date_is_error = ", error";
}

// (3) 以下の項目を元に公開日の入力状態を再現する。
String release_date_Radio1 = "";
String release_date_Radio2 = "";
if ("1".equals(request.getAttribute("release_date_is_radio"))) {
	release_date_Radio1 = "checked=\"checked\"";
} else {
	release_date_Radio2 = "checked=\"checked\"";
}
String release_date_is_from = (String) request.getAttribute("release_date_is_from");
String release_date_is_to = (String) request.getAttribute("release_date_is_to");

// (4) 「感動指数_エラー状態(rating_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
String rating_is_error = "";
if ("1".equals(request.getAttribute("rating_is_error"))) {
	rating_is_error = ", error";
}
// (5) 以下の項目を元に感動指数の入力状態を再現する。
String rating_radio1 = "";
String rating_radio2 = "";
if ("1".equals(request.getAttribute("rating_radio"))) {
	rating_radio1 = "checked=\"checked\"";
} else {
	rating_radio2 = "checked=\"checked\"";
}
String rating_from = (String) request.getAttribute("rating_from");
if (rating_from == null)
	rating_from = "";
String rating_to = (String) request.getAttribute("rating_to");
if (rating_to == null)
	rating_to = "";

// (6) 「平均感動指数_エラー状態(rating_average_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
String rating_average_is_error = "";
if ("1".equals(request.getAttribute("rating_average_is_error"))) {
	rating_is_error = ", error";
}
// (7) 以下の項目を元に平均感動指数の入力状態を再現する。rating_average_radio
String rating_average_radio1 = "";
String rating_average_radio2 = "";
if ("1".equals(request.getAttribute("rating_average_radio"))) {
	rating_average_radio1 = "checked=\"checked\"";
} else {
	rating_average_radio2 = "checked=\"checked\"";
}
//平均感動指数の指数選択
String rating_average_from = (String) request.getAttribute("rating_average_from");
String averageFrom10 = "";
String averageFrom11 = "";
String averageFrom12 = "";
String averageFrom13 = "";
String averageFrom14 = "";
String averageFrom15 = "";
String averageFrom16 = "";
String averageFrom17 = "";
String averageFrom18 = "";
String averageFrom19 = "";
String averageFrom20 = "";
String averageFrom21 = "";
String averageFrom22 = "";
String averageFrom23 = "";
String averageFrom24 = "";
String averageFrom25 = "";
String averageFrom26 = "";
String averageFrom27 = "";
String averageFrom28 = "";
String averageFrom29 = "";
String averageFrom30 = "";
String averageFrom31 = "";
String averageFrom32 = "";
String averageFrom33 = "";
String averageFrom34 = "";
String averageFrom35 = "";
String averageFrom36 = "";
String averageFrom37 = "";
String averageFrom38 = "";
String averageFrom39 = "";
String averageFrom40 = "";
String averageFrom41 = "";
String averageFrom42 = "";
String averageFrom43 = "";
String averageFrom44 = "";
String averageFrom45 = "";
String averageFrom46 = "";
String averageFrom47 = "";
String averageFrom48 = "";
String averageFrom49 = "";
String averageFrom50 = "";

if (rating_average_from == null) {
	averageFrom40 = "selected";
} else if (rating_average_from.equals("1.0")) {
	averageFrom10 = "selected";
} else if (rating_average_from.equals("1.1")) {
	averageFrom11 = "selected";
} else if (rating_average_from.equals("1.2")) {
	averageFrom12 = "selected";
} else if (rating_average_from.equals("1.3")) {
	averageFrom13 = "selected";
} else if (rating_average_from.equals("1.4")) {
	averageFrom14 = "selected";
} else if (rating_average_from.equals("1.5")) {
	averageFrom15 = "selected";
} else if (rating_average_from.equals("1.6")) {
	averageFrom16 = "selected";
} else if (rating_average_from.equals("1.7")) {
	averageFrom17 = "selected";
} else if (rating_average_from.equals("1.8")) {
	averageFrom18 = "selected";
} else if (rating_average_from.equals("1.9")) {
	averageFrom19 = "selected";
} else if (rating_average_from.equals("2.0")) {
	averageFrom20 = "selected";
} else if (rating_average_from.equals("2.1")) {
	averageFrom21 = "selected";
} else if (rating_average_from.equals("2.2")) {
	averageFrom22 = "selected";
} else if (rating_average_from.equals("2.3")) {
	averageFrom23 = "selected";
} else if (rating_average_from.equals("2.4")) {
	averageFrom24 = "selected";
} else if (rating_average_from.equals("2.5")) {
	averageFrom25 = "selected";
} else if (rating_average_from.equals("2.6")) {
	averageFrom26 = "selected";
} else if (rating_average_from.equals("2.7")) {
	averageFrom27 = "selected";
} else if (rating_average_from.equals("2.8")) {
	averageFrom28 = "selected";
} else if (rating_average_from.equals("2.9")) {
	averageFrom29 = "selected";
} else if (rating_average_from.equals("3.0")) {
	averageFrom30 = "selected";
} else if (rating_average_from.equals("3.1")) {
	averageFrom31 = "selected";
} else if (rating_average_from.equals("3.2")) {
	averageFrom32 = "selected";
} else if (rating_average_from.equals("3.3")) {
	averageFrom33 = "selected";
} else if (rating_average_from.equals("3.4")) {
	averageFrom34 = "selected";
} else if (rating_average_from.equals("3.5")) {
	averageFrom35 = "selected";
} else if (rating_average_from.equals("3.6")) {
	averageFrom36 = "selected";
} else if (rating_average_from.equals("3.7")) {
	averageFrom37 = "selected";
} else if (rating_average_from.equals("3.8")) {
	averageFrom38 = "selected";
} else if (rating_average_from.equals("3.9")) {
	averageFrom39 = "selected";
} else if (rating_average_from.equals("4.0")) {
	averageFrom40 = "selected";
} else if (rating_average_from.equals("4.1")) {
	averageFrom41 = "selected";
} else if (rating_average_from.equals("4.2")) {
	averageFrom42 = "selected";
} else if (rating_average_from.equals("4.3")) {
	averageFrom43 = "selected";
} else if (rating_average_from.equals("4.4")) {
	averageFrom44 = "selected";
} else if (rating_average_from.equals("4.5")) {
	averageFrom45 = "selected";
} else if (rating_average_from.equals("4.6")) {
	averageFrom46 = "selected";
} else if (rating_average_from.equals("4.7")) {
	averageFrom47 = "selected";
} else if (rating_average_from.equals("4.8")) {
	averageFrom48 = "selected";
} else if (rating_average_from.equals("4.9")) {
	averageFrom49 = "selected";
} else if (rating_average_from.equals("5.0")) {
	averageFrom50 = "selected";
}

String rating_average_to = (String) request.getAttribute("rating_average_to");

String averageTo10 = "";
String averageTo11 = "";
String averageTo12 = "";
String averageTo13 = "";
String averageTo14 = "";
String averageTo15 = "";
String averageTo16 = "";
String averageTo17 = "";
String averageTo18 = "";
String averageTo19 = "";
String averageTo20 = "";
String averageTo21 = "";
String averageTo22 = "";
String averageTo23 = "";
String averageTo24 = "";
String averageTo25 = "";
String averageTo26 = "";
String averageTo27 = "";
String averageTo28 = "";
String averageTo29 = "";
String averageTo30 = "";
String averageTo31 = "";
String averageTo32 = "";
String averageTo33 = "";
String averageTo34 = "";
String averageTo35 = "";
String averageTo36 = "";
String averageTo37 = "";
String averageTo38 = "";
String averageTo39 = "";
String averageTo40 = "";
String averageTo41 = "";
String averageTo42 = "";
String averageTo43 = "";
String averageTo44 = "";
String averageTo45 = "";
String averageTo46 = "";
String averageTo47 = "";
String averageTo48 = "";
String averageTo49 = "";
String averageTo50 = "";

if (rating_average_to == null) {
	averageTo50 = "selected";
} else if (rating_average_to.equals("1.0")) {
	averageTo10 = "selected";
} else if (rating_average_to.equals("1.1")) {
	averageTo11 = "selected";
} else if (rating_average_to.equals("1.2")) {
	averageTo12 = "selected";
} else if (rating_average_to.equals("1.3")) {
	averageTo13 = "selected";
} else if (rating_average_to.equals("1.4")) {
	averageTo14 = "selected";
} else if (rating_average_to.equals("1.5")) {
	averageTo15 = "selected";
} else if (rating_average_to.equals("1.6")) {
	averageTo16 = "selected";
} else if (rating_average_to.equals("1.7")) {
	averageTo17 = "selected";
} else if (rating_average_to.equals("1.8")) {
	averageTo18 = "selected";
} else if (rating_average_to.equals("1.9")) {
	averageTo19 = "selected";
} else if (rating_average_to.equals("2.0")) {
	averageTo20 = "selected";
} else if (rating_average_to.equals("2.1")) {
	averageTo21 = "selected";
} else if (rating_average_to.equals("2.2")) {
	averageTo22 = "selected";
} else if (rating_average_to.equals("2.3")) {
	averageTo23 = "selected";
} else if (rating_average_to.equals("2.4")) {
	averageTo24 = "selected";
} else if (rating_average_to.equals("2.5")) {
	averageTo25 = "selected";
} else if (rating_average_to.equals("2.6")) {
	averageTo26 = "selected";
} else if (rating_average_to.equals("2.7")) {
	averageTo27 = "selected";
} else if (rating_average_to.equals("2.8")) {
	averageTo28 = "selected";
} else if (rating_average_to.equals("2.9")) {
	averageTo29 = "selected";
} else if (rating_average_to.equals("3.0")) {
	averageTo30 = "selected";
} else if (rating_average_to.equals("3.1")) {
	averageTo31 = "selected";
} else if (rating_average_to.equals("3.2")) {
	averageTo32 = "selected";
} else if (rating_average_to.equals("3.3")) {
	averageTo33 = "selected";
} else if (rating_average_to.equals("3.4")) {
	averageTo34 = "selected";
} else if (rating_average_to.equals("3.5")) {
	averageTo35 = "selected";
} else if (rating_average_to.equals("3.6")) {
	averageTo36 = "selected";
} else if (rating_average_to.equals("3.7")) {
	averageTo37 = "selected";
} else if (rating_average_to.equals("3.8")) {
	averageTo38 = "selected";
} else if (rating_average_to.equals("3.9")) {
	averageTo39 = "selected";
} else if (rating_average_to.equals("4.0")) {
	averageTo40 = "selected";
} else if (rating_average_to.equals("4.1")) {
	averageTo41 = "selected";
} else if (rating_average_to.equals("4.2")) {
	averageTo42 = "selected";
} else if (rating_average_to.equals("4.3")) {
	averageTo43 = "selected";
} else if (rating_average_to.equals("4.4")) {
	averageTo44 = "selected";
} else if (rating_average_to.equals("4.5")) {
	averageTo45 = "selected";
} else if (rating_average_to.equals("4.6")) {
	averageTo46 = "selected";
} else if (rating_average_to.equals("4.7")) {
	averageTo47 = "selected";
} else if (rating_average_to.equals("4.8")) {
	averageTo48 = "selected";
} else if (rating_average_to.equals("4.9")) {
	averageTo49 = "selected";
} else if (rating_average_to.equals("5.0")) {
	averageTo50 = "selected";
}
// (8) 「再生回数_エラー状態(views_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
String views_is_error = "";
if ("1".equals(request.getAttribute("views_is_error"))) {
	views_is_error = ", error";
}

// (9) 以下の項目を元に再生回数の入力状態を再現する。
String views_radio1 = "";
String views_radio2 = "";
if ("1".equals(request.getAttribute("views_radio"))) {
	views_radio1 = "checked=\"checked\"";
} else {
	views_radio2 = "checked=\"checked\"";
}
String views_from = (String) request.getAttribute("views_from");
if (views_from == null)
	views_from = "";
String views_to = (String) request.getAttribute("views_to");
if (views_to == null)
	views_to = "";

// (10) 「曲名_エラー状態(title_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
String title_is_error = "";
if ("1".equals(request.getAttribute("title_is_error"))) {
	title_is_error = ", error";
}

// (11) 以下の項目を元に曲名の入力状態を再現する。
String title_radio1 = "";
String title_radio2 = "";
if ("1".equals(request.getAttribute("title_radio"))) {
	title_radio1 = "checked=\"checked\"";
} else {
	title_radio2 = "checked=\"checked\"";
}
//あいまいラジオボタン
String title_type_radio1 = "";
String title_type_radio2 = "";
if ("3".equals(request.getAttribute("title_type_radio"))) {
	title_type_radio1 = "checked=\"checked\"";
} else {
	title_type_radio2 = "checked=\"checked\"";
}
String title = (String) request.getAttribute("title");
if (title == null)
	title = "";

// (12) 以下の項目を元に並び順の入力状態を再現する。
String sort_order = (String) request.getAttribute("sort_order");
if (sort_order == null)
	sort_order = "01";
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
<link rel="stylesheet" href="/webA/css/main.css">
<script src="/webA/js/jquery-3.3.0.min.js"></script>
<script src="/webA/js/util.js"></script>
<script src="/webA/js/input.js"></script>
<script>
$(function(){
	$("#id_rating_average_from").val("<%=rating_average_from%>");
	$("#id_rating_average_to").val("<%=rating_average_to%>");
	$("#id_sort_order").val("<%=sort_order%>
	");
	});

	const checkbox1 = document.getElementsByName("title_type_radio")

	function checkAll() {
		checkbox1[0].checked = true
	}
</script>
</head>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->
	<div id="layer_marker"></div>

	<div class="wrapper">

		<!-- タイトルバー -->
		<div class="title_bar">
			<p class="page_title">作品検索</p>
			<a href="#" id="menu_open"> <img alt="メニュー"
				src="/webA/images/menu.png" class="menu-icon">
			</a>
		</div>

		<!-- メニューの起点 -->
		<div id="menu_marker"></div>
		<%
		if ("".equals(errorMessage) == false) {
		%>
		<div class="error_message">
			<img alt="エラー" src="/webA/images/error_mark.png">
			<p><%=errorMessage%></p>
		</div>
		<%
		}
		%>
		<!-- フォーム -->
		<form name="main" action="/webA/ja/S00005/search" method="post">
			<!-- 条件タイトル、フォームをまとめるdiv-->

			<!-- 公開日 -->
			<div id="jouken_date" class="jouken<%=release_date_is_error%>">
				<div class="input_table">
					<table>
						<tr>
							<td class="label" rowspan=2>公開日</td>
							<td class="value">
								<table class="radio_base">
									<tr>
										<td><input type="radio" name="release_date_radio"
											value="1" class="onOffRadio" <%=release_date_Radio1%>><span
											class="radio_label">指定</span></td>
										<td><input type="radio" name="release_date_radio"
											value="0" class="onOffRadio" <%=release_date_Radio2%>><span
											class="radio_label">指定なし</span></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="value"><input type="date"
								name="release_date_from" value="<%=release_date_is_from%>">
								<br> ～ <br> <input type="date" name="release_date_to"
								value="<%=release_date_is_to%>"></td>
						</tr>
					</table>
				</div>
			</div>



			<!-- 感動指数 -->
			<div id="jouken_rating" class="jouken<%=rating_is_error%>">
				<div class="input_table">
					<table>
						<tr>
							<td class="label" rowspan=2>感動指数</td>
							<td class="value">
								<table class="radio_base">
									<tr>
										<td><input type="radio" name="rating_radio" value="1"
											class="onOffRadio" <%=rating_radio1%>><span
											class="radio_label">指定</span></td>
										<td><input type="radio" name="rating_radio" value="0"
											class="onOffRadio" <%=rating_radio2%>><span
											class="radio_label">指定なし</span></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="value"><input type="text" name="rating_from"
								value="<%=rating_from%>"> <br> ～ <br> <input
								type="text" name="rating_to" value="<%=rating_to%>"></td>
						</tr>
					</table>
				</div>
			</div>

			<!-- 平均感動指数 -->
			<div id="jouken_ratingAverage"
				class="jouken<%=rating_average_is_error%>">
				<div class="input_table">
					<table>
						<tr>
							<td class="label" rowspan=2>平均感動指数</td>
							<td class="value">
								<table class="radio_base">
									<tr>
										<td><input type="radio" name="rating_average_radio"
											value="1" class="onOffRadio" <%=rating_average_radio1%>><span
											class="radio_label">指定</span></td>
										<td><input type="radio" name="rating_average_radio"
											value="0" class="onOffRadio" <%=rating_average_radio2%>><span
											class="radio_label">指定なし</span></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="value"><select name="rating_average_from"
								tabindex="1">
									<option value="1.0" <%=averageFrom10%>>1.0</option>
									<option value="1.1" <%=averageFrom11%>>1.1</option>
									<option value="1.2" <%=averageFrom12%>>1.2</option>
									<option value="1.3" <%=averageFrom13%>>1.3</option>
									<option value="1.4" <%=averageFrom14%>>1.4</option>
									<option value="1.5" <%=averageFrom15%>>1.5</option>
									<option value="1.6" <%=averageFrom16%>>1.6</option>
									<option value="1.7" <%=averageFrom17%>>1.7</option>
									<option value="1.8" <%=averageFrom18%>>1.8</option>
									<option value="1.9" <%=averageFrom19%>>1.9</option>
									<option value="2.0" <%=averageFrom20%>>2.0</option>
									<option value="2.1" <%=averageFrom21%>>2.1</option>
									<option value="2.2" <%=averageFrom22%>>2.2</option>
									<option value="2.3" <%=averageFrom23%>>2.3</option>
									<option value="2.4" <%=averageFrom24%>>2.4</option>
									<option value="2.5" <%=averageFrom25%>>2.5</option>
									<option value="2.6" <%=averageFrom26%>>2.6</option>
									<option value="2.7" <%=averageFrom27%>>2.7</option>
									<option value="2.8" <%=averageFrom28%>>2.8</option>
									<option value="2.9" <%=averageFrom29%>>2.9</option>
									<option value="3.0" <%=averageFrom30%>>3.0</option>
									<option value="3.1" <%=averageFrom31%>>3.1</option>
									<option value="3.2" <%=averageFrom32%>>3.2</option>
									<option value="3.3" <%=averageFrom33%>>3.3</option>
									<option value="3.4" <%=averageFrom34%>>3.4</option>
									<option value="3.5" <%=averageFrom35%>>3.5</option>
									<option value="3.6" <%=averageFrom36%>>3.6</option>
									<option value="3.7" <%=averageFrom37%>>3.7</option>
									<option value="3.8" <%=averageFrom38%>>3.8</option>
									<option value="3.9" <%=averageFrom39%>>3.9</option>
									<option value="4.0" <%=averageFrom40%>>4.0</option>
									<option value="4.1" <%=averageFrom41%>>4.1</option>
									<option value="4.2" <%=averageFrom42%>>4.2</option>
									<option value="4.3" <%=averageFrom43%>>4.3</option>
									<option value="4.4" <%=averageFrom44%>>4.4</option>
									<option value="4.5" <%=averageFrom45%>>4.5</option>
									<option value="4.6" <%=averageFrom46%>>4.6</option>
									<option value="4.7" <%=averageFrom47%>>4.7</option>
									<option value="4.8" <%=averageFrom48%>>4.8</option>
									<option value="4.9" <%=averageFrom49%>>4.9</option>
									<option value="5.0" <%=averageFrom50%>>5.0</option>

							</select> <br> ～ <br> <select name="rating_average_to"
								tabindex="2">
									<option value="1.0" <%=averageTo10%>>1.0</option>
									<option value="1.1" <%=averageTo11%>>1.1</option>
									<option value="1.2" <%=averageTo12%>>1.2</option>
									<option value="1.3" <%=averageTo13%>>1.3</option>
									<option value="1.4" <%=averageTo14%>>1.4</option>
									<option value="1.5" <%=averageTo15%>>1.5</option>
									<option value="1.6" <%=averageTo16%>>1.6</option>
									<option value="1.7" <%=averageTo17%>>1.7</option>
									<option value="1.8" <%=averageTo18%>>1.8</option>
									<option value="1.9" <%=averageTo19%>>1.9</option>
									<option value="2.0" <%=averageTo20%>>2.0</option>
									<option value="2.1" <%=averageTo21%>>2.1</option>
									<option value="2.2" <%=averageTo22%>>2.2</option>
									<option value="2.3" <%=averageTo23%>>2.3</option>
									<option value="2.4" <%=averageTo24%>>2.4</option>
									<option value="2.5" <%=averageTo25%>>2.5</option>
									<option value="2.6" <%=averageTo26%>>2.6</option>
									<option value="2.7" <%=averageTo27%>>2.7</option>
									<option value="2.8" <%=averageTo28%>>2.8</option>
									<option value="2.9" <%=averageTo29%>>2.9</option>
									<option value="3.0" <%=averageTo30%>>3.0</option>
									<option value="3.1" <%=averageTo31%>>3.1</option>
									<option value="3.2" <%=averageTo32%>>3.2</option>
									<option value="3.3" <%=averageTo33%>>3.3</option>
									<option value="3.4" <%=averageTo34%>>3.4</option>
									<option value="3.5" <%=averageTo35%>>3.5</option>
									<option value="3.6" <%=averageTo36%>>3.6</option>
									<option value="3.7" <%=averageTo37%>>3.7</option>
									<option value="3.8" <%=averageTo38%>>3.8</option>
									<option value="3.9" <%=averageTo39%>>3.9</option>
									<option value="4.0" <%=averageTo40%>>4.0</option>
									<option value="4.1" <%=averageTo41%>>4.1</option>
									<option value="4.2" <%=averageTo42%>>4.2</option>
									<option value="4.3" <%=averageTo43%>>4.3</option>
									<option value="4.4" <%=averageTo44%>>4.4</option>
									<option value="4.5" <%=averageTo45%>>4.5</option>
									<option value="4.6" <%=averageTo46%>>4.6</option>
									<option value="4.7" <%=averageTo47%>>4.7</option>
									<option value="4.8" <%=averageTo48%>>4.8</option>
									<option value="4.9" <%=averageTo49%>>4.9</option>
									<option value="5.0" <%=averageTo50%>>5.0</option>
							</select></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 再生回数 -->
			<div id="jouken_views" class="jouken<%=views_is_error%>">
				<div class="input_table">
					<table>
						<tr>
							<td class="label" rowspan=2>再生回数</td>
							<td class="value">
								<table class="radio_base">
									<tr>
										<td><input type="radio" name="views_radio" value="1"
											class="onOffRadio" <%=views_radio1%>><span
											class="radio_label">指定</span></td>
										<td><input type="radio" name="views_radio" value="0"
											class="onOffRadio" <%=views_radio2%>><span
											class="radio_label">指定なし</span></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="value"><input type="text" name="views_from"
								value="<%=views_from%>"> <br> ～ <br> <input
								type="text" name="views_to" value="<%=views_to%>"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 曲名 -->
			<div id="jouken_song_title" class="jouken<%=title_is_error%>">
				<div class="input_table">
					<table>
						<tr>
							<td class="label" rowspan=2>曲名</td>
							<td class="value">
								<table class="radio_base">
									<tr>
										<td><input type="radio" onClick="checkAll()"
											name="title_radio" value="1" class="onOffRadio"
											<%=title_radio1%>><span class="radio_label">指定</span>
										</td>

										<td><input type="radio" name="title_radio" value="0"
											class="onOffRadio" <%=title_radio2%>><span
											class="radio_label">指定なし</span></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="value">
								<table class="radio_base">
									<tr>

										<td><input type="radio" name="title_type_radio" value="3"
											<%=title_type_radio1%>><span class="radio_label">あいまい</span></td>
										<td><input type="radio" name="title_type_radio" value="4"
											<%=title_type_radio2%>><span class="radio_label">完全一致</span>
										</td>
									</tr>
								</table> <input type="text" name="title" value="<%=title%>">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 並び順 -->
			<div id="jouken_sort_order" class="jouken">
				<div class="input_table">
					<table>
						<tr>
							<td class="label">並び順</td>
							<td class="value"><select name="sort_order" tabindex="10">
									<option value="01" selected="selected">新しい順</option>
									<option value="02">古い順</option>
									<option value="03">感動指数が多い順</option>
									<option value="04">感動指数が少ない順</option>
									<option value="05">平均感動指数が高い順</option>
									<option value="06">平均感動指数が低い順</option>
									<option value="07">再生回数が多い順</option>
									<option value="08">再生回数が少ない順</option>
							</select></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- メインボタン -->
			<div class="main_button">
				<a href="javascript:main.submit()">検索</a>
			</div>

		</form>

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