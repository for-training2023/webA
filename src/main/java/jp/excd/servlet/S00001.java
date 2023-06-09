package jp.excd.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.excd.bean.SongComposerBean;
import jp.excd.bean.SongComposerRecord;
import jp.excd.common.TopCategory;
import jp.excd.common.Util;

public class S00001 extends HttpServlet {

	public final static int MAX_DISPLAY_RANGE = 5; // 1ページ辺りの表示件数

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws IOException, ServletException {

		Connection con = null;
		//文字コード指定
		request.setCharacterEncoding("UTF-8");

		String dbName = "meloko";
		String userName = "meloko";
		String password = "exceed";
		String timeZone = "Asia/Tokyo";

		try {
			// (1)DB接続（コネクションの確立）
			con = MySQLSetting.getConnection(dbName, userName, password, timeZone);

			// (2)内部メソッド呼び出し
			this.mainProcessForToppage(request, response, con);

		} catch (Exception e) {
			e.printStackTrace();
			getServletConfig().getServletContext().getRequestDispatcher("/jsp/500.jsp").forward(request, response);
		} finally {
			try {
				if (con != null) {

					// (3)接続したコネクションの切断を行う。
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				getServletConfig().getServletContext().getRequestDispatcher("/jsp/500.jsp").forward(request, response);
			}
		}
	}
	
	private void mainProcessForToppage(HttpServletRequest request, HttpServletResponse response, Connection con)
			throws IOException, Exception {

		//接続URL受け取り
		String URL = request.getRequestURI();
		String contextPath = request.getContextPath();

		// 接続URLが「/ja/S00001」以外の場合は、404.jspへフォワーディングする。
		if (!(contextPath + "/ja/S00001").equals(URL)) {
			getServletConfig().getServletContext().getRequestDispatcher("/jsp/404.jsp").forward(request, response);
		}

		// 文字コード指定
		request.setCharacterEncoding("UTF-8");

		// 呼出しパラメータを取得する
		// カテゴリー
		String category = request.getParameter("category"); // カテゴリーコード
		category = TopCategory.getCode(category); // カテゴリコードが2～4以外なら1(新着)を設定
		
		// データ取得開始位置
		String fromOrg = request.getParameter("from");
		int from;
		if (Util.isNullOrEmpty(fromOrg) || !Util.canCovertInt(fromOrg)) {
			from = 1; // 1件目から取得表示する
		}else{
			from = Integer.parseInt(fromOrg);
		}
		
		// 次ページの表示開始位置
		int nextFrom = from + MAX_DISPLAY_RANGE;

		// 初期表示(データ)用のデータ取得を行う
		List<SongComposerRecord> results = null;
		results = executeQuery(request, response, con, category, from);
		
		// 画面に出力するListを作成する
		List<SongComposerBean> resultsForDisplay = null;
		resultsForDisplay = SqlResultEdit(results);

		// アプリリンクの文言の取得を行う
		String appMessage = Util.getDescription(con, "DS00001_001", LanguageType.JPN.getCode());

		// 告知データの取得を行う
		String noticeMessage = this.getNotice(con, LanguageType.JPN.getCode());

		// Requestオブジェクトに値を設定（setAttribute）する
		request.setAttribute("nextFrom", nextFrom);
		request.setAttribute("category", category);
		request.setAttribute("displayList", resultsForDisplay);
		request.setAttribute("appMessage", appMessage);
		request.setAttribute("noticeMessage", noticeMessage);
		
		// S00001.jspにフォワーディングする。
		request.getRequestDispatcher("/ja/S00001.jsp").forward(request, response);
	}

	
	/**
	 * 告知内容データを取得する
	 * @param con DB接続情報
	 * @param languageType 言語区分のコード値
	 * @return 告知内容(対象データが場合は空文字を返却)
	 */
	private String getNotice(Connection con, String languageType)
			throws Exception {
		int pstmtParameterIndex = 1;
		String ret = "";
		String sql = "select notice from top_notice where language_type = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(pstmtParameterIndex, languageType);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ret = rs.getString("notice");
			}
			
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		pstmt.close();
		return ret;
	}


