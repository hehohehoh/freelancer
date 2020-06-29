package com.spring.freelancer.board.kr.co.controller;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.extension.ExtendWith;

public class Test {

	@Inject
	private DataSource ds;
	 @Inject
	    private SqlSessionFactory sqlFactory;
	 
	@org.junit.jupiter.api.Test
	public void test() throws Exception {
		
		try(Connection conn = ds.getConnection()){
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}  
	@org.junit.Test
    public void factoryTest() {
        System.out.println(sqlFactory);
      
    }
	
	@org.junit.Test
    public void sessionTest() throws Exception{
      
        try(SqlSession session = sqlFactory.openSession()) {
            System.out.println(session);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
		
}
