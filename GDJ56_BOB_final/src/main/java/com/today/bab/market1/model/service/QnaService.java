package com.today.bab.market1.model.service;

import java.util.List;

import com.today.bab.market1.model.vo.IqAnswer;
import com.today.bab.market1.model.vo.ItemQna;

public interface QnaService {
	//문의 작성
	int insertQna(ItemQna q);
	//상품 문의 출력 
	List<ItemQna> selectQnaList(int itemNo);
	//문의 삭제
	int delectQna(int iqNo);
	//상품 문의 답변
	int qnaAnswerAdmin(IqAnswer iq);
	
	List<IqAnswer> selectIqAnswer(int itemNo);

	int deleteQnaAnswer(int iqaNo);
}
