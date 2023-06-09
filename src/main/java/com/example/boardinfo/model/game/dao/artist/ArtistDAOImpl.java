package com.example.boardinfo.model.game.dao.artist;

import java.sql.ClientInfoStatus;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.boardinfo.model.game.dto.artist.ArtistDTO;

@Repository
public class ArtistDAOImpl implements ArtistDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int check_artist(String artist) {
		int result = sqlSession.selectOne("artist.check", artist);
		return result;
	}
	
	@Override
	public void insert_artist(String artist, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("artist",artist);
		map.put("userid",userid);
		sqlSession.insert("artist.insert", map);
	}
	
	@Override
	public void insert_artist_mapping() {
		sqlSession.insert("artist.insertmapping");
	}
	
	@Override
	public void insert_artist_mapping(int anum) {
		sqlSession.insert("artist.insertmapping_anum",anum);
	}
	
	public List<ArtistDTO> getAutoArtist(String input){
	    return sqlSession.selectList("artist.getAuto", input);
	}

	public List<ArtistDTO> view(int gnum){
		return sqlSession.selectList("artist.view", gnum);
	}

	public int check_artist(String artist, int gnum){
		Map<String, Object> map = new HashMap<>();
		map.put("artist", artist);
		map.put("gnum",gnum);
		return sqlSession.selectOne("artist.updatecheck", map);
	}

	public void insert_artist_mapping(int gnum,int anum){
		Map<String, Object> map = new HashMap<>();
		map.put("anum", anum);
		map.put("gnum",gnum);
		sqlSession.insert("artist.insertmapping_update", map);
	}

	public List<String> viewArtist(int gnum){
		return sqlSession.selectList("artist.viewArtist", gnum);
	}

	@Override
	public void deleteGame_Artist(String value, int gnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("artist", value);
		map.put("gnum",gnum);
		sqlSession.delete("artist.deleteGame_Artist", map);
	}

	@Override
	public List<ArtistDTO> totalSearch(Map<String, Object> map) {
		return sqlSession.selectList("artist.totalSearch", map);
	}

	@Override
	public int totalSearchCount(Map<String, Object> map) {
		return sqlSession.selectOne("artist.totalSearchCount", map);
	}

	@Override
	public List<ArtistDTO> confirmList(Map<String, Object> map) {
		return sqlSession.selectList("artist.confirmList", map);
	}

	@Override
	public void deleteitem(int num) {
		sqlSession.delete("artist.deleteitem", num);
	}

	@Override
	public void update_artist_mapping(int gnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("gnum", gnum);
		int anum = 0;
		map.put("anum",anum);
		sqlSession.insert("artist.update_artist_mapping", map);
	}

	@Override
	public void update_artist_mapping(int gnum, int anum) {
		Map<String, Object> map = new HashMap<>();
		map.put("gnum", gnum);
		map.put("anum",anum);
		sqlSession.delete("artist.update_artist_mapping", map);
	}
}
