package jp.excd.common;

public class C0005 {
	public static String C0005;// 性別の値を取得
	
	public static final String C0005_MALE = "1";
	public static final String C0005_FEMALE = "2";
	public static String Gender;
	
	public static String getExchangeGender(String gender) {
		if (C0005_MALE.equals(gender)) {
			Gender = "男";
		}else if (C0005_FEMALE.equals(gender)) {
			Gender = "女";
		}else {
			Gender = null;
		}
		return Gender;
	}
}