package jp.excd.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.excd.bean.ComposerRecordY;
import jp.excd.common.C0005;

public class S00004 extends HttpServlet {

	public void doGet(
			HttpServletRequest request,
			HttpServletResponse response)
					throws IOException, ServletException {

		Connection con = null;
		request.setCharacterEncoding("UTF-8");

		String dbName = "meloko";
		String userName = "meloko";
		String password = "exceed";
		String timeZone = "Asia/Tokyo";

		try {
			// (1)DB接続（コネクションの確立）
			con = MySQLSetting.getConnection(dbName, userName, password, timeZone);

			// (2)内部メソッド呼び出し
			this.mainProcessForComposer(request, response, con);

		} catch (Exception e) {
			getServletConfig().getServletContext().getRequestDispatcher("/jsp/500.jsp").forward(request, response);
			e.printStackTrace();

		} finally {
			try {
				if (con != null) {

					// (3)接続したコネクションの切断を行う。
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}  
	}


	private void mainProcessForComposer(HttpServletRequest request, HttpServletResponse response, Connection con)
			throws IOException, Exception {

		

			// POSTパラメタの文字コードを指定
			request.setCharacterEncoding("UTF-8");

			// 接続URL受け取り
			String URL = request.getRequestURI();

			String decodeResult = URLDecoder.decode(URL,"UTF-8");

			String unique_str = decodeResult.substring(16);

			// 接続URLが「/ja/S00004/*」の場合は以下の処理をする。
			if (URL.matches("(/webA/ja/S00004/).+")) {


				//セレクト文でカラムを指定
				String sql = "select composer.unique_code, composer.nickname, composer.message, composer.gender, composer.birthday, composer.fb_link, composer.tw_link, composer.joined_date, composer.other_link_url, composer.other_link_description, song.ID, song.title, song.image_file_name, song.rating_total, song.rating_average, song.total_listen_count, song.release_datetime from composer left join song on composer.ID = song.composer_id where composer.unique_code = ? order by release_datetime desc;";
				String sql_count = "select count(unique_code) from composer left join song on composer.ID = song.composer_id where composer.unique_code = ? ;";
				String sql_ratingsum = "select sum(rating_total) from composer left join song on composer.ID = song.composer_id where composer.unique_code = ? ;";
				String sql_ratingavg = "select avg(rating_average) from composer left join song on composer.ID = song.composer_id where composer.unique_code = ? ;";
				String sql_listensum = "select sum(total_listen_count) from composer left join song on composer.ID = song.composer_id where composer.unique_code = ? ;";


				// プリペアドステートメント
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				PreparedStatement pstmt3 = null;
				PreparedStatement pstmt4 = null;
				PreparedStatement pstmt5 = null;


				// ResultSet
				ResultSet rs = null;
				ResultSet rs2 = null;
				ResultSet rs3 = null;
				ResultSet rs4 = null;
				ResultSet rs5 = null;


				// SQL解析
				pstmt = con.prepareStatement(sql);
				pstmt2 = con.prepareStatement(sql_count);
				pstmt3 = con.prepareStatement(sql_ratingsum);
				pstmt4 = con.prepareStatement(sql_ratingavg);
				pstmt5 = con.prepareStatement(sql_listensum);


				//SQLの?にユニークコードを挿入
				pstmt.setString(1, unique_str);
				pstmt2.setString(1, unique_str);
				pstmt3.setString(1, unique_str);
				pstmt4.setString(1, unique_str);
				pstmt5.setString(1, unique_str);


				// 実行
				rs = pstmt.executeQuery();
				rs2 = pstmt2.executeQuery();
				rs3 = pstmt3.executeQuery();
				rs4 = pstmt4.executeQuery();
				rs5 = pstmt5.executeQuery();


				List<ComposerRecordY> composerList = new ArrayList<ComposerRecordY>();


				//実行結果受け取り
				while(rs.next()) {
					ComposerRecordY cr = new ComposerRecordY();

					//ユニークコード
					String unique_code = rs.getString("unique_code");
					cr.setUnique_code(unique_code);

					//ニックネーム
					String nickname = rs.getString("nickname");
					cr.setNickname(nickname);

					//メッセージ
					String message = rs.getString("message");
					cr.setMessage(message);

					//性別
					String gender = rs.getString("gender");
					gender = C0005.getExchangeGender(gender);
					cr.setGender(gender);

					//誕生日
					String birthday = rs.getString("birthday");
					if(birthday != null) {
						birthday = ExchangeBirthday(birthday);
					}
					cr.setBirthday(birthday);

					//Facebookリンク
					String fb_link = rs.getString("fb_link");
					cr.setFb_link(fb_link);

					//Twitterリンク
					String tw_link = rs.getString("tw_link");
					cr.setTw_link(tw_link);

					//登録日
					String joined_date = rs.getString("joined_date");
					joined_date = ExchangeJoined_date(joined_date);
					cr.setJoined_date(joined_date);

					//曲ID
					int ID = rs.getInt("ID");
					cr.setID(ID);

					//曲名
					String title = rs.getString("title");
					cr.setTitle(title);

					//イメージファイル名
					String image_file_name = rs.getString("image_file_name");
					if(image_file_name == null) {
						image_file_name = "noimage.png";
					}
					cr.setImage_file_name(image_file_name);

					//総感動指数
					long rating_total = rs.getLong("rating_total");
					String rating_total_str = commaSeparatedString(rating_total);
					cr.setRating_total(rating_total_str);

					//平均感動指数
					double rating_average = rs.getDouble("rating_average");
					rating_average = RoundHalfUp(rating_average);
					cr.setRating_average(rating_average);

					//関連リンクURL
					String other_link_url = rs.getString("other_link_url");
					cr.setOther_link_url(other_link_url);

					//関連リンク文字列
					String other_link_description = rs.getString("other_link_description");
					cr.setOther_link_description(other_link_description);

					//再生回数
					long total_listen_count = rs.getLong("total_listen_count");
					String total_listen_count_str = commaSeparatedString(total_listen_count);
					cr.setTotal_listen_count(total_listen_count_str);

					//公開日時
					double release_datetime = rs.getDouble("release_datetime");

					String release_datetime_str = getLastUploadTime(release_datetime);
					cr.setRelease_datetime(release_datetime_str);

					composerList.add(cr);


				}
				
				//URLからデータを取得できなかった場合
				if( composerList.size() == 0) {
					//404.jspにフォワーディング
					getServletConfig().getServletContext().getRequestDispatcher("/jsp/404.jsp").forward(request, response);
				}


				request.setAttribute("composerList", composerList);	


				//レコードの該当件数
				int count = 0;

				while(rs2.next()) {
					count = rs2.getInt("count(unique_code)");

				}
				request.setAttribute("count", count);	

				//総感動指数の合計
				long sum1 = 0;
				String sum_str1 = null;

				while(rs3.next()) {
					sum1 = rs3.getLong("sum(rating_total)");
					sum_str1 = commaSeparatedString(sum1);
				}
				request.setAttribute("sum_str1", sum_str1);	


				//平均感動指数の平均
				double avg = 0;

				while(rs4.next()) {
					avg = rs4.getDouble("avg(rating_average)");
					avg = RoundHalfUp(avg);
				}
				request.setAttribute("avg", avg);	


				//総再生回数	
				long sum2 = 0;
				String sum_str2 = null;

				while(rs5.next()) {
					sum2 = rs5.getLong("sum(total_listen_count)");
					sum_str2 = commaSeparatedString(sum2);
				}
				request.setAttribute("sum_str2", sum_str2);	


				//S00004.jspにフォワーディング
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00004.jsp" ).forward( request, response );

			} 

		

	}



	//公開日時の表示ラベル取得
	private String getLastUploadTime(Double release_datetime) {

		String resultVal;
		double d_releaseDay = 0;

		//現在のエポック秒を取得
//		Date date = new Date(0);
//		Double nowEpoch = (double) date.getTime();

		//差分を算出
//		Double diff = (nowEpoch - release_datetime) * 1000;
		
		//テスト用コード
		Double diff = (1687486541 - release_datetime) * 1000;


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
			d_releaseDay = diff/1000;
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

	//カンマの挿入
	private static String commaSeparatedString(long i) {
		return String.format("%,d", i);
	}

	//少数点第二位の四捨五入
	private static double RoundHalfUp(double i) {
		i = i *10;
		i = Math.round(i);
		i = i/10;
		return i;
	}

	//8桁の数字列に"/"を挿入
	private static String ExchangeBirthday(String birthday) {
		StringBuilder sb = new StringBuilder();
		sb.append(birthday.substring(0,4) + "/");
		sb.append(birthday.substring(4,6) + "/");
		sb.append(birthday.substring(6,8));
		return sb.toString();
	}

	//8桁の数字列に"年,月,日"を挿入
	private static String ExchangeJoined_date(String joined_date) {
		StringBuilder sb = new StringBuilder();
		sb.append(joined_date.substring(0,4) + "年");
		sb.append(joined_date.substring(4,6) + "月");
		sb.append(joined_date.substring(6,8) + "日");
		return sb.toString();
	}

}


