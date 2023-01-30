package com.today.bab.onedayclass.model.vo;

import java.sql.Date;

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
	private Date oqEnrollDate;
	private String oqSecretYn;
	private int odcNo;
	private String memberId;
	
}
