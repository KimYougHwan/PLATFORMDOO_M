package co.kr.doosam.board.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class HmcBoard implements Serializable {
	
	private static final long serialVersionUID = 4931474486972057522L;


	public HmcBoard(){}
	
	private int oid;
		
	private String boardType;
	private String BoardNumber;
	private String title;
	private String 	comm;
	private String	userId;
	private String 	createUser;
	private Date   	createDate;
	private String 	modifyUser;
	private Date   	modifyDate;
	private MultipartFile uploadFile;

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardNumber() {
		return BoardNumber;
	}

	public void setBoardNumber(String boardNumber) {
		BoardNumber = boardNumber;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

}
