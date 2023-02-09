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

public class MypageQnaAll {
	private String cate;
	private int iqNo;
	private String iqContent;
	private Date iqDate;
	private int itemNo;
	private String memberId;
	private String name;
}
