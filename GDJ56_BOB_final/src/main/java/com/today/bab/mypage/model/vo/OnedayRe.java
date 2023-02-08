package com.today.bab.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class OnedayRe {
	private int oqrNo;
	private int oqNo;
	private String oqrContent;
	private Date oqrWriteDate;
}
