package jp.excd.servlet;

public class ComposerRecord_s{
	String id;
	String unique_code;
	String nickname;
	String date;
	String gender;
	String birthday;
	String listener;
	String language;

	//id
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	//unique_code
	public void setUnique_code(String unique_code) {
		this.unique_code = unique_code;
	}
	public String getUnique_code() {
		return unique_code;
	}
	//nickname
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getNickname() {
		return nickname;
	}
	//unique_code
	public void setDate(String date) {
		this.date = date;
	}
	public String getDate() {
		return date;
	}
	//id
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGender() {
		return gender;
	}
	//unique_code
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getBirthday() {
		return birthday;
	}
	//listener
	public void setListener(String listener) {
		this.listener = listener;
	}
	public String getListener() {
		return listener;
	}
	//language
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLanguage() {
		return language;
	}
}

