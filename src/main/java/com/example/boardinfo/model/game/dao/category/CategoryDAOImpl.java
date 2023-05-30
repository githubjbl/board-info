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
  public void insert_category(String category) {
    sqlSession.insert("category.insert", category);
  }

  @Override
  public void insert_category_mapping() {
    sqlSession.insert("category.insertmapping");
  }

  @Override
  public int categorynum(String category) {
    return sqlSession.selectOne("category.category_num", category);
  }

  @Override
  public void insert_category_mapping(int cnum) {
    sqlSession.insert("category.insertmapping_cnum", cnum);
  }

  public List<CategoryDTO> list() {
    return sqlSession.selectList("category.list");
  }

  public List<CategoryDTO> view(int gnum) { return  sqlSession.selectList("category.view", gnum); }

  public int check_category(String gamecategory, int gnum) {
    Map<String, Object> map = new HashMap<>();
    map.put("gamecategory", gamecategory);
    map.put("gnum",gnum);
    return sqlSession.selectOne("category.updatecheck", map);
  }

  public void insert_category_mapping(int gnum, int cnum){
    Map<String, Object> map = new HashMap<>();
    map.put("cnum", cnum);
    map.put("gnum",gnum);
    sqlSession.insert("category.insertmapping_update", map);
  }
}
