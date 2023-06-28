<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jp.excd.bean.SongComposerBean" %>
<%@ page import="jp.excd.servlet.S00001" %>
<%@ page import="jp.excd.common.TopCategory" %>
<%@ page import="jp.excd.common.Util" %>

<%-- URLクエリ文字列(category, from)に関する仕様 --%>
<%-- from指定なしの場合は、一件目から表示する --%>
<%-- category指定なしの場合は「新着」にする。 --%>
<%-- カテゴリータブがタッチされると同時に、その箇所の色も変える --%>
<% 
	String category = (String)request.getAttribute("category");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>音楽室</title>
	<link rel="stylesheet" href='<%= Util.addContextPath(request, "/css/main.css") %>'>
	<script src='<%= Util.addContextPath(request, "/js/jquery-3.3.0.min.js") %>'></script>
	<script type="text/javascript" src='<%= Util.addContextPath(request, "/js/util.js") %>'></script>
	<meta name="keywords" content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ" />
	<meta name="description" content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
</head>
	<body>
		<!-- メニューのキャンセルレイヤの起点 -->
		<div id="layer_marker">
		</div>
	
		<!--全体のラッパー-->
		<div class="wrapper">
		 
			<!-- トップバナー -->
			<div class="top_banner">
				<a href="https://itunes.apple.com/jp/app/id1440134774?mt=8">
					<img alt="メロコ～iPhone用作曲アプリアイコン" src="<%= Util.imageFilePathFormat("melokoIcon.png") %>" class="icon" />
					<% String appMessage = (String)request.getAttribute("appMessage"); %>
					<p><%= appMessage %></p>
					<img alt="メロコ～専用アプリダウンロード画面へのリンク" src="<%= Util.imageFilePathFormat("right_blue_arrow.png") %>" class="to_download_page_arrow" />
				</a>
			</div>
			
			<!-- タイトルバー -->
			<div class="title_bar">
				<p class="main_title" >音楽室</p>
				<p class="sub_title">～作曲家たちのコミュニティー～</p>
				<a href="#" id="menu_open">
					<img alt="メニュー" src="<%= Util.imageFilePathFormat("menu.png") %>" class="menu-icon" />
				</a>
			</div>
	
			<!-- メニューの起点 -->
			<div id="menu_marker">
				<input type="hidden" id="context_path" value="<%= contextPath %>">
			</div>
	
			<!-- トップタブ -->
			<div class="top_tab">
				<ul>
					<% for(TopCategory cat: TopCategory.values()){ %>
						<li class="<%= "tab" + cat.getCode()%> <%= cat.getCode().equals(category) == true ? "selected" : "" %>">
						<% if(cat.getCode().equals(category) == true){ %>
							<div name="category" value="<%= cat.getCode() %>"><%= cat.getCategoryName(cat.getCode()) %></div>						
						<% }else{ %>
							<a href="<%= Util.addContextPath(request, "/ja/S00001?category=" + cat.getCode()) %>">
								<div name="category" value="<%= cat.getCode() %>"><%= cat.getCategoryName(cat.getCode()) %></div>
							</a>
						<% } %>
						</li>
					<% } %>
				</ul>
			</div>
	
			<!-- トップ告知(内容が無い時にはこの領域自体を非表示にする) -->
			<% String noticeMessage = (String)request.getAttribute("noticeMessage"); %>
			<% if (noticeMessage != null && noticeMessage != "") { %>
				<div class="top_notice">
					<p class="top_notice_title">告知</p>
					<p class="top_notice_body"><%= noticeMessage %></p>
				</div>
			<% } %>
			
			<!-- ソングテーブル -->
			<% List<SongComposerBean> list = (List<SongComposerBean>)request.getAttribute("displayList"); %>
			<div class="song_list">
				<ul>
			
				<%for(SongComposerBean record:list){ %>
					<li>
						<div class="cell">
							<div class="song_title">
								<%= record.getTitle() %>
							</div>
							<div class="composer">
								<span class="label_top">
							
							作曲：</span>
								<span class="composer_link">
								<a href="<%= Util.addContextPath(request, "/ja/S00004/" + record.getUniqueCode()) %>">
								<%= record.getNickname() %> 
								</a></span>
							</div>
							<div class="image_base">
								<a href="<%= Util.addContextPath(request, "/ja/S00003/" + record.getSongId()) %>">
									<div class="image song1">
								<%if(record.getImageFileNameFormated() == null || "".equals(record.getImageFileNameFormated())){ %>
									<img alt="<%= record.getTitle() %>" src="<%= Util.imageFilePathFormat("noimage.png") %>" 
									width="<%= String.valueOf(Util.IMAGE_FILE_WIDTH) %>" height="<%= String.valueOf(Util.IMAGE_FILE_MAX_HEIGHT) %>" >
								<%
								} else {
									if(record.getImageFileHeightCutLength() != 0){	
								%>
										<img alt="<%= record.getTitle() %>" src="<%= record.getImageFileNameFormated() %>" 
										style = "width : <%=record.getImageFileWidthFormated()%>px !important;
												height : <%=record.getImageFileHeightFortmated()%>px !important;
												position:relative !important;
												top: <%= (-1) * record.getImageFileHeightCutLength() %>px !important;">
										<%
									}else{
										%>
										<img alt="<%= record.getTitle() %>" src="<%= record.getImageFileNameFormated() %>" 
										style = "height : <%=record.getImageFileHeightFortmated()%>px !important;
												position:relative ! important;">
										<%
									} 
								}
										%>
										
										<img alt= "play" class="play" src="<%= Util.imageFilePathFormat("play.png") %>" />
									</div>
								</a>
							</div>
							<div class="detail">
								<span class="label_top">総感動指数：</span>
								<span class="value"><%= record.getRatingTotalFormated() %></span>
								<span class="label">平均感動指数：</span>
								<span class="value"><%= record.getRatingAverageFormated() %></span>
								<span class="label">再生回数：</span>
								<span class="value"><%= record.getTotalListenCountFormated() %></span>
								<span class="label">公開：</span>
								<span class="value"><%= record.getReleaseDatetimeFormated() %></span>
							</div>
						</div>
					</li>
					<%} %>
				</ul>
			</div>
	
			<!-- メインボタン(さらに読み込むボタン) -->
			<%
				int nextFrom = (int)request.getAttribute("nextFrom");
			%>
	
			<% int hit = (int)request.getAttribute("hits"); %>
			<% if(hit > nextFrom){ %> 
			<div class="main_button">
				<a href="<%= Util.addContextPath(request, "/ja/S00001?category=" + category + "&from=" + nextFrom) %>">さらに読み込む</a>
			</div>
			<% } %>
		
			<!-- ページトップへjavaScript -->
			<div id="pagetop">
				<img alt="ページトップ" src="<%= Util.imageFilePathFormat("pagetop.png") %>">
			</div>
		
			<!-- フッター -->
			<footer>
				<small>Copyright <a href="https://www.excd.jp/" target="_blank">&copy; EXCEED Co., Ltd.</a> All Rights Reserved.</small>
			</footer>
		</div>
	</body>
</html>