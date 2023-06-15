<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="web.S00008"%>
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
	String a = (String)request.getAttribute("error");
	String s = (String)request.getAttribute("nickname_is_error");
	String b = (String)request.getAttribute("nickname_type_radio");
	String c = (String)request.getAttribute("nickname");
	String d = (String)request.getAttribute("joined_date_is_error");
	String e = (String)request.getAttribute("joined_date_radio");
	String f = (String)request.getAttribute("joined_date_from");
	String g = (String)request.getAttribute("joined_date_to");
	String h = (String)request.getAttribute("birthday_is_error");
	String i = (String)request.getAttribute("birthday_radio");
	String k = (String)request.getAttribute("birthday_from");
	String l = (String)request.getAttribute("birthday_to");
	String m = (String)request.getAttribute("listener_count_is_error");
	String n = (String)request.getAttribute("listener_count_from");
	String o = (String)request.getAttribute("listener_count_to");
	String p = (String)request.getAttribute("language_type_is_error");
	String q = (String)request.getAttribute("language_type_jp");
	String r = (String)request.getAttribute("language_type_en");


	// (1) 「エラー情報(error)」が設定されている場合は、画面に「エラー情報(error)」を表示する。
	String errorMessage = (String)request.getAttribute("error");
    if (errorMessage == null) errorMessage = "";
    

	// (2) 「ニックネーム_エラー状態(nickname_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String nickname_is_error = "";
	if ("1".equals(request.getAttribute("nickname_is_error"))) {
		nickname_is_error = ", error";
	}

	// (3) 以下の項目を元にニックネームの入力状態を再現する。
	System.out.println(request.getAttribute("nickname_radio"));
	
	String nickname_radio1 = "";
	String nickname_radio2 = "";
	if("1".equals((String)request.getAttribute("nickname_radio"))) {
		nickname_radio1 = "checked=\"checked\"";
	} else if ("2".equals(request.getAttribute("nickname_radio"))) {
		nickname_radio2 = "checked=\"checked\"";
	}
	
		String nickname_type_radio1 = "";
		String nickname_type_radio2 = "";
	if ("1".equals(request.getAttribute("nickname_type_radio"))) {
		nickname_type_radio1 = "checked=\"checked\"";
	} else if ("2".equals(request.getAttribute("nickname_type_radio"))) {
		nickname_type_radio2 = "checked=\"checked\"";
	}
	
		String nickname = (String)request.getAttribute("nickname");
	if (nickname == null){
		nickname = "";
	}
	
	
	// (4) 「登録日_エラー状態(joined_date_is_error)」= "1"の場合
	String joined_date_is_error = "";
	if ("1".equals(request.getAttribute("joined_date_is_error"))) {
		joined_date_is_error = ", error";
	}

	// (5) 以下の項目を元に登録日の入力状態を再現する。
	
	String joined_date_radio1 = "";
    if ("1".equals(request.getAttribute("joined_date_radio"))) {
    	joined_date_radio1 = "checked=\"checked\"";
    }
    
	String joined_date_radio2 = "";
	if ("2".equals(request.getAttribute("joined_date_radio"))) {
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

	// (6) 以下の項目を元に性別の入力状態を再現する。
	String gender_radio1 = "";
	if ("1".equals(request.getAttribute("gender_radio"))) {
		gender_radio1= "selected=\"selected\"";
	}
	
	String gender_radio2 = "";
	if ("2".equals(request.getAttribute("gender_radio"))) {
		gender_radio2 = "selected=\"selected\"";
	}
	
	// (7) 「誕生日_エラー状態(birthday_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String birthday_is_error = "";
	if ("1".equals(request.getAttribute("birthday_is_error"))) {
		birthday_is_error = ", error";
	}

	// (8) 以下の項目を元に誕生日の入力状態を再現する。
	String birthday_radio1 = "";
	if ("1".equals(request.getAttribute("birthday_radio"))) {
		birthday_radio1 = "checked=\"checked\"";
	}
	
	String birthday_radio2 = "";
	if ("2".equals(request.getAttribute("birthday_radio"))) {
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

	// (9) 「リスナー数_エラー状態(listener_count_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String listener_count_is_error = "";
	if ("1".equals(request.getAttribute("listener_count_is_error"))) {
		listener_count_is_error = ", error";
	}
	
	// (10) 以下の項目を元にリスナー数の入力状態を再現する。
	String listener_count_radio1= "";
	if ("1".equals(request.getAttribute("listener_count_radio"))) {
		listener_count_radio1= "checked=\"checked\"";
	}
	
	String listener_count_radio2 = "";
	if ("2".equals(request.getAttribute("listener_count_radio"))) {
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

	// (11) 「言語区分_エラー状態(language_type_is_error)」= "1"の場合、divタグのクラス属性に errorを加える。
	String language_type_is_error = "";
	if ("1".equals(request.getAttribute("language_type_is_error"))) {
		language_type_is_error = ", error";
	}
	
	// (12) 以下の項目を元に言語区分の入力状態を再現する。
	String language_type_jp1 = "";
	if ("1".equals(request.getAttribute("language_type_jp"))) {
		language_type_jp1 = "checked=\"checked\"";
	}
	
	String language_type_en1 = "";
	if ("1".equals(request.getAttribute("language_type_en"))) {
		language_type_en1 = "checked=\"checked\"";
	}

%>

<head>

<link rel="stylesheet" href="/web/css/main.css">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords"
	content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ">
<meta name="description"
	content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。">
<title>作曲家検索</title>

<script src="../js/jquery-3.3.0.min.js"></script>
<script src="../js/util.js"></script>
<script src="../js/input.js"></script>

</head>
<body>
	<!-- メニューのキャンセルレイヤの起点 -->
	<div id="layer_marker"></div>

	<div class="wrapper">

		<!-- タイトルバー -->
		<div class="title_bar">
			<p class="page_title">作曲家検索結果</p>
			<a href="#" id="menu_open"> <img alt="メニュー"
				src="/web/images/menu.png" class="menu-icon">
			</a>
		</div>

		<!-- メニューの起点 -->
		<div id="menu_marker"></div>

		<!-- エラーメッセージ -->
		<%
			if ("".equals(errorMessage) == false) {
		%>
		<div class="error_message">
			<img alt="エラー" src="/web/images/error_mark.png">
			<p><%= errorMessage %></p>
		</div>
		<% } %>

		<% %>

		<!-- フォーム -->
		<form name="main" method="post" action="/web/ja/S00007/search">

			<!--条件divをまとめるdiv(contents)-->
			<div class="contents_search">

				<!-- ニックネーム -->
				<div id="jouken_nickname" class="jouken <%= nickname_is_error %>">
					<div class="input_table">
						<table>
						<tr>
							<td class="label" rowspan=2>ニックネーム</td>
							<td class="value">
								<table class="radio_base">
									<tr>
									<td><input type="radio" id="id_nickname_radio1"
										name="nickname_radio" value="1" class="onOffRadio <%= nickname_radio1%>"><span
										class="radio_label">指定</span></td>
									<td><input type="radio" id="id_nickname_radio2"
										name="nickname_radio" value="2" class="onOffRadio"
										checked="checked"><span class="radio_label">指定なし</span>
									</td>
								</tr>
							</table>
							</td>
							</tr>
							<tr>
								<td class="value">
									<table class="radio_base">
										<tr>
											<td><input type="radio" id="id_nickname_type_radio1"
												name="nickname_type_radio" value="1"><span
												class="radio_label">あいまい</span></td>
											<td><input type="radio" id="id_nickname_type_radio2"
												name="nickname_type_radio" value="2" checked="checked"><span
												class="radio_label">完全一致</span></td>
										</tr>
									</table> <input type="text" id="id_nickname" name="nickname" value=<%= nickname %>>
								</td>
							</tr>
						</table>
					</div>

					<!-- 登録日 -->
					<div id="jouken_joined_date"
						class="jouken <%= joined_date_is_error %>">
						<div class="input_table">
							<table>
								<tr>
									<td class="label" rowspan=2>登録日</td>
									<td class="value">
										<table class="radio_base">
											<tr>
												<td><input type="radio" id="id_joined_date_radio1"
													name="joined_date_radio" value="1" class="onOffRadio"><span
													class="radio_label">指定</span></td>
												<td><input type="radio" id="id_joined_date_radio2"
													name="joined_date_radio" value="2" class="onOffRadio"
													checked="checked"><span class="radio_label">指定なし</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="value"><input type="date" id="id_joined_date_from" name="joined_date_from" value="joined_date_from"> <%= joined_date_from %>
										<br> ～ <br> 
										<input type="date" id="id_joined_date_to" name="joined_date_to" value="joined_date_to"><%= joined_date_to %></td>
								</tr>
							</table>
						</div>

						<!-- 性別 -->
						<div class="input_table">
							<table>
								<tr>
									<td class="label" rowspan=2>性別</td>
									<td class="value">
										<table class="radio_base">
											<tr>
												<td><input type="radio" id="id_gender_radio"
													name="gender_radio" value="1" class="onOffRadio" ><span
													class="radio_label">指定</span></td>
												<td><input type="radio" id="id_gender_radio"
													name="gender_radio" value="2" class="onOffRadio"
													checked="checked"><span class="radio_label">指定なし</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="value"><select name="gender" tabindex="10">
											<option id="id_gender1" value="1" selected="selected">男</option>
											<option id="id_gender2" value="2">女</option>
									</select></td>
								</tr>
							</table>
						</div>

						<!-- 誕生日 -->
						<div id="jouken_birthday" class="jouken <%= birthday_is_error %>">
							<div class="input_table">
								<table>
									<tr>
										<td class="label" rowspan=2>誕生日</td>
										<td class="value">
											<table class="radio_base">
												<tr>
													<td><input type="radio" id="id_birthday_radio1"
														name="birthday_radio" value="1" class="onOffRadio"><span
														class="radio_label">指定</span></td>
													<td><input type="radio" id="id_birthday_radio1"
														name="birthday_radio" value="2" class="onOffRadio"
														checked="checked"><span class="radio_label">指定なし</span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="value"><input type="date"
											id="id_birthday_from" name="birthday_from" value="<%= birthday_from %>">
											<br> ～ <br> <input type="date" id="id_birthday_to"
											name="birthday_to" value="<%= birthday_to %>"></td>
									</tr>
								</table>
							</div>
						</div>

						<!-- リスナー数 -->
						<div id="jouken_listener_count"
							class="jouken <%= listener_count_is_error %>">
							<div class="input_table">
								<table>
									<tr>
										<td class="label" rowspan=2>リスナー数</td>
										<td class="value">
											<table class="radio_base">
												<tr>
													<td><input type="radio" id="listener_count_radio1"
														name="listener_count_radio" value="1" class="onOffRadio"><span
														class="radio_label">指定</span></td>
													<td><input type="radio" id="listener_count_radio2"
														name="listener_count_radio" value="2" class="onOffRadio"
														checked="checked"><span class="radio_label">指定なし</span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="value"><input type="text"
											id="id_listener_count_from" name="listener_count_from"
											value="<%= listener_count_from %>"> <br> ～ <br> <input type="text"
											id="id_listener_count_to" name="listener_count_to" value="<%= listener_count_to %>">
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
										<td class="value"><input type="checkbox"
											id="id_language_type_jp" name="language_type_jp" value="002">日本語<br>
											<input type="checkbox" id="id_language_type_en"
											name="language_type_en" value="001">英語</td>
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
												<option value="01" selected="selected">新しい順</option>
												<option value="02">古い順</option>
												<option value="03">リスナーが多い順</option>
												<option value="04">リスナーが少ない順</option>
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

	<!-- ページトップへjavaScript -->
	<div id="pagetop">
		<a href="#"><img alt="ページトップ" src="/web/images/pagetop.png"></a>
	</div>

	<!-- フッター -->
	<footer>
		Copyright <a href="https://www.excd.jp/">© EXCEED Co., Ltd.</a> All
		Rights Reserved.
	</footer>

	</div>
</body>
</html>