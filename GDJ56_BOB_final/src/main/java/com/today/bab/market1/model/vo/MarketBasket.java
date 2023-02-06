package com.today.bab.market1.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MarketBasket {
	private int basketNo;
	private String memberId;
	private int itemNo;
	private int itemCount;
}
