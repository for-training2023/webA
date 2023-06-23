package jp.excd.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.excd.common.C0002;

public class S00003 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostName = "192.168.1.67";//ホスト名
        String connectUserName = "meloko";// ユーザ
        String connectPassword = "exceed";// パスワード
        String dbName = "meloko";// DB名
        String timeZone = "Asia/Tokyo";// timeZone
        final String URL = "jdbc:mysql://"// コネクション用のSQL
                + hostName
                + ":3306/"
                + dbName
                + "?serverTimezone="
                + timeZone
                + "&allowPublicKeyRetrieval=true"
                + "&useSSL=false";
        
        
        Connection con = null; // コネクション
        
		try {
			// (1)DB接続（コネクションの確立）
			 con = DriverManager.getConnection(URL, connectUserName, connectPassword);
			 
			// (2)内部メソッド呼び出し
				this.mainProcessForSearch(request, response, con);

			} catch (Exception e) {
				e.printStackTrace();
				getServletConfig().getServletContext().getRequestDispatcher("/jsp/500.jsp").forward(request, response);

			} finally {
				
				try {
					if (con != null) {

			// (3)接続したコネクションの切断を行う。
						con.close();
						 getServletConfig().getServletContext().getRequestDispatcher("/ja/S00003.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					e.printStackTrace();
					getServletConfig().getServletContext().getRequestDispatcher("/jsp/500.jsp").forward(request, response);
				}

			}
		}
		
		
	public void mainProcessForSearch(HttpServletRequest request, HttpServletResponse response, Connection con)
			throws IOException, Exception {
		
		// 接続URL受け取り
		String url = request.getRequestURI();  //URL取得
        int index = url.indexOf("/webA/ja/S00003/");  //""内の文字数取得
        String arigato = url.substring(index+16);  //文字数分「url」から除き、それを変数に代入
        for( int i = 0 ; i < arigato.length();i++) {  //「"/webA/ja/S00003/」以降が文字列の場合は404に遷移
        	if(Character.isDigit(arigato.charAt(i))) {
        	    continue;//数字の場合は次の文字の判定へ
        	}else {
    			getServletConfig().getServletContext().
    			getRequestDispatcher("/jsp/404.jsp").
    			forward( request, response );
        	}
        }
		
        int wow = Integer.parseInt(arigato);  //曲IDをint型に変換
        
		String title=null;
		String composer_id=null;
		int rating_total;
		rating_total=0;
		Double rating_average=null;
		int total_listen_count;
		total_listen_count=0;
		Double release_datetime=null;
		Double last_update_datetime=null;
		String message=null;
		String key=null;
		String score_type=null;
		String score_type2=("1オクターブ上(男性ボーカル)");
		String score_type3=null;
		String bpm=null;
		String image_file_name=null;
		String image_file_height=null;
		String image_file_width=null;
		String other_link_url=null;
		String other_link_description=null;
		String nickname=null;
		String unique_code=null;
		
		String commentID=null;
		String comment=null;
		Double write_datetime=null;
		String commentNickname=null;
		String commentUniqueCode=null;
		String sequence=null;
		String type=null;
		Double rating=null;
		
		String s2 =null; 
        String s3 =null;
        String rate=null;
		
		/**
		 * SQL文を生成して、DBよりデータを取得する
		 * @return DB取得データ
		 */
		
			// SQLの断片を用意する。
			String sql = "SELECT "
					+ "song.ID"
					+ ", song.title"
					+ ", song.composer_id"
					+ ", song.rating_total"
					+ ", song.rating_average"
					+ ", song.total_listen_count"
					+ ", song.release_datetime"
					+ ", song.last_update_datetime"
					+ ", song.message"
					+ ", song.`key`"
					+ ", song.score_type"
					+ ", song.bpm"
					+ ", song.image_file_name"
					+ ", song.image_file_height"
					+ ", song.image_file_width"
					+ ", song.other_link_url"
					+ ", song.other_link_description"
					+ ", composer.ID"
					+ ", composer.nickname"
					+ ", composer.unique_code"
					+ " FROM song"
					+ " left join composer"
					+ " on song.composer_id=composer.ID"
					+ " where song.ID=?;";
			
			// SQLの断片(コメント欄)を用意する。
			String sql2 ="select * from comment "
        			+ "left outer join "
        			+ "composer "
        			+ "on comment.composer_id = composer.id "
        			+ "left outer join "
        			+ "rating "
        			+ "on rating.composer_id = comment.composer_id "
        			+ "where comment.song_id = ? "
        			+ "order by sequence asc;";
		
		// プリペアドステートメント
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		//PreparedStatementのインスタンスを得る。
		pstmt = con.prepareStatement(sql);
		pstmt2 = con.prepareStatement(sql2);
		
		pstmt.setInt(1,wow);
    	pstmt2.setInt(1,wow);

		// 実行
		rs = pstmt.executeQuery();
		rs2 = pstmt2.executeQuery();
		
			
		while (rs.next()) {
			title = rs.getString("title");
			composer_id = rs.getString("composer_id");
			rating_total = rs.getInt("rating_total");
			rating_average = rs.getDouble("rating_average");
			total_listen_count = rs.getInt("total_listen_count");
			release_datetime = rs.getDouble("release_datetime");
			last_update_datetime = rs.getDouble("last_update_datetime");
			message = rs.getString("message");
			key= rs.getString("key");
			score_type = rs.getString("score_type");
			bpm = rs.getString("bpm");
			image_file_name = rs.getString("image_file_name");
			image_file_height = rs.getString("image_file_height");
			image_file_width = rs.getString("image_file_width");
			other_link_url = rs.getString("other_link_url");
			other_link_description = rs.getString("other_link_description");
			nickname = rs.getString("nickname");
			unique_code = rs.getString("unique_code");
			
			s2 =getDatetime(release_datetime); 
	        s3 =getDatetime(last_update_datetime); 
	              
		}
		
		
		
		List<Map<String,String>> commentList = new ArrayList<>();  //一人ひとりのコメントを格納するリストを定義
		while (rs2.next()) {
			commentID = rs2.getString("ID");
			comment = rs2.getString("comment");
			write_datetime = rs2.getDouble("write_datetime");
			commentNickname = rs2.getString("composer.nickname");
			commentUniqueCode = rs2.getString("composer.unique_code");
			sequence = rs2.getString("sequence");
			type = rs2.getString("type");
			rating = rs2.getDouble("rating");
			
			rate =getTenTimes(rating); 

		 
		Map<String,String> map = new HashMap<String,String>();  //コメント内の各パラメータを格納するマップを定義
         String s1 =getDatetime(write_datetime);  //投稿時間（エポック秒）を「～日前」の形に変更し、変数「s」に格納
         
	         map.put("commentID",commentID);	         
	         map.put("comment",comment);
			 map.put("write_datetime",s1);
			 map.put("commentNickname",commentNickname);
			 map.put("commentUniqueCode",commentUniqueCode);
			 map.put("sequence",sequence);
			 map.put("type",type);
			 map.put("rating",rate);
			 
			 commentList.add(map);  //コメントリストにマップを格納
			 
		}
		
		if (score_type.equals("1")){
			score_type3=score_type2;
		}
		
		rating_average = rating_average * 10;  //平均感動指数の小数点第２位を四捨五入
		double afterratingAverage = Math.round(rating_average);			
		rating_average = afterratingAverage/10;
		
		NumberFormat comFormat = NumberFormat.getNumberInstance(); //カンマ区切り
		request.setAttribute("title",title);
		request.setAttribute("composer_id",composer_id);
		request.setAttribute("rating_total",comFormat.format(rating_total));
		request.setAttribute("rating_average",rating_average);
		request.setAttribute("total_listen_count",comFormat.format(total_listen_count));
		request.setAttribute("release_datetime",s2);
		request.setAttribute("last_update_datetime",s3);
		request.setAttribute("message",message);
		request.setAttribute("key",C0002.getName(key));
		request.setAttribute("score_type",score_type3);
		request.setAttribute("bpm",bpm);
		request.setAttribute("image_file_name",image_file_name);
		request.setAttribute("image_file_height",image_file_height);
		request.setAttribute("image_file_width",image_file_width);
		request.setAttribute("other_link_url",other_link_url);
		request.setAttribute("other_link_description",other_link_description);
		request.setAttribute("nickname",nickname);
		request.setAttribute("unique_code",unique_code);
		
		request.setAttribute("commentList",commentList);
		
	}
	
	
private String getDatetime(double datetime) {
	//「～前」
	String resultVal;
	double d_releaseDay = 0;
	//現在のエポック秒を取得
	Date date = new Date();
	Double nowEpoch = (double) date.getTime();
	//差分を算出
	Double diff = nowEpoch - datetime * 1000;
	//小数点以下を切り捨てる処理
	NumberFormat numberFormat = NumberFormat.getInstance();
	numberFormat.setMaximumFractionDigits(0);
	//公開時間を取得
	//1秒未満
	if (diff < 1000) {
		resultVal = "たった今";
	}
	//1秒以上かつ2秒未満
	else if (diff < 2000) {
		resultVal = "1秒前";
	}
	//2秒以上かつ60秒未満
	else if (diff < 60000) {
		d_releaseDay = (diff / 1000);
		resultVal = numberFormat.format(d_releaseDay) + "秒前";
	}
	//1分以上かつ2分未満
	else if (diff < 120000) {
		resultVal = "1分前";
	}
	//2分以上かつ60分未満
	else if (diff < 3600000) {
		d_releaseDay = (diff / 60000);
		resultVal = numberFormat.format(d_releaseDay) + "分前";
	}
	//1時間以上かつ2時間未満
	else if (diff < 7200000) {
		resultVal = "1時間前";
	}
	//2時間以上かつ24時間未満
	else if (diff < 86400000) {
		d_releaseDay = (diff / 3600000);
		resultVal = numberFormat.format(d_releaseDay) + "時間前";
	}
	//1日以上かつ2日未満
	else if (diff < 172800000) {
		resultVal = "1日前";
	}
	//2日以上かつ7日未満
	else if (diff < 604800000) {
		d_releaseDay = (diff / 86400000);
		resultVal = numberFormat.format(d_releaseDay) + "日前";
	}
	//7日以上かつ14日未満
	else if (diff < 1209600000) {
		resultVal = "1週間前";
	}
	//14日以上かつ30日未満
	else if (diff < 2592000000L) {
		d_releaseDay = (diff / 604800000);
		resultVal = numberFormat.format(d_releaseDay) + "週間前";
	}
	//30日以上かつ60日未満
	else if (diff < 5184000000L) {
		resultVal = "1ヶ月前";
	}
	//60日以上かつ365日未満
	else if (diff < 31536000000L) {
		d_releaseDay = (diff / 2592000000L);
		resultVal = numberFormat.format(d_releaseDay) + "ヶ月前";
	}
	//1年以上かつ2年未満
	else if (diff < 63072000000L) {
		resultVal = "1年前";
	}
	//2年以上
	else {
		d_releaseDay = (diff / 31536000000L);
		resultVal = numberFormat.format(d_releaseDay) + "年前";
	}
	return resultVal;
}


private String getTenTimes(double num) {
	double ten = num * 10;
	String result = String.valueOf(ten);
	result = result.substring(0, 2);
	return result;
	
	}
}

