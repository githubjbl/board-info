package com.example.boardinfo.model.review.dao;

import com.example.boardinfo.model.review.dto.ReviewDTO;
import com.example.boardinfo.model.review.dto.TestDTO;

import java.util.List;

public interface ReviewDAO {

	// 리뷰 테이블
	public List<ReviewDTO> reviewlist();

	// 리뷰 입력
	public void create(ReviewDTO reviewDTO);


	/*// 리뷰 입력 테스트
	public void create(TestDTO testdto);*/


/*

	// 댓글 및 답글 테이블
	public List<ReplyCommentsDTO> replycommentslist();

	// 선택된 게임 테이블
	public List<ChoiceGameDTO> choicegamelist();
*/

}
