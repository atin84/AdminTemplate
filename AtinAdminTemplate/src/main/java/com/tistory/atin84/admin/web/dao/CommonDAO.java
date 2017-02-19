package com.tistory.atin84.admin.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {

	private final SqlSession sqlSession;
	
	public static final String GRID = "grid_";
	
	public static final String COUNT = "count_";
	
	public CommonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Map<String, Object>> selectGridList(String sqlName, Map<String, Object> param) {
		return sqlSession.selectList(GRID + sqlName, param);
	}
	
	public Long count(String sqlName, Map<String, Object> param) {
		return sqlSession.selectOne(COUNT + sqlName, param);
	}
	
}