	/**
	 * SQL文を生成して、DBよりデータを取得する
	 * @return DB取得データ
	 */
	private List<SongComposerRecord> executeQuery(HttpServletRequest request, HttpServletResponse response, Connection con,
			String category, int displayFrom) throws Exception {

		// SQLの断片を用意する。
		String sql = null;

		sql = "SELECT "
				+ "song.id"
				+ ", song.title"
				+ ", composer.unique_code"
				+ ", composer.nickname"
				+ ", song.rating_total"
				+ ", song.rating_average"
				+ ", song.total_listen_count"
				+ ", song.release_datetime"
				+ ", song.image_file_name"
				+ ", song.image_file_height"
				+ ", song.image_file_width"
				+ " FROM song"
				+ " INNER JOIN composer ON composer.id = song.composer_id "
				+ " WHERE song.release_datetime >= ? ";

		// 現在のエポック秒を取得
		Date date = new Date();
		Double nowEpoch = (double) date.getTime();

		// 差分を算出
		Double diff1 = (nowEpoch - 5184000000L) / 1000;// カテゴリ1-3(1カ月未満)
		Double diff2 = (nowEpoch - 63072000000L) / 1000;// カテゴリ4(1年未満)

		//カテゴリごとにプリペアドステートメント
		PreparedStatement pstmt = null;

		//リストの宣言
		List<SongComposerRecord> SongComposerList = new ArrayList<SongComposerRecord>();
		
		// 並び順の値に従って、ORDER BY句を連結する。
		if (TopCategory.FAVORITE.getCode().equals(category)) {
			sql = sql + "ORDER BY song.rating_total desc";
		} else if (TopCategory.HIGH_RATING.getCode().equals(category)) {
			sql = sql + "ORDER BY song.rating_average desc";
		} else if (TopCategory.MASTERPIECE.getCode().equals(category)) {
			sql = sql + "ORDER BY song.rating_total desc";
		} else {
			// 上記以外のとき(category=1(新着)も含む)
			sql = sql + "ORDER BY song.release_datetime desc";
		}

		// 先頭の100件を表示対象とする。LIMIT句を連結する。
		sql = sql + " LIMIT 100;";
		
		int pstmtParameterIndex = 1;
		try {
			pstmt = con.prepareStatement(sql);// SQL解析

			// 公開日時の条件設定(カテゴリ「名作」とそれ以外)
			if (TopCategory.MASTERPIECE.getCode().equals(category)) {
				pstmt.setDouble(pstmtParameterIndex, diff2);
			} else {
				pstmt.setDouble(pstmtParameterIndex, diff1);
			}
			
			// executeQueryを実行し、結果の「ResultSet」を得る。
			ResultSet rs = pstmt.executeQuery();

			int hitsCounter = 0;
			displayFrom--; // ループカウンタhitsCounterの初期値0のため、例えば1件目から抽出する場合はdisplayFrom=0である必要がある
			int displayTo = displayFrom + MAX_DISPLAY_RANGE - 1;
			
			while (rs.next()) {
				if( displayFrom <= hitsCounter && hitsCounter <= displayTo ) {
					SongComposerRecord record = new SongComposerRecord();

					record.setSongId(rs.getLong("song.id"));
					record.setTitle(rs.getString("song.title"));
					record.setUniqueCode(rs.getString("composer.unique_code"));
					record.setNickname(rs.getString("composer.nickname"));
					record.setRatingTotal(rs.getLong("song.rating_total"));
					record.setRatingAverage(rs.getDouble("song.rating_average"));
					record.setTotalListenCount(rs.getLong("song.total_listen_count"));
					record.setReleaseDatetime(rs.getDouble("song.release_datetime"));
					record.setImageFileName(rs.getString("song.image_file_name"));
					record.setImageFileHeight(rs.getInt("song.image_file_height"));
					record.setImageFileWidth(rs.getInt("song.image_file_width"));
					
					SongComposerList.add(record);
				}
				hitsCounter++;
			}
			// hitsCounterについて。
			// 本来は検索結果件数を得るためにfor文を回すのは無駄が多いので、
			// 下記で実装しようとしたが、rs.afterLast();のエラーが解決できなかったので仕方なくそのまま
			// rs.afterLast(); // 最終行に移動
			// rs.getRow(); // 現在の行数を取得
			
			// Requestオブジェクトに検索結果件数を設定（setAttribute）する
			request.setAttribute("hits", hitsCounter);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// PreparedStatementのインスタンスをクローズする。
		pstmt.close();

		// 前処理で生成したListを呼び出し元に返却する。
		return SongComposerList;
	}

	
	/**
	 * SQLにより取得したデータを加工して、画面表示用Listに詰めかえる
	 * @param SongComposerList 加工前のSQL取得データ
	 * @return 加工後のデータ
	 */
	private List<SongComposerBean> SqlResultEdit(List<SongComposerRecord> SongComposerList) {
		//リストの宣言
		List<SongComposerBean> displayList = new ArrayList<SongComposerBean>();

		for(SongComposerRecord record : SongComposerList){
				SongComposerBean beanRecord = new SongComposerBean();

				beanRecord.setSongId(Long.toString(record.getSongId()));
				beanRecord.setTitle(record.getTitle());
				beanRecord.setUniqueCode(record.getUniqueCode());
				beanRecord.setNickname(record.getNickname());

				// 編集する値
				beanRecord.setRatingTotalFormated(valueCommaFormat(record.getRatingTotal())); // 総評価数(カンマ編集済み)
				beanRecord.setRatingAverageFormated(averageFormat(record.getRatingAverage())); // 平均評価数(小数編集済み)
				beanRecord.setTotalListenCountFormated(valueCommaFormat(record.getTotalListenCount())); // 再生回数(カンマ編集済み)
				beanRecord.setReleaseDatetimeFormated(getFromEpochToFormat(record.getReleaseDatetime())); // 公開日(表示文言編集済み)

				// ファイル関連の値
				String imageFileName = record.getImageFileName();
				int width = record.getImageFileWidth();
				double height = imageHeightFormat(width, record.getImageFileHeight());
				
				beanRecord.setImageFileNameFormated(Util.imageFilePathFormat(imageFileName)); // ファイル名(画像ファイルパス編集済み)

				// DBから取得したファイル名のファイルが存在するかどうかによって、設定する値を変更する
				// DBにファイル名がないのか、取得したファイル名のファイルが存在しないのかを区別するため、
				// ファイルが存在しない場合は、noimage.pngを出すのではなく、altメッセージを表示する
				if(existsFileOrFolder("images/" + imageFileName)) {
					beanRecord.setImageFileHeightFortmated(height); // 画像ファイル高さ(編集済み)
					beanRecord.setImageFileHeightCutLength(cutLength(height)); // 画像上部をカットする長さ					
				}else {
					beanRecord.setImageFileHeightFortmated((double)Util.IMAGE_FILE_MAX_HEIGHT); // 画像ファイル高さ(編集済み)
					beanRecord.setImageFileHeightCutLength((double)0); // 画像上部をカットする長さ					
				}
				beanRecord.setImageFileWidthFormated(Util.IMAGE_FILE_WIDTH); // 横幅pxは固定
				
				displayList.add(beanRecord);
		}

		return displayList;
	}
	
	
	/**
	 * 引数targetPathのファイルもしくはフォルダが存在するかチェック
	 * @param targetPath コンテキストルートより後続のパス("コンテキストルート/"を含まない)を想定
	 * 		　 相対パスだと呼び出す場所によって結果が変わるため絶対パス
	 * @return 存在すればtrue、なければfalse
	 */
	public boolean existsFileOrFolder(String targetPath) {
		String pathInfo = this.getServletContext().getRealPath("/"); // コンテキストルートまでの物理パスを取得
		Path p = Paths.get(pathInfo + targetPath);
		
		return Files.exists(p) ? true : false;
	}
	

	/**
	 * ↓↓↓↓↓
	 * 仮の実装
	 * 下記以降の処理は、共通機能Utilクラスに移行する可能性あり
	 * 現時点で作成が完了している部品のみで動作確認ができるよう、仮で実装している
	 */	
	/**
	 * 言語区分のコード値関連
	 */
	public enum LanguageType{
		ENG("001", "ENG", "英語"), 
		JPN("002", "JPN", "日本語");
		
		private String code;
		private String contentEng;
		private String contentJpn;
		
		private LanguageType(String code, String contentEng, String contentJpn) {
			this.code = code;
			this.contentEng = contentEng;
			this.contentJpn = contentJpn;
		}
		
		public String getCode(){
			return this.code;
		}

		public String getContentEng(){
			return this.contentEng;
		}
		
		public String getContentJpn(){
			return this.contentJpn;
		}
	}

	/**
	 * 画像ファイルの高さを調整する
	 * @param width 画像幅
	 * @param height 画像高さ
	 * @return フォーマット後の画像高さ
	 */
	public static double imageHeightFormat(int width , int height) {
		double formatHeight = height;
		if(width != Util.IMAGE_FILE_WIDTH) {
			//横幅は固定のため、違う場合は縦横比を保ったまま拡大・縮小する
			double widthRate= Util.IMAGE_FILE_WIDTH / (double)width; //この計算で高さを何倍させれば良いか出す
			formatHeight = widthRate * height; //調整後の高さ
		}
		return formatHeight;
	}

	/**
	 * 画像ファイル高さの余剰分(カットする)を計算する
	 * @param height 画像高さ
	 * @return (画像上部)カットする長さ
	 */
	public static double cutLength(double height) {
		double imageLength = 0;
		if(height > Util.IMAGE_FILE_MAX_HEIGHT) {
			// 画像高さがIMAGE_FILE_MAX_HEIGHTを超える場合、余剰分をカットしなければならない
			// 画像高さからIMAGE_FILE_MAX_HEIGHTを引いた値を2で割ると、画像上部(および下部)の余剰分が分かる
			imageLength = (height - Util.IMAGE_FILE_MAX_HEIGHT) / 2;
		}
		return imageLength;
	}

	/**
	 * 3桁区切りのフォーマット化
	 * @param 数字 (#####)
	 * @return フォーマット後の数字
	 */
	public static String valueCommaFormat(Long num) {
		// 3桁区切りでカンマ表示
		return String.format("%,d", num);
	}

	/**
	 * 少数を含む値(平均感動指数)のフォーマット化
	 * @param 数字 (#.####)
	 * @return フォーマット後の数字
	 */
	public static String averageFormat(Double num) {
		// 小数第2位で四捨五入し、小数第1位まで表示
		return String.format("%.1f", num);
	}

	
	/**
	 * 公開日時の表示ラベル取得
	 * @param release_datetime 公開日時
	 * @return
	 */
	private String getFromEpochToFormat(Double release_datetime) {
		String resultVal;
		double d_releaseDay = 0;

		//現在のエポック秒を取得
		Date date = new Date();
		Double nowEpoch = (double) date.getTime();

		//差分を算出
		Double diff = nowEpoch - release_datetime * 1000;

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
			resultVal = diff + "秒前";

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
	/**
	 * ↑↑↑↑↑
	 * 上記までが仮実装箇所
	 */	

}

