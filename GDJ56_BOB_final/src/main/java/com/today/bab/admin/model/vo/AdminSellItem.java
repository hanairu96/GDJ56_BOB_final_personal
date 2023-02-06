package com.today.bab.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminSellItem {
	private int itemNo; //상품번호
	private String itemBrand; //브랜드명
	private String itemName; //제품명
	private int itemPrice; //가격
	private String madeIn; //원산지
	private String itemCategory; //카테고리
	private String itemStock; //재고량
	private Date itemEnroll; //등록일
	private String mainPic; //메인사진
}
