package com.withtrip.WithTrip.goods.model.vo;

import java.sql.Date;

public class Reply {
	private int replyId;	// 댓글번호
	private Date createDate;
	private String replyStatus;
	private String replyContent;
	private Date modifyDate;
	private String email;	// 작성자 이메일(아이디)
	private String nickName;// 닉네임
	private int goodsId;	// 참조게시글 번호
	private String goods_name;	// 용품 이름
	private String profileImg;
	private String manager_yn;
	
	public Reply() {}

	public Reply(int replyId, Date createDate, String replyStatus, String replyContent, Date modifyDate, String email,
			String nickName, int goodsId, String goods_name, String profileImg, String manager_yn) {
		super();
		this.replyId = replyId;
		this.createDate = createDate;
		this.replyStatus = replyStatus;
		this.replyContent = replyContent;
		this.modifyDate = modifyDate;
		this.email = email;
		this.nickName = nickName;
		this.goodsId = goodsId;
		this.goods_name = goods_name;
		this.profileImg = profileImg;
		this.manager_yn = manager_yn;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getManager_yn() {
		return manager_yn;
	}

	public void setManager_yn(String manager_yn) {
		this.manager_yn = manager_yn;
	}

	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", createDate=" + createDate + ", replyStatus=" + replyStatus
				+ ", replyContent=" + replyContent + ", modifyDate=" + modifyDate + ", email=" + email + ", nickName="
				+ nickName + ", goodsId=" + goodsId + ", goods_name=" + goods_name + ", profileImg=" + profileImg
				+ ", manager_yn=" + manager_yn + "]";
	}

	
}
