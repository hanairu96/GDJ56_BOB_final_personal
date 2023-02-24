package com.today.bab.onedayclass.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OdcQaRe {

	private int oqrNo;
	private int oqno;
	private String oqrContetnt;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date oqrEnrollDate;
	private String memberId;
	
}
