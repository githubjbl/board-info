package com.example.boardinfo.model.game.dao.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.boardinfo.model.game.dto.category.CategoryDTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

  @Inject
  SqlSession sqlSession;

  @Override
  public int check_category(String category) {
    int result = sqlSession.selectOne("category.check", category);
    return result;
  }

  @Override
  public void insert_category(String category, String userid) {
    Map<String, Object> map = new HashMap<>();
    map.put("category",category);
    map.put("userid",userid);
    sqlSession.insert("category.insert", map);
  }

  @Override
  public void insert_category_mapping() {
    sqlSession.insert("category.insertmapping");
  }

  @Override
  public void insert_category_mapping(int cnum) {
    sqlSession.insert("category.insertmapping_cnum", cnum);
  }

  public List<CategoryDTO> list() {
    return sqlSession.selectList("category.list");
  }

  public List<CategoryDTO> view(int gnum) { return  sqlSession.selectList("category.view", gnum); }

  public int check_category(String category, int gnum) {
    Map<String, Object> map = new HashMap<>();
    map.put("category", category);
    map.put("gnum",gnum);
    return sqlSession.selectOne("category.updatecheck", map);
  }

  public void insert_category_mapping(int gnum, int cnum){
    Map<String, Object> map = new HashMap<>();
    map.put("cnum", cnum);
    map.put("gnum",gnum);
    sqlSession.insert("category.insertmapping_update", map);
  }

  public List<String> viewGamecategory(int gnum){
    return  sqlSession.selectList("category.viewGamecategory", gnum);
  }


  public void deleteGame_Category(String category, int gnum) {
    Map<String, Object> map = new HashMap<>();
    map.put("category", category);
    map.put("gnum",gnum);
    sqlSession.delete("category.deleteGame_Category", map);

  }

  @Override
  public List<CategoryDTO> confirmList(Map<String, Object> map) {
    return  sqlSession.selectList("category.confirmList", map);
  }
  @Override
  public void deleteitem(int num) {
    sqlSession.delete("category.deleteitem", num);
  }

  @Override
  public int game_list_categoryCount() {
    return sqlSession.selectOne("category.game_list_categoryCount");
  }

  @Override
  public List<CategoryDTO> game_list_category(Map<String, Object> map) {
    return sqlSession.selectList("category.game_list_category", map);
  }

  @Override
  public void update_category_mapping(int gnum) {
    Map<String, Object> map = new HashMap<>();
    map.put("gnum", gnum);
    int cnum = 0;
    map.put("cnum",cnum);
    sqlSession.insert("category.update_category_mapping", map);
  }

  @Override
  public void update_category_mapping(int gnum, int cnum) {
    Map<String, Object> map = new HashMap<>();
    map.put("gnum", gnum);
    map.put("cnum",cnum);
    sqlSession.delete("category.update_category_mapping", map);
  }
}