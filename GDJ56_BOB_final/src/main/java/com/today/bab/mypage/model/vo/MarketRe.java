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

public class MarketRe {
	private int iqaNo;
	private int qnaNo;
	private String iqaContent;
	private Date iqaWriteDate;
}
