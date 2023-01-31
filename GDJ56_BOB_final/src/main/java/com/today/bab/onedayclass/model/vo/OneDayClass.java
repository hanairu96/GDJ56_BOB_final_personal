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
public class OneDayClass {
	private int odcNo;
	private String odcClassName;
	private String odcCookName;
	private Date odcStartDate;
	private Date odcEndDate;
	private String odcTime;
	private int odcPeople;
	private String odcCity;
	private String odcAdd;
	private int odcPrice;
	private String odcMainPic;
	private String odcContent;
	private Date odcEnrollDate;
	private String odcCategoty;
	private String memberId;
	private String odcStartTime;
	private String mastserName;
}
