<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jp.excd.servlet.S00008"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ja">

<style>
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
</style>

<%
	// (1) 「エラー情報(error)」が設定されている場合は、画面に「エラー情報(error)」を表示する。
	String errorMessage = (String)request.getAttribute("error");
    if (errorMessage == null) errorMessage = "";
    

	// (2) 「ニックネーム_エラー状態(nickname_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String nickname_is_error = "";
	if ("1".equals((String)request.getAttribute("nickname_is_error"))) {
		nickname_is_error = ", error";
	}

	// (3) 以下の項目を元にニックネームの入力状態を再現する。
	String nickname_radio1 = "";
	String nickname_radio2 = "";
	if("1".equals((String)request.getAttribute("nickname_radio"))) {
		nickname_radio1 = "checked=\"checked\"";
	} else {
		nickname_radio2 = "checked=\"checked\"";
	}
	
	String nickname_type_radio1 = "";
	String nickname_type_radio2 = "";
	if ("1".equals((String)request.getAttribute("nickname_type_radio"))) {
		nickname_type_radio1 = "checked=\"checked\"";
	} else {
		nickname_type_radio2 = "checked=\"checked\"";
	}
	
		String nickname = (String)request.getAttribute("nickname");
	if (nickname == null){
		nickname = "";
	}
	
	//ニックネーム選択時に背景色を黄色に変える
	String nickname_change = "";
	if ("1".equals((String)request.getAttribute("nickname_radio"))) {
		nickname_change = ", required";
	}
	
	
	// (4) 「登録日_エラー状態(joined_date_is_error)」= "1"の場合
	String joined_date_is_error = "";
	if ("1".equals((String)request.getAttribute("joined_date_is_error"))) {
		joined_date_is_error = ", error";
	}

	// (5) 以下の項目を元に登録日の入力状態を再現する。
	
	String joined_date_radio1 = "";
	String joined_date_radio2 = "";
    if ("1".equals((String)request.getAttribute("joined_date_radio"))) {
    	joined_date_radio1 = "checked=\"checked\"";
    } else {
		joined_date_radio2 = "checked=\"checked\"";
	}
	
	String joined_date_from = (String)request.getAttribute("joined_date_from");
	if (joined_date_from == null){
		joined_date_from = "";
	}
	String joined_date_to = (String)request.getAttribute("joined_date_to");
	if (joined_date_to == null){
		joined_date_to = "";
	}

	//登録日選択時に背景色を黄色に変える
	String joined_date_change = "";
	if ("1".equals((String)request.getAttribute("joined_date_radio"))) {
		joined_date_change = ", required";
	}
	
	// (6) 以下の項目を元に性別の入力状態を再現する。
	String gender_radio1 = "";
	String gender_radio2 = "";
	if ("1".equals((String)request.getAttribute("gender_radio"))) {
		gender_radio1= "checked=\"checked\"";
	} else {
		gender_radio2 = "checked=\"checked\"";
	}
	
	String gender1 = "";
	String gender2 = "";
	if("2".equals((String)request.getAttribute("gender"))){
		gender2 = "selected";
	} else {
		gender1 = "selected";
	}
	
	//性別選択時に背景色を黄色に変える
	String gender_change = "";
	if ("1".equals((String)request.getAttribute("gender_radio"))) {
		gender_change = ", required";
	}
	
	// (7) 「誕生日_エラー状態(birthday_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String birthday_is_error = "";
	if ("1".equals((String)request.getAttribute("birthday_is_error"))) {
		birthday_is_error = ", error";
	}

	// (8) 以下の項目を元に誕生日の入力状態を再現する。
	String birthday_radio1 = "";
	String birthday_radio2 = "";
	if ("1".equals((String)request.getAttribute("birthday_radio"))) {
		birthday_radio1 = "checked=\"checked\"";
	} else {
		birthday_radio2 = "checked=\"checked\"";
	}
	
	String birthday_from = (String)request.getAttribute("birthday_from");
	if (birthday_from == null){
		birthday_from = "";
	}
	
	String birthday_to = (String)request.getAttribute("birthday_to");
	if (birthday_to == null){
		birthday_to = "";
	}
	
	//誕生日選択時に背景色を黄色に変える
	String birthday_change = "";
	if ("1".equals((String)request.getAttribute("birthday_radio"))) {
		birthday_change = ", required";
	}

	// (9) 「リスナー数_エラー状態(listener_count_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String listener_count_is_error = "";
	if ("1".equals((String)request.getAttribute("listener_count_is_error"))) {
		listener_count_is_error = ", error";
	}
	
	// (10) 以下の項目を元にリスナー数の入力状態を再現する。
	String listener_count_radio1= "";
	String listener_count_radio2 = "";
	if ("1".equals((String)request.getAttribute("listener_count_radio"))) {
		listener_count_radio1= "checked=\"checked\"";
	} else {
		listener_count_radio2 = "checked=\"checked\"";
	}
	
	String listener_count_from = (String)request.getAttribute("listener_count_from");
	if (listener_count_from == null){
		listener_count_from="";
	}
	
	String listener_count_to = (String)request.getAttribute("listener_count_to");
	if (listener_count_to == null){
		listener_count_to ="";
	}
	
	//リスナー数選択時に背景色を黄色に変える
	String listener_change = "";
	if ("1".equals((String)request.getAttribute("listener_count_radio"))) {
		listener_change = ", required";
	}

	// (11) 「言語区分_エラー状態(language_type_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String language_type_is_error = "";
	if ("1".equals((String)request.getAttribute("language_type_is_error"))) {
		language_type_is_error = ", error";
	}
	
	// (12) 以下の項目を元に言語区分の入力状態を再現する。
	String language_type_jp = "";
	String language_type_en = "";
	if ("002".equals((String)request.getAttribute("language_type_jp"))) {
		language_type_jp = "checked=\"checked\"";
	}
	if ("001".equals((String)request.getAttribute("language_type_en"))) {
		language_type_en = "checked=\"checked\"";
	}
	
	//（13）以下の項目を元に並び順の入力状態を再現する。
	String sort_order01 = "";
	String sort_order02 = "";
	String sort_order03 = "";
	String sort_order04 = "";
	
	if ("02".equals((String)request.getAttribute("sort_order"))) {
		sort_order02 = "selected";
	} else if ("03".equals((String)request.getAttribute("sort_order"))) {
		sort_order03 = "selected";
	} else if ("04".equals((String)request.getAttribute("sort_order"))) {
		sort_order04 = "selected";
	} else  {
		sort_order01 = "selected";
	}
