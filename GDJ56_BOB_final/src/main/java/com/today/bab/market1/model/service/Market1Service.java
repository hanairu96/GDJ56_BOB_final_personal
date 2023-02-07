package com.today.bab.market1.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.market1.model.vo.MarketMemberLike;
import com.today.bab.market2.model.vo.SellItem;

public interface Market1Service {
	
	//카테고리 상품 조회
	List<SellItem> selectItemCtg(Map<String, Integer> param);

	//상품 상세조회
	SellItem marketdetail(int itemNo);

	//상품 등록
	int insertItem(SellItem s);

	//상픔 삭제
	int deleteItem(int itemNo);
	
	//마켓 메인
	List<SellItem> selectItemMarket();
	
	//상품 수정
	int updateMarketItem(SellItem s,int itemNo);
	
	//카테고리별출력
	//List<SellItem> selectCtgAjax(String itemCategory);
	
	//카페고리 처음 출력할때 페이징
	int selectItemCount();
	
	//마켓 메인에 회원가입할떄 받은 선호 음식 출력
	MarketMemberLike memberLike(String memberId);
	
	List<SellItem> selectMainLike(String like);
	
	//마켓 카테고리 ajax처리
	List<SellItem> searchItemSort(Map<String,Object> param);
	
}
