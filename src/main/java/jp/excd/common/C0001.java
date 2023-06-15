package jp.excd.common;

public class C0001 {
	public static String C0001;//言語区分の日本語or英語を取得する
	
	public static final String C0001_ENG = "001";
	public static final String C0001_JPN = "002";
	public static String Language;

	public static String getLanguage(String language) {
		if(C0001_ENG.equals(language)) {
			Language  = "英語";
		}
		if(C0001_JPN.equals(language)) {
			Language  = "日本語";
		}
		return Language;
	}
}
