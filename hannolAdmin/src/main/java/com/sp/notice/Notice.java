package com.sp.notice;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private long usersCode;
	private int noticeCode;
	private String subject;
	private String content;
	private String created;
	private String name;
	private int isNotice;
	
	private String originalFilename;
	private String saveFilename;
	private MultipartFile upload;


	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIsNotice() {
		return isNotice;
	}

	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
	}

	private int listNum;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public long getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

}
