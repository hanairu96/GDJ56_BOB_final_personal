package com.today.bab.mypage.model.vo;

import com.today.bab.market2.model.vo.SellItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ItemDetail {
	private int detailNo;
	private int orderNo;
	private int itemNo;
	private int count;
	private String saleInfo;
}
