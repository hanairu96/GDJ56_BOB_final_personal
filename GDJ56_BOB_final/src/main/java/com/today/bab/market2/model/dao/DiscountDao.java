package com.today.bab.market2.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market2.model.vo.Item;

public interface DiscountDao {
	
	List<Item> discountItemAll(SqlSessionTemplate session);

}
