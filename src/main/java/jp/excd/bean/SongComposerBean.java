package jp.excd.bean;

public class SongComposerBean {

	String songId; // 曲ID
	String title; // 曲名
	String uniqueCode; // ユニーク名(作曲家)
	String nickname; // ニックネーム(作曲家)
	String ratingTotalFormated; // 総感動指数(カンマ編集済み)
	String ratingAverageFormated; // 平均感動指数(四捨五入編集済み)
	String totalListenCountFormated; // 再生回数(カンマ編集済み)
	String releaseDatetimeFormated; // 公開時間(表記編集済み)
	String imageFileNameFormated; // イメージファイル名(path名含むよう編集済み)
	Double imageFileHeightFortmated; // イメージファイル画像高さ(編集済み)
	int imageFileWidthFormated; // イメージファイル画像幅(編集済み)
	Double imageFileHeightCutLength; // イメージファイル画像高さのはみ出し長さ

	
	/**
	 * 曲ID
	 * 	 */	
	public String getSongId() {
		return this.songId;
	}
	public void setSongId(String songId) {
		this.songId = songId;
	}

	
	/**
	 * 曲名
	 * 	 */		
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	/**
	 * ユニーク名(作曲家)
	 * 	 */	
	public String getUniqueCode() {
		return this.uniqueCode;
	}
	public void setUniqueCode(String uniqueCode) {
		this.uniqueCode = uniqueCode;
	}

	
	/**
	 * ニックネーム(作曲家)
	 * 	 */	
	public String getNickname() {
		return this.nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	/**
	 * 総感動指数(カンマ編集済み)
	 * 	 */	
	public String getRatingTotalFormated() {
		return this.ratingTotalFormated;
	}
	public void setRatingTotalFormated(String ratingTotalFormated) {
		this.ratingTotalFormated = ratingTotalFormated;
	}
	
	
	/**
	 * 平均感動指数(四捨五入編集済み)
	 * 	 */	
	public String getRatingAverageFormated() {
		return this.ratingAverageFormated;
	}
	public void setRatingAverageFormated(String ratingAverageFormated) {
		this.ratingAverageFormated = ratingAverageFormated;
	}
	
	
	/**
	 * 再生回数(カンマ編集済み)
	 * 	 */	
	public String getTotalListenCountFormated() {
		return this.totalListenCountFormated;
	}
	public void setTotalListenCountFormated(String totalListenCountFormated) {
		this.totalListenCountFormated = totalListenCountFormated;
	}
	
	
	/**
	 * 公開時間(表記編集済み)
	 * 	 */	
	public String getReleaseDatetimeFormated() {
		return this.releaseDatetimeFormated;
	}
	public void setReleaseDatetimeFormated(String releaseDatetimeFormated) {
		this.releaseDatetimeFormated = releaseDatetimeFormated;
	}
	
	
	/**
	 * イメージファイル名(path名含むよう編集済み)
	 * 	 */	
	public String getImageFileNameFormated() {
		return this.imageFileNameFormated;
	}
	public void setImageFileNameFormated(String imageFileNameFormated) {
		this.imageFileNameFormated = imageFileNameFormated;
	}
	
	
	/**
	 * イメージファイル画像高さ(編集済み)
	 * 	 */	
	public Double getImageFileHeightFortmated() {
		return this.imageFileHeightFortmated;
	}
	public void setImageFileHeightFortmated(Double imageFileHeightFortmated) {
		this.imageFileHeightFortmated = imageFileHeightFortmated;
	}
	
	
	/**
	 * イメージファイル画像幅(編集済み)
	 * 	 */	
	public int getImageFileWidthFormated() {
		return this.imageFileWidthFormated;
	}
	public void setImageFileWidthFormated(int imageFileWidthFormated) {
		this.imageFileWidthFormated = imageFileWidthFormated;
	}

	
	/**
	 * イメージファイル画像高さのはみ出し長さ
	 * 	 */		
	public Double getImageFileHeightCutLength() {
		return this.imageFileHeightCutLength;
	}
	public void setImageFileHeightCutLength(Double imageFileHeightCutLength) {
		this.imageFileHeightCutLength = imageFileHeightCutLength;
	}
}
