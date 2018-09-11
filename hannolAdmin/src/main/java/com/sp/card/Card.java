package com.sp.card;
 
import org.springframework.web.multipart.MultipartFile;

public class Card {
	private int cardCode;
	private String cardName;
	private String startDate;
	private String endDate;
	private String memo;
	private String cardCo;
	private int discount;
	private String saveFilename;
	private String originalFilename;
	private String logoSaveFilename;
	private String logoOriginalFilename;
	private MultipartFile cardupload;
	private MultipartFile logoupload;
	

	public MultipartFile getCardupload() {
		return cardupload;
	}

	public void setCardupload(MultipartFile cardupload) {
		this.cardupload = cardupload;
	}

	public MultipartFile getLogoupload() {
		return logoupload;
	}

	public void setLogoupload(MultipartFile logoupload) {
		this.logoupload = logoupload;
	}

	public int getCardCode() {
		return cardCode;
	}

	public void setCardCode(int cardCode) {
		this.cardCode = cardCode;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCardCo() {
		return cardCo;
	}

	public void setCardCo(String cardCo) {
		this.cardCo = cardCo;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getLogoSaveFilename() {
		return logoSaveFilename;
	}

	public void setLogoSaveFilename(String logoSaveFilename) {
		this.logoSaveFilename = logoSaveFilename;
	}

	public String getLogoOriginalFilename() {
		return logoOriginalFilename;
	}

	public void setLogoOriginalFilename(String logoOriginalFilename) {
		this.logoOriginalFilename = logoOriginalFilename;
	}

}
