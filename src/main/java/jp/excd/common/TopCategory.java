package jp.excd.common;

public enum TopCategory {
	// トップページS00001で利用
	// カテゴリー一覧
	NEW_RECORD("1", "新着"), // 新着
	FAVORITE("2", "お気に入り"), // お気に入り
	HIGH_RATING("3", "高評価"), // 高評価
	MASTERPIECE("4", "名作"); // 名作
	
	private String code;
	private String categoryName;
	
	private TopCategory(String code, String categoryName) {
		this.code = code;
		this.categoryName = categoryName;
	}
	
	public String getCode(){
		return this.code;
	}

	public String getCategoryName(){
		return this.categoryName;
	}
	
	/**
	 * URLクエリパラメータのcategory値が2～4なら引数categoryCodeをそのまま返却
	 * category値が上記以外なら"1"(新着)を返却
	 * @param categoryCode URLクエリパラメータのcategory値
	 * 	 */
	public static String getCode(String categoryCode) {
		if (FAVORITE.getCode().equals(categoryCode) ||
		   HIGH_RATING.getCode().equals(categoryCode) ||
		   MASTERPIECE.getCode().equals(categoryCode)) {
			return categoryCode;
		}
		
		// URLのcategoryが2～4以外の場合は全て新着とする
		return NEW_RECORD.getCode();
	}
	
	/**
	 * 引数categoryCode値と一致するカテゴリー名を返却する(例：caegoryCode="1"⇒"新着")
	 * category値が上記以外なら"1"(新着)を返却
	 * @param categoryCode URLクエリパラメータのcategory値
	 * 	 */
	public static String getCategoryName(String categoryCode) {
		for(TopCategory v : TopCategory.values()) {
			if(v.getCode().equals(categoryCode)) {
				return v.getCategoryName();
			}
		}
		return "";
	}
	
	
	
}
