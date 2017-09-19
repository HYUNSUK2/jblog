package com.bigdata2017.jblog.exception;

public class UserServiceException extends RuntimeException {

	private static final long serialVersionUID = 4191768562769965265L;

	public UserServiceException(){
		super( "UserService Exception" );
	}
	
	public UserServiceException( String message ){
		super( message );
	}
}
