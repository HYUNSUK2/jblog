package com.bigdata2017.jblog.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bigdata2017.jblog.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo get( UserVo userVo ){
		return sqlSession.selectOne( "user.getByIdAndPassword", userVo );
	}
	
	public UserVo get( String id ) {
		return sqlSession.selectOne( "user.getById", id );
	}
	
	public int insert( UserVo userVo ) {
		return sqlSession.insert( "user.insert" , userVo );
	}
}