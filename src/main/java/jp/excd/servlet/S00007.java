package jp.excd.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.excd.common.C0001;
import jp.excd.common.C0005;

public class S00007 extends HttpServlet {

	public void doGet(
			HttpServletRequest request,
			HttpServletResponse response)
					throws IOException, ServletException {

		getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request, response);
	}

	public void doPost(
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
			this.mainProcessForSearch(request, response, con);

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

	private void mainProcessForSearch(HttpServletRequest request, HttpServletResponse response, Connection con)
			throws IOException, Exception {

		// 接続URL受け取り
		String URL = request.getRequestURI();

		// (1) 接続URLが「/ja/S00007/searh」以外の場合は、404.jspへフォワーディングする。
		if ("/webA/ja/S00007/search".equals(URL)) {
		} else {
			getServletConfig().getServletContext().getRequestDispatcher("/jsp/404.jsp").forward(request, response);
		}

		// POSTパラメタの文字コードを指定
		request.setCharacterEncoding("UTF-8");

		// (2) 入力項目(POSTパラメタ)を使って、Requestオブジェクトのアトリビュートの初期化をする。
		String nickname_radio = request.getParameter("nickname_radio");
		String nickname_type_radio = request.getParameter("nickname_type_radio");
		String nickname = request.getParameter("nickname");
		String joined_date_radio = request.getParameter("joined_date_radio");
		String joined_date_from = request.getParameter("joined_date_from");
		String joined_date_to = request.getParameter("joined_date_to");
		String gender_radio = request.getParameter("gender_radio");
		String gender = request.getParameter("gender");
		String birthday_radio = request.getParameter("birthday_radio");
		String birthday_from = request.getParameter("birthday_from");
		String birthday_to = request.getParameter("birthday_to");
		String listener_count_radio = request.getParameter("listener_count_radio");
		String listener_count_from = request.getParameter("listener_count_from");
		String listener_count_to = request.getParameter("listener_count_to");
		String language_type_jp = request.getParameter("language_type_jp");
		String language_type_en = request.getParameter("language_type_en");
		String sort_order = request.getParameter("sort_order");
		String unique_code = request.getParameter("unique_code");


		//入力値をアトリビュートにセット
		request.setAttribute("error", null);
		request.setAttribute("nickname_is_error", null);
		request.setAttribute("nickname_radio", nickname_radio);
		request.setAttribute("nickname_type_radio", nickname_type_radio);
		request.setAttribute("nickname", nickname);
		request.setAttribute("joined_date_is_error", null);
		request.setAttribute("joined_date_radio", joined_date_radio);
		request.setAttribute("joined_date_from", joined_date_from);
		request.setAttribute("joined_date_to", joined_date_to);
		request.setAttribute("gender_radio", gender_radio);
		request.setAttribute("gender", gender);
		request.setAttribute("birthday_is_error", null);
		request.setAttribute("birthday_radio", birthday_radio);
		request.setAttribute("birthday_from", birthday_from);
		request.setAttribute("birthday_to", birthday_to);
		request.setAttribute("listener_count_is_error", null);
		request.setAttribute("listener_count_radio", listener_count_radio);
		request.setAttribute("listener_count_from", listener_count_from);
		request.setAttribute("listener_count_to", listener_count_to);
		request.setAttribute("language_type_is_error", null);
		request.setAttribute("language_type_jp", language_type_jp);
		request.setAttribute("language_type_en", language_type_en);
		request.setAttribute("sort_order", sort_order);
		request.setAttribute("unique_code", unique_code);

		Integer rf = null;
		Integer rt = null;

		//-----------------------------------------------------------------------------------------------
		// 入力チェック
		//-----------------------------------------------------------------------------------------------

		// (3)	ニックネームについて、エラー判定を行う。
		if ("1".equals(nickname_radio)) {
			if ("1".equals(nickname_type_radio) && nickname == null || "".equals(nickname)) {
				// エラー
				String s = this.getDescription(con, "ES00007_001", "002");
				request.setAttribute("error", s);
				request.setAttribute("nickname_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			} else if (!"1".equals(nickname_type_radio) && nickname == null || "".equals(nickname)) {
				// エラー
				String s = this.getDescription(con, "ES00007_001", "002");
				request.setAttribute("error", s);
				request.setAttribute("nickname_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			}
		}

		// (4) 登録日FROMについてエラー判定を行う。
		if ("1".equals(joined_date_radio)) {
			if (joined_date_from == null || "".equals(joined_date_from)) {
				// 処理継続
			} else if (this.isDateValue(joined_date_from) == false) {
				// エラー
				String s = this.getDescription(con, "ES00007_002", "002");
				request.setAttribute("error", s);
				request.setAttribute("joined_date_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			}
		}

		// (5) 登録日TOについてエラー判定を行う。
		if ("1".equals(joined_date_radio)) {
			if (joined_date_to == null || "".equals(joined_date_to)) {
				// 処理継続
			} else if (this.isDateValue(joined_date_to) == false) {
				// エラー
				String s = this.getDescription(con, "ES00007_003", "002");
				request.setAttribute("error", s);
				request.setAttribute("joined_date_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
			}
		}

		// (6) 登録日FROM、公開日TOについてエラー判定を行う。
		if ("1".equals(joined_date_radio)) {
			if ((joined_date_from == null || "".equals(joined_date_from)) &&	((joined_date_to == null || "".equals(joined_date_to)))) {
				//エラー
				String s = this.getDescription(con, "ES00007_004", "002");
				request.setAttribute("error", s);
				request.setAttribute("joined_date_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			} else if (joined_date_from == null || "".equals(joined_date_from) && this.isDateValue(joined_date_to) == true) {
				//処理続行
			} else if (this.isDateValue(joined_date_from)) {
				//処理続行
			}
		}


		// (7) 登録日FROM、登録日TOについてエラー判定を行う。
		// 上限値が未入力の場合
		if ("1".equals(joined_date_radio)) {
			if("".equals(joined_date_to) && !("".equals(joined_date_from))) {
				int checkResult = joined_date_to.compareTo(joined_date_from);
				if (checkResult > 0){
					// エラー
					String s = this.getDescription(con, "ES00007_005", "002");
					request.setAttribute("error", s);
					request.setAttribute("joined_date_is_error", "1");
					getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
							response);
					return;
				}
			}
		}

		// 下限値が未入力の場合
		if ("1".equals(joined_date_radio)) {
			if(!("".equals(joined_date_to)) && "".equals(joined_date_from)) {
				int checkResult = joined_date_to.compareTo(joined_date_from);
				if (checkResult < 0){
					// エラー
					String s = this.getDescription(con, "ES00007_005", "002");
					request.setAttribute("error", s);
					request.setAttribute("joined_date_is_error", "1");
					getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
							response);
					return;
				}
			}
		}

		// (8) 誕生日FROMについてエラー判定を行う。
		if ("1".equals(birthday_radio)) {
			if (birthday_from == null || "".equals(birthday_from)) {
				// 処理継続
			} else if (this.isDateValue(birthday_from) == false) {
				// エラー
				String s = this.getDescription(con, "ES00007_006", "002");
				request.setAttribute("error", s);
				request.setAttribute("birthday_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("cc").forward(request,
						response);
				return;
			}
		}

		// (9) 誕生日TOについてエラー判定を行う。
		if ("1".equals(birthday_radio)) {
			if (birthday_to == null || "".equals(birthday_to)) {
				// 処理継続
			} else if (this.isDateValue(birthday_to) == false) {
				// エラー
				String s = this.getDescription(con, "ES00007_007", "002");
				request.setAttribute("error", s);
				request.setAttribute("birthday_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
			}
		}

		// (10) 誕生日FROM、誕生日TOについてエラー判定を行う。
		if ("1".equals(birthday_radio)) {
			if ((birthday_from == null || "".equals(birthday_from)) && (birthday_to == null || "".equals(birthday_to))) {
				//エラー
				String s = this.getDescription(con, "ES00007_008", "002");
				request.setAttribute("error", s);
				request.setAttribute("birthday_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			} else if (joined_date_from == null
					|| "".equals(birthday_from) && this.isDateValue(birthday_to) == true) {
				//処理続行
			} else if (this.isDateValue(birthday_from)) {
				//処理続行
			}
		}

		// (11) 誕生日FROM、誕生日TOについてエラー判定を行う。
		//上限値が未入力の場合
		if ("1".equals(birthday_radio)) {
			if("".equals(birthday_to) && !("".equals(birthday_from))) {
				int checkResult = birthday_to.compareTo(birthday_from);
				if (checkResult > 0){
					// エラー
					String s = this.getDescription(con, "ES00007_009", "002");
					request.setAttribute("error", s);
					request.setAttribute("birthday_is_error", "1");
					getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
							response);
					return;
				}
			}

			// 下限値が未入力の場合
			if(!("".equals(birthday_to)) && "".equals(birthday_from)) {
				int checkResult = birthday_to.compareTo(birthday_from);
				if (checkResult < 0){
					// エラー
					String s = this.getDescription(con, "ES00007_005", "002");
					request.setAttribute("error", s);
					request.setAttribute("joined_date_is_error", "1");
					getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
							response);
					return;
				}
			}
		}

		// (12) リスナー数FROMについてエラー判定を行う。
		if ("1".equals(listener_count_radio)) {
			if (listener_count_from == null || "".equals(listener_count_from)) {
				// 処理継続
			} else if (this.isNumber(listener_count_from) == false) {
				// エラー
				String s = this.getDescription(con, "ES00007_010", "002");
				request.setAttribute("error", s);
				request.setAttribute("listener_count_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			} else {
				// 処理継続
				rf = Integer.parseInt(listener_count_from);
			}
		}

		// (13) リスナー数TOについてエラー判定を行う。
		if ("1".equals(listener_count_radio)) {
			if (listener_count_to == null || "".equals(listener_count_to)) {
				//処理継続
			} else if (this.isNumber(listener_count_to) == false) {
				//エラー
				String s = this.getDescription(con, "ES00007_011", "002");
				request.setAttribute("error", s);
				request.setAttribute("listener_count_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			} else {
				//処理継続
				rt = Integer.parseInt(listener_count_to);
			}
		}

		// (14) リスナー数FROM リスナー数TO についてエラー判定を行う。
		if ("1".equals(listener_count_radio)) {
			if ((listener_count_from == null || "".equals(listener_count_from)) && (listener_count_to == null || "".equals(listener_count_to))) {
				//エラー
				String s = this.getDescription(con, "ES00007_012", "002");
				request.setAttribute("error", s);
				request.setAttribute("listener_count_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			} else if (listener_count_from == null || "".equals(listener_count_from) && this.isNumber(listener_count_to) == true) {
				//処理続行
			} else if (this.isNumber(listener_count_from)) {
				//処理続行
			}
		}


		// (15) リスナー数FROM、リスナー数TO（逆転チェック）
		if ("1".equals(listener_count_radio)) {
			if (!("".equals(listener_count_from))) {
				rf = Integer.parseInt(listener_count_from);
			}
			if (!("".equals(listener_count_to))) {
				rt = Integer.parseInt(listener_count_to);
			}
			//上限値が未入力の場合
			if("".equals(listener_count_to) && !("".equals(listener_count_from))) {
				rt = 0;
				if (rf < rt) {
					//エラー
					String s = this.getDescription(con, "ES00007_013", "002");
					request.setAttribute("error", s);
					request.setAttribute("listener_count_is_error", "1");
					getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
							response);
					return;
				}
			}

			//下限値が未入力の場合
			if(!("".equals(listener_count_to)) && ("".equals(listener_count_from))){
				rf = 0;
				if (rf > rt) {
					//エラー
					String s = this.getDescription(con, "ES00007_013", "002");
					request.setAttribute("error", s);
					request.setAttribute("listener_count_is_error", "1");
					getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
							response);
					return;
				}
			}
		}


		// (16)	言語区分について、エラー判定を行う。
		if ("002".equals(language_type_jp)) {
			if ("001".equals(language_type_en)) {
				// エラー
				String s = this.getDescription(con, "ES00007_014", "002");
				request.setAttribute("error", s);
				request.setAttribute("language_type_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			}
		} else {
			if(!("001".equals(language_type_en))) {
				// エラー
				String s = this.getDescription(con, "ES00007_014", "002");
				request.setAttribute("error", s);
				request.setAttribute("language_type_is_error", "1");
				getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request,
						response);
				return;
			}
		}


		// (17) SQLの組み立てと、Where句への値の設定を行う。
		List<ComposerRecord_s> results = null;
		try {
			results = executeQuery(request, response, con,
					nickname_radio,
					nickname_type_radio,
					nickname,
					joined_date_radio,
					joined_date_from,
					joined_date_to,
					gender_radio,
					gender,
					birthday_radio,
					birthday_from,
					birthday_to,
					listener_count_radio,
					listener_count_from,
					listener_count_to,
					language_type_jp,
					language_type_en,
					sort_order);
		} catch (Exception e) {
			String error = getDescription(con, "ES00007_015", "002");
			request.setAttribute("error", error);
			getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request, response);
			return;
		}

		if (results == null) {
			results = new ArrayList<ComposerRecord_s>();
		}
		int listSize = results.size();

		// (18) ゼロ件チェック
		if (listSize == 0) {
			String error = getDescription(con, "ES00007_016", "002");
			request.setAttribute("error", error);
			getServletConfig().getServletContext().getRequestDispatcher("/ja/S00007.jsp").forward(request, response);
			return;
		}

		// (19) 前処理で得られたListを用いて、Requestオブジェクトに値を設定していく。
		List<ComposerRecord_s> newList =  new ArrayList<ComposerRecord_s>();

		int counter = 0;
		int hit = 0;

		for (ComposerRecord_s l : results) {
			counter = counter + 1;
			// 先頭の10件のみ処理を行う。
			if (counter > 10) {
				counter = counter -1;
				continue;
			}
			newList.add(l);
		}

		for (ComposerRecord_s cr : results) {
			hit = hit + 1;
			// 件数の総数
			if (hit > hit) {
				hit = hit -1;
				break;
			}
		}
		
		String hits = NumberFormat.getNumberInstance().format(hit);
		if(hit <= 10) {
			hits = hits + "件が該当します。";
		} else {
			hits = hits + "件が該当します。（うち10件を表示しています。）";
		}
		
		request.setAttribute("hits", hits);
		request.setAttribute("list", newList);

		// (20) S00008.にフォワーディングする。
		getServletConfig().getServletContext().getRequestDispatcher("/ja/S00008.jsp").forward(request, response);
	}

	//文言マスタより引数で渡されたkeyをIDにもつレコードを取得

	private String getDescription(Connection con, String key_id, String key_language)
			throws Exception {
		String ret = "";
		String sql = "select description from mst_description where description_id = ? and language_type = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, key_id);
		pstmt.setString(2, key_language);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			ret = rs.getString("description");
		}

		rs.close();
		pstmt.close();
		return ret;

	}

	private List<ComposerRecord_s> executeQuery(HttpServletRequest request, HttpServletResponse response, Connection con,
			String nickname_radio,
			String nickname_type_radio,
			String nickname,
			String joined_date_radio,
			String joined_date_from,
			String joined_date_to,
			String gender_radio,
			String gender,
			String birthday_radio,
			String birthday_from,
			String birthday_to,
			String listener_count_radio,
			String listener_count_from,
			String listener_count_to,
			String language_type_jp,
			String language_type_en,
			String sort_order) throws Exception {

		// (1) SQLの断片を準備する
		String sql1 = "SELECT ID, unique_code, nickname, DATE_FORMAT(joined_date,'%Y年%c月%e日') as joined_date, gender, DATE_FORMAT(birthday,'%Y年%c月%e日') as birthday, FORMAT(listener_count,0) as listener_count, language_type ";
		String sql2 = "FROM composer ";
		String sql3 = "WHERE ";
		String sql4 = "nickname  LIKE ? ";
		//String sql5 = "AND ";
		String sql6 = "nickname = ? ";
		String sql7 = "AND ";
		String sql8 = "joined_date >= ? ";
		String sql9 = "AND ";
		String sql10 = "joined_date <= ? ";
		String sql11 = "AND ";
		String sql12 = "gender = ? ";
		String sql13 = "AND ";
		String sql14 = "birthday >= ? ";
		String sql15 = "AND ";
		String sql16 = "birthday <= ? ";
		String sql17 = "AND ";
		String sql18 = "listener_count >= ? ";
		String sql19 = "AND ";
		String sql20 = "listener_count <= ? ";
		String sql21 = "AND ";
		String sql22 = "language_type = ? ";
		String sql23 = " ORDER BY joined_date desc;";
		String sql24 = " ORDER BY joined_date asc;";
		String sql25 = " ORDER BY listener_count asc;";
		String sql26 = " ORDER BY listener_count desc;";

		// (2) SQLを連結するための文字列を宣言する。
		String query = sql1 + sql2;

		// (3) プレイスホルダに設定する値を格納するためのListを用意する。
		List<PlaceHolderInput> list = new ArrayList<PlaceHolderInput>();

		// (4) ニックネームのSQLへの連結及びプレイスホルダへの設定
		if ("1".equals(nickname_radio)) {
			if ("1".equals(nickname_type_radio)) {
				if (nickname == null || "".equals(nickname)) {
					// 処理続行
				} else {
					// WHERE連結
					query = query + sql3;
					// No,4を連結する
					query = query + sql4;
					//プレイスホルダに保持
					PlaceHolderInput phi = new PlaceHolderInput();
					phi.setType("3");
					phi.setStringValue("%" + nickname +"%");
					list.add(phi);
				}

			} else if (nickname == null || "".equals(nickname)) {
				// 処理続行
			} else {
				//WHERE連結
				query = query + sql3;
				//No.6を連結する。
				query = query + sql6;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(nickname);
				list.add(phi);
			}
		}

		// (5) 登録日FROM,TOのSQLへの連結及びプレイスホルダへの設定
		if ("1".equals(joined_date_radio)) {
			if (joined_date_from == null || "".equals(joined_date_from)) {
				//処理続行
			} else if (list.size() == 0) {
				//WHERE連結
				query = query + sql3;
				query = query + sql8;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(joined_date_from);
				list.add(phi);
			} else {
				//AND連結
				query = query + sql7;
				query = query + sql8;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(joined_date_from);
				list.add(phi);
			} 
		}
		if ("1".equals(joined_date_radio)) {
			if (joined_date_to == null || "".equals(joined_date_to)) {
				//処理続行
			} else if (list.size() == 0) {
				//WHERE連結
				query = query + sql3;
				query = query + sql10;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(joined_date_to);
				list.add(phi);
			} else {
				//AND連結
				query = query + sql9;
				query = query + sql10;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(joined_date_to);
				list.add(phi);
			}
		}

		// (7) 性別のSQLへの連結及びプレイスホルダへの設定
		if ("1".equals(gender_radio )) {
			if (list.size() == 0) {
				//WHEREを連結
				query = query + sql3;
			} else {
				//ANDを連結
				query = query + sql11;
			}

			query = query + sql12;

			//プレイスホルダに保持
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(gender);
			list.add(phi);
		}

		// (8) 誕生日FROM,TOのSQLへの連結及びプレイスホルダへの設定
		if ("1".equals(birthday_radio)) {
			if (birthday_from == null || "".equals(birthday_from)) {
				//処理続行
			} else if (list.size() == 0) {
				//WHERE連結
				query = query + sql3;
				query = query + sql14;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(birthday_from);
				list.add(phi);
			} else {
				//AND連結
				query = query + sql13;
				query = query + sql14;
				//プレイスホルダに保持
				PlaceHolderInput phi = new PlaceHolderInput();
				phi.setType("3");
				phi.setStringValue(birthday_from);
				list.add(phi);
			}
			//プレイスホルダに保持
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(birthday_from);
			list.add(phi);
		}

		if ("1".equals(birthday_radio)) {
			if (birthday_to == null || "".equals(birthday_to)) {
				//処理続行
			} else 	if (list.size() == 0) {
				//WHERE連結
				query = query + sql3;
				query = query + sql16;
			} else {
				//AND連結
				query = query + sql15;
				query = query + sql16;
			}
			//プレイスホルダに保持
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(birthday_to);
			list.add(phi);
		}

		// (10) リスナー数FROM,TOのSQLへの連結及びプレイスホルダへの設定
		if ("1".equals(listener_count_radio)) {
			if (listener_count_from == null || "".equals(listener_count_from)) {
				//処理続行
			} else if (list.size() == 0) {
				//WHERE連結
				query = query + sql3;
				query = query + sql18;
			} else {
				//AND連結
				query = query + sql17;
				query = query + sql18;
			}
			//プレイスホルダに保持
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(listener_count_from);
			list.add(phi);
		}

		if ("1".equals(listener_count_radio)) {
			if (birthday_to == null || "".equals(listener_count_to)) {
				//処理続行
			} else 	if (list.size() == 0) {
				//WHERE連結
				query = query + sql3;
				query = query + sql20;
			} else {
				//AND連結
				query = query + sql19;
				query = query + sql20;
			}
			//プレイスホルダに保持
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(listener_count_to);
			list.add(phi);
		}


		// (12) 言語区分のSQLへの連結及びプレイスホルダへの設定
		if ("002".equals(language_type_jp)) {
			if (list.size() == 0) {
				//WHEREを連結
				query = query + sql3;
			} else {
				//AND連結
				query = query + sql21;
			}
			//プレイスホルダに保持
			query = query + sql22;
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(language_type_jp);
			list.add(phi);
		} else if ("001".equals(language_type_en)) {
			if (list.size() == 0) {
				//WHEREを連結
				query = query + sql3;
			} else {
				//AND連結
				query = query + sql21;
			}
			query = query + sql22;
			//プレイスホルダに保持
			PlaceHolderInput phi = new PlaceHolderInput();
			phi.setType("3");
			phi.setStringValue(language_type_en);
			list.add(phi);
		}

		// (13) 並び順の値に従って、ORDER BY句を連結する。
		if ("01".equals(sort_order)) {
			query = query + sql23;
		} else if ("02".equals(sort_order)) {
			query = query + sql24;
		} else if ("03".equals(sort_order)) {
			query = query + sql25;
		} else if ("04".equals(sort_order)) {
			query = query + sql26;
		} else {
			throw new Exception();
		}


		// (14) PreparedStatementのインスタンスを得る。
		PreparedStatement pstmt = con.prepareStatement(query);

		// (15) Where句の連結があれば、(4)で生成したプレイスホルダ用のListの内容をすべて、プレイスホルダに設定する。
		for (int i = 0; i <list.size(); i++) {
			PlaceHolderInput option = list.get(i);
			String type = option.getType();
			if ("1".equals(type)) {
				pstmt.setInt(i + 1, option.getIntValue());
			} else if ("2".equals(type)) {
				pstmt.setDouble(i + 1, option.getDoubleValue());
			} else if ("3".equals(type)) {
				pstmt.setString(i + 1, option.getStringValue());
			}
		}

		// (16) executeQueryを実行し、結果の「ResultSet」を得る。
		System.out.println(query);
		ResultSet rs = pstmt.executeQuery();
		List<ComposerRecord_s> ComposerList = new ArrayList<ComposerRecord_s>();


		while (rs.next()) {
			ComposerRecord_s record = new ComposerRecord_s();
			//作曲家ID
			String Id = rs.getString("id");
			record.setId(Id);
			//ユニーク名
			String Unique_code = rs.getString("unique_code");
			record.setUnique_code(Unique_code);
			//ニックネーム
			String Nickname = rs.getString("nickname");
			record.setNickname(Nickname);
			//登録日
			String Date = rs.getString("joined_date");
			record.setDate(Date);
			//性別
			String Gender = rs.getString("gender");
			Gender = C0005.getGender(Gender);
			record.setGender(Gender);
			//誕生日
			String Birthday = rs.getString("birthday");
			record.setBirthday(Birthday);
			//リスナー数
			String Listener = rs.getString("listener_count");
			record.setListener(Listener);
			//言語
			String Language = rs.getString("language_type");
			Language = C0001.getLanguage(Language);
			record.setLanguage(Language);

			ComposerList.add(record);
		}

		// (17) ResultSetのインスタンス、PreparedStatementのインスタンスをクローズする。
		pstmt.close();

		// (18) 前処理で生成したListを呼び出し元に返却する。
		return ComposerList;
	}

	private boolean isNumber(String num) {
		try {
			Integer.parseInt(num);
			return true;
		} catch (NumberFormatException e) {
			return false; // エラーにならないように、とりあえずダミー
		}
	}

	private boolean isDateValue(String value) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		try {
			format.parse(value);
			return true;
		} catch (ParseException e) {
			return false;
		}
	}
}