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
public class Point {
	private int pointNo;
	private int pointAdd;
	private Date pointDate;
	private String memberId;
	private String pointContent;
	private int pointChange;
}