%>

<head>

<link rel="stylesheet" href="/webA/css/main.css">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords"
	content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ">
<meta name="description"
	content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。">
<title>作曲家検索</title>

<script src="/webA/js/jquery-3.3.0.min.js"></script>
<script src="/webA/js/util.js"></script>
<script src="/webA/js/input.js"></script>
<script>
const nickname_radio1 = document.getElementsByName("nickname_type_radio")

function checkAll() {
	nickname_radio1[0].checked = true
}
</script>

</head>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->
	<div id="layer_marker"></div>

	<div class="wrapper">

		<!-- タイトルバー -->
		<div class="title_bar">
			<p class="page_title">作曲家検索結果</p>
			<a href="#" id="menu_open"> <img alt="メニュー" src="/webA/images/menu.png" class="menu-icon">
			</a>
		</div>

		<!-- メニューの起点 -->
		<div id="menu_marker"></div>

		<!-- エラーメッセージ -->
		<%
			if ("".equals(errorMessage) == false) {
		%>
		<div class="error_message">
			<img alt="エラー" src="/webA/images/error_mark.png">
			<p><%= errorMessage %></p>
		</div>
		<% } %>

		<% %>

		<!-- フォーム -->
		<form name="main" method="post" action="/webA/ja/S00007/search">

			<!--条件divをまとめるdiv(contents)-->
			<div class="contents_search">

				<!-- ニックネーム -->
				<div id="jouken_nickname" class="jouken <%= nickname_is_error %>" >
					<div class="input_table <%= nickname_change %>">
						<table>
						<tr>
							<td class="label" rowspan=2>ニックネーム</td>
							<td class="value">
								<table class="radio_base">
									<tr>
									<td><input type="radio" id="id_nickname_radio1"
										name="nickname_radio" value="1" class="onOffRadio" <%= nickname_radio1%>  onclick="checkAll()">
										<span class="radio_label">指定</span></td>
									<td><input type="radio" id="id_nickname_radio2"
										name="nickname_radio" value="2" class="onOffRadio" <%= nickname_radio2%>>
										<span class="radio_label">指定なし</span>
									</td>
								</tr>
							</table>
							</td>
							</tr>
							<tr>
								<td class="value">
									<table class="radio_base">
										<tr>
											<td><input type="radio" id="id_nickname_type_radio1" name="nickname_type_radio" value="1" <%= nickname_type_radio1 %>>
											<span class="radio_label">あいまい</span></td>
											<td><input type="radio" id="id_nickname_type_radio2" <%= nickname_type_radio2 %> name="nickname_type_radio" value="2" >
											<span class="radio_label" >完全一致</span></td>
										</tr>
									</table> <input type="text" id="id_nickname" name="nickname" maxlength="255" value=<%= nickname %>>
								</td>
							</tr>
						</table>
					</div>
					</div>
					
					<!-- 登録日 -->
					<div id="jouken_joined_date" class="jouken <%= joined_date_is_error %>">
						<div class="input_table <%= joined_date_change %>">
							<table>
								<tr>
									<td class="label" rowspan=2>登録日</td>
									<td class="value">
										<table class="radio_base">
											<tr>
												<td><input type="radio" id="id_joined_date_radio1"
													name="joined_date_radio" value="1" class="onOffRadio" <%= joined_date_radio1 %>>
													<spanclass="radio_label">指定</span></td>
												<td><input type="radio" id="id_joined_date_radio2"
													name="joined_date_radio" value="2" class="onOffRadio" <%= joined_date_radio2 %>>
													<span class="radio_label">指定なし</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="value"><input type="date" id="id_joined_date_from" name="joined_date_from" value=<%= joined_date_from %>> 
										<br> ～ <br> 
										<input type="date" id="id_joined_date_to" name="joined_date_to" value=<%= joined_date_to %>></td>
								</tr>
							</table>
						</div>
						</div>

						<!-- 性別 -->
						<div class="input_table <%= gender_change %>">
							<table>
								<tr>
									<td class="label" rowspan=2>性別</td>
									<td class="value">
										<table class="radio_base">
											<tr>
												<td><input type="radio" id="id_gender_radio" name="gender_radio" value="1" class="onOffRadio" <%= gender_radio1 %>>
													<span class="radio_label">指定</span></td>
												<td><input type="radio" id="id_gender_radio" name="gender_radio" value="2" class="onOffRadio" <%= gender_radio2 %>>
												<span class="radio_label">指定なし</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="value"><select name="gender" tabindex="10">
											<option id="id_gender1" value="1" <%= gender1 %>>男</option>
											<option id="id_gender2" value="2" <%= gender2 %>>女</option>
									</select></td>
								</tr>
							</table>
						</div>

						<!-- 誕生日 -->
						<div id="jouken_birthday" class="jouken <%= birthday_is_error %>">
							<div class="input_table <%= birthday_change %>">
								<table>
									<tr>
										<td class="label" rowspan=2>誕生日</td>
										<td class="value">
											<table class="radio_base">
												<tr>
													<td><input type="radio" id="id_birthday_radio1" name="birthday_radio" value="1" class="onOffRadio" <%= birthday_radio1 %>>
														<span class="radio_label">指定</span></td>
													<td><input type="radio" id="id_birthday_radio1"
														name="birthday_radio" value="2" class="onOffRadio" <%= birthday_radio2 %>>
														<span class="radio_label">指定なし</span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="value">
											<input type="date" id="id_birthday_from" name="birthday_from" value="<%= birthday_from %>">
											<br> ～ <br> 
											<input type="date" id="id_birthday_to" name="birthday_to" value="<%= birthday_to %>">
										</td>
									</tr>
								</table>
							</div>
						</div>

						<!-- リスナー数 -->
						<div id="jouken_listener_count"	class="jouken <%= listener_count_is_error %>">
							<div class="input_table <%= listener_change %>">
								<table>
									<tr>
										<td class="label" rowspan=2>リスナー数</td>
										<td class="value">
											<table class="radio_base">
												<tr>
													<td><input type="radio" id="listener_count_radio1" name="listener_count_radio" value="1" class="onOffRadio" <%= listener_count_radio1 %>>
														<span class="radio_label">指定</span></td>
													<td><input type="radio" id="listener_count_radio2" name="listener_count_radio" value="2" class="onOffRadio" <%= listener_count_radio2 %>>
													<span class="radio_label">指定なし</span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="value"><input type="text"
											id="id_listener_count_from" name="listener_count_from" maxlength="8" value=<%= listener_count_from %>>
											<br> ～ <br>
											<input type="text" id="id_listener_count_to" name="listener_count_to" maxlength="8" value=<%= listener_count_to %>>
										</td>
									</tr>
								</table>
							</div>
						</div>

						<!-- 言語 -->
						<div id="jouken_language"
							class="jouken <%= language_type_is_error %>">
							<div class="input_table">
								<table>
									<tr>
										<td class="label">言語</td>
										<td class="value">
											<input type="checkbox" id="id_language_type_jp" name="language_type_jp" value="002" <%= language_type_jp %>>日本語<br>
											<input type="checkbox" id="id_language_type_en" name="language_type_en" value="001" <%= language_type_en %>>英語</td>
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
										<td class="value"><select id="id_sort_order"
											name="sort_order" tabindex="10">
												<option value="01" <%= sort_order01 %>>新しい順</option>
												<option value="02" <%= sort_order02 %>>古い順</option>
												<option value="03" <%= sort_order03 %>>リスナーが多い順</option>
												<option value="04" <%= sort_order04 %>>リスナーが少ない順</option>
										</select></td>
									</tr>
								</table>
							</div>
						</div>

						<!-- メインボタン -->
						<div class="main_button">
							<input type="submit" value="検索">
						</div>
		</form>
	</div>

	<input type="hidden" id="context_path" value="<%= contextPath %>">

	<!-- ページトップへjavaScript -->
	<div id="pagetop">
		<a href="#"><img alt="ページトップ" src="/webA/images/pagetop.png"></a>
	</div>

	<!-- フッター -->
	<footer>
		Copyright <a href="https://www.excd.jp/">© EXCEED Co., Ltd.</a> All Rights Reserved.
	</footer>

	</div>
</body>
</html>