package com.today.bab.market2.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TodayBob {
	private int reNo;
	private String reTitle;
	private String reContent;
	private String reIcon;
}
