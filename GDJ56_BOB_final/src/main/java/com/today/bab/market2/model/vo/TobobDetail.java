package com.today.bab.market2.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TobobDetail {
	private int rbNo;
//	private int itemNo;
//	private int reNo;
	private SellItem itemNo;
	private TodayBob reNo;
}
