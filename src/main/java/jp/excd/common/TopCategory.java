package jp.excd.common;

public enum TopCategory {

	// カテゴリー一覧
	NEW_RECORD("1"), // 新着
	FAVORITE("2"), // お気に入り
	HIGH_RATING("3"), // 高評価
	MASTERPIECE("4"); // 名作
	
	private String code;
	
	private TopCategory(String code) {
		this.code = code;
	}
	
	public String getCode(){
		return this.code;
	}
	
	/**
	 * URLクエリパラメータのcategory値が2～4なら引数categoryCodeをそのまま返却
	 * category値が上記以外なら"1"(新着)を返却
	 * @param categoryCode URLクエリパラメータのcategory値
	 * 	 */
	public static String getCode(String categoryCode) {
		if (FAVORITE.getCode().equals(categoryCode)) {
			return categoryCode;
		} else if (HIGH_RATING.getCode().equals(categoryCode)) {
			return categoryCode;
		} else if (MASTERPIECE.getCode().equals(categoryCode)) {
			return categoryCode;
		}
		
		// URLのcategoryが2～4以外の場合は全て新着とする
		return NEW_RECORD.getCode();
	}
	
	
}
