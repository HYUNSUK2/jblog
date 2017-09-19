package com.bigdata2017.jblog.exception;

public class UserDaoException extends RuntimeException {
	private static final long serialVersionUID = 75687482485855900L;
	
	public UserDaoException(){
		super( "UserDao Exception" );
	}
	
	public UserDaoException( String message ){
		super( message );
	}
}
