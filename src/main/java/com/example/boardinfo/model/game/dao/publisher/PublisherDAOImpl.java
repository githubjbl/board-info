package com.example.boardinfo.model.game.dao.publisher;

import javax.inject.Inject;

import com.example.boardinfo.model.game.dto.artist.ArtistDTO;
import com.example.boardinfo.model.game.dto.publisher.PublisherDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PublisherDAOImpl implements PublisherDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int check_publisher(String publisher) {
		int result = sqlSession.selectOne("publisher.check", publisher);
		return result;
	}
	
	@Override
	public void insert_publisher(String publisher, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("publisher",publisher);
		map.put("userid",userid);
		sqlSession.insert("publisher.insert", map);
	}
	
	@Override
	public void insert_publisher_mapping() {
		sqlSession.insert("publisher.insertmapping");
	}

	@Override
	public void insert_publisher_mapping(int pnum) {
		sqlSession.insert("publisher.insertmapping_pnum",pnum);
	}

	public List<PublisherDTO> getAutoPublisher(String input){
		return sqlSession.selectList("publisher.getAuto", input);
	}

	public List<PublisherDTO> view(int gnum) { return sqlSession.selectList("publisher.view", gnum); }

	public int check_publisher(String publisher, int gnum){
		Map<String, Object> map = new HashMap<>();
		map.put("publisher", publisher);
		map.put("gnum",gnum);
		return sqlSession.selectOne("publisher.updatecheck", map);
	}

	public void insert_publisher_mapping(int gnum, int pnum){
		Map<String, Object> map = new HashMap<>();
		map.put("pnum", pnum);
		map.put("gnum",gnum);
		sqlSession.insert("publisher.insertmapping_update", map);
	}

	@Override
	public List<String> viewPublisher(int gnum) {
		return sqlSession.selectList("publisher.viewPublisher", gnum);
	}

	@Override
	public void deleteGame_Publisher(String value, int gnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("publisher", value);
		map.put("gnum",gnum);
		sqlSession.delete("publisher.deleteGame_Publisher", map);
	}

	@Override
	public List<PublisherDTO> totalSearch(Map<String, Object> map) {
		return sqlSession.selectList("publisher.totalSearch", map);
	}

	@Override
	public int totalSearchCount(Map<String, Object> map) {
		return sqlSession.selectOne("publisher.totalSearchCount", map);
	}

	@Override
	public List<PublisherDTO> confirmList(Map<String, Object> map) {
		return sqlSession.selectList("publisher.confirmList", map);
	}
	@Override
	public void deleteitem(int num) {
		sqlSession.delete("publisher.deleteitem", num);
	}

	@Override
	public void update_publisher_mapping(int gnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("gnum", gnum);
		int pnum = 0;
		map.put("pnum",pnum);
		sqlSession.insert("publisher.update_publisher_mapping", map);
	}

	@Override
	public void update_publisher_mapping(int gnum, int pnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("gnum", gnum);
		map.put("pnum",pnum);
		sqlSession.delete("publisher.update_publisher_mapping", map);
	}
}
