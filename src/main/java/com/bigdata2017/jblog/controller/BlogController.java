package com.bigdata2017.jblog.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bigdata2017.jblog.vo.UserVo;
import com.bigdata2017.security.Auth;
import com.bigdata2017.security.AuthUser;

@Controller
@RequestMapping( "/{id:(?!assets).*}" )
public class BlogController {
	
	//@Autowired
	//private BlogService blogService;
	
	@RequestMapping( {"", "/{pathNo1}", "/{pathNo1}/{pathNo2}" } )
	public String index( 
		@PathVariable String id,
		@PathVariable Optional<Long> pathNo1,
		@PathVariable Optional<Long> pathNo2,
		ModelMap modelMap ) {

		Long categoryNo = 0L;
		Long postNo = 0L;
		
		if( pathNo2.isPresent() ) {
			postNo = pathNo2.get();
			categoryNo = pathNo1.get();
		} else if( pathNo1.isPresent() ){
			postNo = pathNo1.get();
		}
		
		//modelMap.putAll( blogService.getAll( id, categoryNo, postNo ) );
		return "blog/index";
	}
	
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping( { "/admin", "/admin/basic" } )
	public String adminBasic( 
		@AuthUser UserVo authUser, 
		@PathVariable String id,
		ModelMap modelMap ) {
		if( authUser == null || authUser.getId().equals( id ) == false ) {
			return "redirect:/" + authUser.getId(); 
		}

		//modelMap.putAll( blogService.getAll( id, 0L, 0L) );
		return "blog/admin/basic";
	}
	
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping( "/admin/category" )
	public String adminCategory(
		@AuthUser UserVo authUser,
		@PathVariable String id,
		ModelMap modelMap ) {
		if( authUser == null || authUser.getId().equals( id ) == false ) {
			return "redirect:/" + authUser.getId(); 
		}
		
		//modelMap.putAll( blogService.getAll( id, 0L, 0L) );
		return "blog/admin/category";
	}	
}