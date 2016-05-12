package co.kr.doosam.member.vo;

import java.util.Date;

public class Member { 
	
		private String	userId;
		private String 	userPw;
		private String 	userName;
		private String 	userLevelCd;
		private String 	userNationCd;
		private String 	userPhoneNumber;
		private String 	userMobilePhoneNumber;
		private String 	userFaxNumber;
		private String 	userMailAddress;
		private String 	createUser;
		private Date   	createDate;
		private String 	modifyUser;
		private Date   	modifyDate;
		private Date   	invalCnt;
		private Date    loginDate;
		
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserPw() {
			return userPw;
		}
		public void setUserPw(String userPw) {
			this.userPw = userPw;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserLevelCd() {
			return userLevelCd;
		}
		public void setUserLevelCd(String userLevelCd) {
			this.userLevelCd = userLevelCd;
		}
		public String getUserNationCd() {
			return userNationCd;
		}
		public void setUserNationCd(String userNationCd) {
			this.userNationCd = userNationCd;
		}
		public String getUserPhoneNumber() {
			return userPhoneNumber;
		}
		public void setUserPhoneNumber(String userPhoneNumber) {
			this.userPhoneNumber = userPhoneNumber;
		}
		public String getUserMobilePhoneNumber() {
			return userMobilePhoneNumber;
		}
		public void setUserMobilePhoneNumber(String userMobilePhoneNumber) {
			this.userMobilePhoneNumber = userMobilePhoneNumber;
		}
		public String getUserFaxNumber() {
			return userFaxNumber;
		}
		public void setUserFaxNumber(String userFaxNumber) {
			this.userFaxNumber = userFaxNumber;
		}
		public String getUserMailAddress() {
			return userMailAddress;
		}
		public void setUserMailAddress(String userMailAddress) {
			this.userMailAddress = userMailAddress;
		}
		public String getCreateUser() {
			return createUser;
		}
		public void setCreateUser(String createUser) {
			this.createUser = createUser;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public String getModifyUser() {
			return modifyUser;
		}
		public void setModifyUser(String modifyUser) {
			this.modifyUser = modifyUser;
		}
		public Date getModifyDate() {
			return modifyDate;
		}
		public void setModifyDate(Date modifyDate) {
			this.modifyDate = modifyDate;
		}
		public Date getInvalCnt() {
			return invalCnt;
		}
		public void setInvalCnt(Date invalCnt) {
			this.invalCnt = invalCnt;
		}
		public Date getLoginDate() {
			return loginDate;
		}
		public void setLoginDate(Date loginDate) {
			this.loginDate = loginDate;
		}
		@Override
		public String toString() {
			return "HmcMember [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userLevelCd="
					+ userLevelCd + ", userNationCd=" + userNationCd + ", userPhoneNumber=" + userPhoneNumber
					+ ", userMobilePhoneNumber=" + userMobilePhoneNumber + ", userFaxNumber=" + userFaxNumber
					+ ", userMailAddress=" + userMailAddress + ", createUser=" + createUser + ", createDate=" + createDate
					+ ", modifyUser=" + modifyUser + ", modifyDate=" + modifyDate + ",invalCnt="+invalCnt+",loginDate="+loginDate+"]";
		}
		

	}
