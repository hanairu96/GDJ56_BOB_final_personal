package com.today.bab.market1.model.vo;

import java.util.Date;

import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class IqAnswer {
	private int iqaNo;
//	private ItemQna itemNo;
	private int itemNo;
	private String IqaContent;
	private Date iqaDate;
}
