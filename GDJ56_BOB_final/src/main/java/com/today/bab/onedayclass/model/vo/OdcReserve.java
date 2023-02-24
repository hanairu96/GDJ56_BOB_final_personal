package com.today.bab.onedayclass.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OdcReserve {

	private String memberId;
	private int odcreNo;
	private int odcNo;
	private Date odcDate;
	private Date odcEnrollDate;
	private String odcClassName;
	private int odcPrice;
	private String master;
	private String odcPic;
	
	
}
