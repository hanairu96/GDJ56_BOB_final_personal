package com.today.bab.mypage.model.vo;

import java.util.Date;

import com.today.bab.market2.model.vo.SellItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ItemOrder {
	private int orderNo;
	private String memberId;
	private int price;
	private Date sellDate;
	private String delivery;
	private String refund;
	private String address;
	private String orderName;
	private String orderPhone;
	private String refund_fix;
	
}
