package com.today.bab.mypage.model.vo;

import java.util.Date;
import java.util.List;

import com.today.bab.market2.model.vo.SellItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ItemOrderSellitem {
	private int detailNo;
	private int orderNo;
	private int count;
	private SellItem orderitem;
	private String saleInfo;
}
