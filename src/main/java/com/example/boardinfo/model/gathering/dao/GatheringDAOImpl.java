package com.example.boardinfo.model.gathering.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.boardinfo.model.gathering.dto.GatheringDTO;


@Repository
public class GatheringDAOImpl implements GatheringDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int addPost(GatheringDTO dto) {
		return sqlSession.insert("gathering.addPost",dto);
	}

	@Override
	public int deletePost() {
		return 0;
	}

	@Override
	public int editPost() {
		return 0;
	}

	@Override
	public List<GatheringDTO> list() {
		return null;
	}

}
