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
public class MarketMemberLike {
	private String memberId;
	private String fruit;
	private String sea;
	private String meat;
	private String side;
	private String vege;
}
