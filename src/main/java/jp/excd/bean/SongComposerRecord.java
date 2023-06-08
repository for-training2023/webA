package jp.excd.bean;

public class SongComposerRecord {
	// メンバ名をキャメルケースで命名しているため、
	// もしかしたら他Beanと命名規則が異なっているかもしれないです。
		
	private long songId; // 曲ID
	private String title; // 曲名
	private String uniqueCode; // ユニーク名(作曲家)
	private String nickname; // ニックネーム(作曲家)
	private long ratingTotal; // 総感動指数
	private double ratingAverage; // 平均感動指数
	private long totalListenCount; // 再生回数
	private double releaseDatetime; // 公開時間
	private String imageFileName; // イメージファイル名
	private int imageFileHeight; // イメージ画像高さ
	private int imageFileWidth; // イメージ画像幅

	
	/**
	 * 曲ID
	 */
	public long getSongId() {
		return this.songId;
	}
	public void setSongId(long songId) {
		this.songId = songId;
	}

	
	/**
	 * 曲名
	 */
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
	/**
	 * ユニーク名(作曲家)
	 */
	public String getUniqueCode() {
		return this.uniqueCode;
	}
	public void setUniqueCode(String uniqueCode) {
		this.uniqueCode = uniqueCode;
	}

	
	/**
	 * ニックネーム(作曲家)
	 */
	public String getNickname() {
		return this.nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * 総感動指数
	 */
	public long getRatingTotal() {
		return this.ratingTotal;
	}
	public void setRatingTotal(long ratingTotal) {
		this.ratingTotal = ratingTotal;
	}

	
	/**
	 * 平均感動指数
	 */
	public double getRatingAverage() {
		return this.ratingAverage;
	}
	public void setRatingAverage(double ratingAverage) {
		this.ratingAverage = ratingAverage;
	}

	
	/**
	 * 再生回数
	 */
	public long getTotalListenCount() {
		return this.totalListenCount;
	}
	public void setTotalListenCount(long totalListenCount) {
		this.totalListenCount = totalListenCount;
	}

	
	/**
	 * 公開時間
	 */
	public double getReleaseDatetime() {
		return this.releaseDatetime;
	}
	public void setReleaseDatetime(double releaseDatetime) {
		this.releaseDatetime = releaseDatetime;
	}

	
	/**
	 * イメージファイル名
	 */
	public String getImageFileName() {
		return this.imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	
	/**
	 * イメージ画像高さ
	 */	
	public int getImageFileHeight() {
		return this.imageFileHeight;
	}
	public void setImageFileHeight(int imageFileHeight) {
		this.imageFileHeight = imageFileHeight;
	}


	/**
	 * イメージ画像幅
	 */	
	public int getImageFileWidth() {
		return this.imageFileWidth;
	}
	public void setImageFileWidth(int imageFileWidth) {
		this.imageFileWidth = imageFileWidth;
	}
	
}
