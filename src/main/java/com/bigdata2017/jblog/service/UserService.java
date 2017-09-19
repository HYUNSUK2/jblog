package com.bigdata2017.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigdata2017.jblog.exception.UserServiceException;
import com.bigdata2017.jblog.repository.BlogDao;
import com.bigdata2017.jblog.repository.CategoryDao;
import com.bigdata2017.jblog.repository.UserDao;
import com.bigdata2017.jblog.vo.BlogVo;
import com.bigdata2017.jblog.vo.CategoryVo;
import com.bigdata2017.jblog.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private CategoryDao categoryDao;	
	
	public void join( UserVo userVo ) throws UserServiceException {
		boolean result = false;
		
		//1. 회원정보 저장
		result = userDao.insert( userVo ) == 1;
		if( result == false ) {
			throw new UserServiceException( "fail to save user's singup information" );
		}
		
		//2. 블로그 생성
		BlogVo blogVo = new BlogVo();
		blogVo.setId(userVo.getId());
		blogVo.setTitle( userVo.getName() + "의 jblog" );
		blogVo.setLogo( "default-logo.jpg" );
		
		result = blogDao.insert( blogVo ) == 1;
		if( result == false ) {
			throw new UserServiceException( "fail to create user's blog" );
		}
		
		//3. 기본 카테고리 등록
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setName( "미분류" );
		categoryVo.setId(userVo.getId());
		categoryVo.setDescription( "" );
		result = categoryDao.insert( categoryVo ) == 1;
		if( result == false ) {
			throw new UserServiceException( "fail to register default category of blog" );
		}
	}
	
	public UserVo getUser(UserVo userVo) {
		return userDao.get(userVo);
	}
	
	
	public boolean idExists( String id ){
		return userDao.get( id ) != null;
	}
}