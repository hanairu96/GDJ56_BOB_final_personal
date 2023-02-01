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
public class OdcReview {
	
	private int odcreNo;
	private int odc_no;
	private String ore_content;
	private Date ore_date;
	private String memberId;
	private String ore_good;
	private String ore_same;
	private String ore_pic;

}
