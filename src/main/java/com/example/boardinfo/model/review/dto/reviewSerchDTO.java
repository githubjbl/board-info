package com.example.boardinfo.model.review.dto;

public class reviewSerchDTO {

	private String searchTitle;			// 제목 및 내용 검색
	private String reviewDetailKey;		// regNum 키 값


	public String getSearchTitle() {
		return searchTitle;
	}

	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}

	public String getReviewDetailKey() {
		return reviewDetailKey;
	}

	public void setReviewDetailKey(String reviewDetailKey) {
		this.reviewDetailKey = reviewDetailKey;
	}

}