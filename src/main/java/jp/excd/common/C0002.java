package jp.excd.common;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class C0002 {
	public static final Map<?,?> C0002;//キーのデータ内容を取得する

	static {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("01", "Cメジャー");
		map.put("02", "Cシャープメジャー");
		map.put("03", "Dフラットメジャー");
		map.put("04", "Dメジャー");
		map.put("05", "Dシャープメジャー");
		map.put("06", "Eフラットメジャー");
		map.put("07", "Eメジャー");
		map.put("08", "Fメジャー");
		map.put("09", "Fシャープメジャー");
		map.put("10", "Gフラットメジャー");
		map.put("11", "Gメジャー");
		map.put("12", "Gシャープメジャー");
		map.put("13", "Aフラットメジャー");
		map.put("14", "Aメジャー");
		map.put("15", "Aシャープメジャー");
		map.put("16", "Bフラットメジャー");
		map.put("17", "Bメジャー");
		map.put("18", "Cマイナー");
		map.put("19", "Cシャープマイナー");
		map.put("20", "Dフラットマイナー");
		map.put("21", "Dマイナー");
		map.put("22", "Dシャープマイナー");
		map.put("23", "Eフラットマイナー");
		map.put("24", "Eマイナー");
		map.put("25", "Fマイナー");
		map.put("26", "Fシャープマイナー");
		map.put("27", "Gフラットマイナー");
		map.put("28", "Gマイナー");
		map.put("29", "Gシャープマイナー");
		map.put("30", "Aフラットマイナー");
		map.put("31", "Aマイナー");
		map.put("32", "Aシャープマイナー");
		map.put("33", "Bフラットマイナー");
		map.put("34", "Bマイナー");
		C0002 = Collections.unmodifiableMap(map);

	}

	public static String getName(String no) {
		return (String)C0002.get(no);
	}
}
