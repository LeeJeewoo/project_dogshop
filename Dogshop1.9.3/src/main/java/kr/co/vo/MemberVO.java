package kr.co.vo;

import java.util.Date;

public class MemberVO {
	
	private String userId;
	private String userPass;
	private String userName;
	private Date regDate;
	private String userGen;
	private String userTel;
	private String userMail;
	private String userOaddress;
	private String userAddress;
	private String userDateaddress;
	private String userBirth;
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserOaddress() {
		return userOaddress;
	}

	public void setUserOaddress(String userOaddress) {
		this.userOaddress = userOaddress;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserDateaddress() {
		return userDateaddress;
	}

	public void setUserDateaddress(String userDateaddress) {
		this.userDateaddress = userDateaddress;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", regDate="
				+ regDate + ", userGen=" + userGen + ", userTel=" + userTel + ", userMail=" + userMail + ", userAddress=" + userAddress + ", userBirth="
				+ userBirth + "]";
	}
	
	
	
}
