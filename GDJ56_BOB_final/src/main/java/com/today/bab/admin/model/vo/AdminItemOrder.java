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
public class AdminItemOrder {
		private int orderNo;
		private String memberId;
		private int price;
		private Date sellDate;
		private String delivery;
		private String refund;
		private String address;
		private String orderName;
		private String orderPhone;
		private String refundFix;
		private String orderComment;
		private String merchantUid;
		private Date refundDate;
		private int pointUse;
		private String refundMsg;
}
