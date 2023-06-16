package jp.excd.bean;

public class ComposerRecordY {


	private String unique_code;
	private String nickname;
	private String message;
	private String gender;
	private String birthday;
	private String fb_link;
	private String tw_link;
	private String joined_date;
	private int ID;
	private String title;
	private String image_file_name;
	private String rating_total;
	private double rating_average;
	private String other_link_url;
	private String other_link_description;
	private String total_listen_count;
	private String release_datetime;

	//return unique_code
	public String getUnique_code(){
		return unique_code;
	}

	//unique_codeをセットする
	public void setUnique_code(String unique_code) {
		this.unique_code = unique_code;
	}

	//return message
	public String getMessage(){
		return message;
	}

	//messageをセットする
	public void setMessage(String message) {
		this.message = message;
	}

	//return nickname
	public String getNickname(){
		return nickname;
	}

	//nicknameをセットする
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	//return gender
	public String getGender(){
		return gender;
	}

	//genderをセットする
	public void setGender(String gender) {
		this.gender = gender;
	}

	//return birthday
	public String getBirthday(){
		return birthday;
	}

	//birthdayをセットする
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	//return fb_link
	public String getFb_link(){
		return fb_link;
	}

	//fb_linkをセットする
	public void setFb_link(String fb_link) {
		this.fb_link = fb_link;
	}

	//return tw_link
	public String getTw_link(){
		return tw_link;
	}

	//tw_linkをセットする
	public void setTw_link(String tw_link) {
		this.tw_link = tw_link;
	}

	//return joined_date
	public String getJoined_date(){
		return joined_date;
	}

	//joined_dateをセットする
	public void setJoined_date(String joined_date) {
		this.joined_date = joined_date;
	}

	//return ID
	public int getID(){
		return ID;
	}

	//IDをセットする
	public void setID(int ID) {
		this.ID = ID;
	}

	//return title
	public String getTitle(){
		return title;
	}

	//titleをセットする
	public void setTitle(String title) {
		this.title = title;
	}

	//return image_file_name
	public String getImage_file_name(){
		return image_file_name;
	}

	//image_file_nameをセットする
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}

	//return rating_total
	public String getRating_total(){
		return rating_total;
	}

	//rating_totalをセットする
	public void setRating_total(String rating_total) {
		this.rating_total = rating_total;
	}

	//return rating_average
	public double getRating_average(){
		return rating_average;
	}

	//rating_averageをセットする
	public void setRating_average(double rating_average) {
		this.rating_average = rating_average;
	}

	//return other_link_url
	public String getOther_link_url(){
		return other_link_url;
	}

	//other_link_urlをセットする
	public void setOther_link_url(String other_link_url) {
		this.other_link_url = other_link_url;
	}

	//return other_link_description
	public String getOther_link_description(){
		return other_link_description;
	}

	//other_link_descriptionをセットする
	public void setOther_link_description(String other_link_description) {
		this.other_link_description = other_link_description;
	}

	//return total_listen_count
	public String getTotal_listen_count(){
		return total_listen_count;
	}

	//total_listen_countをセットする
	public void setTotal_listen_count(String total_listen_count) {
		this.total_listen_count = total_listen_count;
	}

	//return release_datetime
	public String getRelease_datetime(){
		return release_datetime;
	}

	//release_datetimeをセットする
	public void setRelease_datetime(String release_datetime) {
		this.release_datetime = release_datetime;
	}
}
