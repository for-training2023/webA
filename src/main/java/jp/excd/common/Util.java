package jp.excd.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

public class Util {
	public final static int IMAGE_FILE_WIDTH = 275; // 画像の横幅px(固定)
	public final static int IMAGE_FILE_MAX_HEIGHT = 160; // 画像の縦幅px(最大値)
	
	/**
	 * 文言マスタから文言を取得する
	 * @param con DBコネクション
	 * @param description_id 文言ID
	 * @param language_type 言語区分
	 * @return 文言
	 */
	public static String getDescription(Connection con, String descriptionId, String languageType)
			throws Exception {
		int pstmtParameterIndex = 1;
		String ret = "";
		String sql = "SELECT description FROM mst_description WHERE description_id = ? and language_type = ?;";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(pstmtParameterIndex, descriptionId);
			pstmtParameterIndex++;
			pstmt.setString(pstmtParameterIndex, languageType);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ret = rs.getString("description");
			}
			
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		pstmt.close();
		return ret;
	}
	

	/**
	 * 引数targetPathをコンテキストルートからのパスに変換して返却
	 * @param request
	 * @param targetPath 返却する文字列の後半部分(先頭にスラッシュ('/')必須)
	 * @return コンテキストルートからのパス
	 */
	public static String addContextPath(HttpServletRequest request, String targetPath) {
		String contextPath = request.getContextPath();
		
		if(Util.isNullOrEmpty(targetPath)) return "";
		
		return contextPath + targetPath;
	}
	

	/**
	 * 引数の画像ファイル名の先頭に「../images/」を付加し、ファイル名含めた相対パスを返却する
	 * @param imageFileName 画像ファイル名
	 * @return 画像ファイルへの相対パス
	 */
	public static String imageFilePathFormat(String imageFileName) {
		String imageFilePath = ""; //DBにファイル名が保存されていない場合は空文字を返却する

		if(imageFileName != null && !imageFileName.isEmpty()){
			// jspから画像ファイルへの相対パスを設定
			// 絶対パスの生成にはコンテキストパスrequest.getContextPath()の取得が必要で、
			// 仮引数requestを追加する実装が面倒なので、今回は相対パスで実装
			imageFilePath = "../images/" + imageFileName;
		}
		return imageFilePath;
	}
	
	
	/**
	 * 整数に変換可能かチェックする
	 * @param num チェック対象値
	 * @return True:変換可能,  False:変換不可
	 */
	public static boolean canCovertInt(String num) {
		try {
			Integer.parseInt(num);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
	

	/**
	 * 文字列のNullおよびblankチェックを行う
	 * @param str チェック対象の文字列
	 * @return True:Nullもしくは空欄,  False:それ以外
	 */	
	public static boolean isNullOrEmpty(String str) {
		if (str == null || str.isEmpty()) {
			return true;
		}
		return false;
	}	
	
}
