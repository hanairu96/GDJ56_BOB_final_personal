package com.today.bab.sub.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

//@Mapper("subMapper")
public interface SubDao {
	//@Insert("INSERT INTO VALUES(SEQ_SUBSCRIPTION.NEXTVAL, #{id}, #{choice})")
	int insertSub(SqlSessionTemplate session, Map<String, Object> param);

}
