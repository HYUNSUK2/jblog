package com.bigdata2017.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bigdata2017.jblog.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert( CategoryVo categoryVo ) {
		return sqlSession.insert( "category.insert" , categoryVo );
	}
	
	public List<CategoryVo> getList( String id ) {
		return sqlSession.selectList( "category.getList", id );
	}
}
