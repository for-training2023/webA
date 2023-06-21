<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "java.util.*" %>
<%
String title=(String)request.getAttribute("title");
String composer_id=(String)request.getAttribute("composer_id");
String rating_total=(String)request.getAttribute("rating_total");
Double rating_average=(Double)request.getAttribute("rating_average");
String total_listen_count=(String)request.getAttribute("total_listen_count");
String release_datetime=(String)request.getAttribute("release_datetime");
String last_update_datetime=(String)request.getAttribute("last_update_datetime");
String message=(String)request.getAttribute("message");
String key=(String)request.getAttribute("key");
String score_type=(String)request.getAttribute("score_type");
String bpm=(String)request.getAttribute("bpm");
String image_file_name=(String)request.getAttribute("image_file_name");
String image_file_height=(String)request.getAttribute("image_file_height");
String image_file_width=(String)request.getAttribute("image_file_width");
String other_link_url=(String)request.getAttribute("other_link_url");
String other_link_description=(String)request.getAttribute("other_link_description");
String nickname=(String)request.getAttribute("nickname");
String unique_code=(String)request.getAttribute("unique_code");

%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="keywords" content="作曲アプリ,Meloko,楽譜,iPhone,iPad,iOS,MIDI,メロコ,作詞,作曲,コミュニティー,スマホ">
  <meta name="description" content="「メロコ」はiPhone,iPadで動作する作曲アプリです。思いついたメロディーをどんどん曲として保存していきましょう。">
  <title><%=title %></title>
  <link rel="stylesheet" href="/webA/css/main.css">
  <script src="/webA/js/jquery-3.3.0.min.js"></script>
  <script src="/webA/js/util.js"></script>
<!-- 画像の圧縮表示設定 -->
<style>
div.song_link div.cell div.song1 img {
    position: relative;
    width :275px;
    height :160px;
}
li {
	list-style: none;
} 

div.a{
	position: relative; /* 今の位置を基準 */
	left: 30px;
	top: 32px;
}

.songimage{
	width :100%;
    height :100%;
    object-fit:cover;
	}
</style>

</head>
<body>


  <!-- メニューのキャンセルレイヤの起点 -->
  <div id="layer_marker">
  </div>

  <div class="wrapper">

    <!-- タイトルバー -->
    <div class="title_bar">
      <p class="page_title"><%=title %></p>
      <a href="#" id="menu_open">
        <img alt="メニュー" src="/webA/images/menu.png" class="menu-icon">
      </a>
    </div>

    <!-- メニューの起点 -->
    <div id="menu_marker">
    </div>

    <!-- 曲名 -->
    <div class="double_rows_table">
      <table>
        <tr>
          <td class="label">曲名</td>
          <td class="value"><%=title %></td>
        </tr>
      </table>
    </div>

    <!-- 作者へのリンク -->
    <div class="label_and_link">
      <span class="label">作者：</span><span class="link"><a href="/webA/ja/S00004/<%=unique_code %>"><%=nickname %></a></span>
    </div>
    
    <!-- メッセージ -->
    <div class="single_row_table">
      <table>
        <tr>
          <td class="label">メッセージ</td>
        </tr>
        <tr>
          <td class="value"><%=message %></td>
        </tr>
      </table>
    </div>

    <!-- 曲画像リンク -->
    <div class="song_link">
      <div class="cell">
        <div class="image_base">
          <a href="meloko://?song_id=256">
            <div class="image song1">
              <img class="songimage"alt=<%=title %> src=/webA/images/<%=image_file_name %>>
              <img alt= "play" class="play" src="/webA/images/play.png">
            </div>
          </a>
        </div>
      </div>
    </div>

    <!-- 情報 -->

    <div class="single_row_table">
      <table>
        <tr>
          <td class="label">情報</td>
        </tr>
        <tr>
          <td class="value">
            <span class="label_top">総感動指数：</span>
            <span class="value"><%=rating_total %></span>
            <span class="label">平均感動指数：</span>
            <span class="value"><%=rating_average %></span>
            <span class="label">再生回数：</span>
            <span class="value"><%=total_listen_count %></span>
            <span class="label">公開：</span>
            <span class="value"><%=release_datetime %></span>
            <span class="label">最終更新日：</span>
            <span class="value"><%=last_update_datetime %></span>
            <span class="label">KEY：</span>
            <span class="value"><%=key %></span>
            <span class="label">楽譜表記：</span>
            <span class="value"><%=score_type %></span>
            <span class="label">BPM：</span>
            <span class="value"><%=bpm %></span>
          </td>
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
          <td class="value">
            <a href="https://google.co.jp"><%=other_link_description %></a>
          </td>
        </tr>
      </table>
    </div>
    
     <!-- コメントテーブルのヘッダー -->
     <div class="sub_header">
      <p>この曲についたコメント</p>
     </div>

     <!-- コメントテーブル -->
<% List<Map<String,String>> commentList = (List<Map<String,String>>)request.getAttribute("commentList");%>
<% for(int i=0; i < 100; i++){%>
<%if ( i >= commentList.size()){%>
		<% break;%><%} %>
		<% Map<String,String> map = commentList.get(i);%>


	
<%String style=null; %>	

<%if (map.get("type").equals("1")){%>
	<%style="style='padding-left:40px'"; %>
<%}else {%>
	<%style="style='padding-right:20px'"; %>
<%}%>

<%if (map.get("type").equals("1")){%>
	<div class="a"> > </div>
<%} %>

<div <%=style %>class="comments">
	  <ul>
       <li>
        <div class="normal">

<%if (map.get("commentNickname").equals(nickname)){%>
		    <div class="composer_link"style="padding-left:0px"><a href=<%=map.get("commentUniqueCode")%>><%=map.get("commentNickname") %></a></div><br>
            <p class="comment"><%=map.get("comment") %></p>
            <p class="time"><%=map.get("write_datetime") %></p>
           
	<%}else{ %>
			<div class="rating star<%=map.get("rating")%>"></div>
			<div class="composer_link"><a href=<%=map.get("commentUniqueCode")%>><%=map.get("commentNickname") %></a></div>
            <p class="comment"><%=map.get("comment") %></p>
            <p class="time"><%=map.get("write_datetime") %></p>
          
<%}%>
	
		 </div>
        </li>
       </ul>
     </div>
      
<%}%>


<!-- ページトップへjavaScript -->
    <div id="pagetop" hidden>
      <img alt="ページトップ" src="/webA/images/pagetop.png">
    </div>

    <!-- フッター -->
    <footer>
      Copyright <a href="https://www.excd.jp/">© EXCEED Co., Ltd.</a> All Rights Reserved.
    </footer>
</body>
</html>
    
    
    