package com.today.bab.onedayclass.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OdcQa {
	
	private int oqno;
	private String oqContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date oqEnrollDate;
	private String oqSecretYn;
	private int odcNo;
	private String memberId;
	
	private String nickname;
	
}
