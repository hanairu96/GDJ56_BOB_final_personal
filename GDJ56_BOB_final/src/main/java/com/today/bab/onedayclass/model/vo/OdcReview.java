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
	private int odcNo;
	private String oreContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date oreDate;
	private String memberId;
	private String oreGood;
	private String oreSame;
	private String orePic;

}
