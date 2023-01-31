package com.today.bab.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CqAnswer {
	private int cqaNo;
	private String cqaContent;
	private Date cqaDate;
	private int qnaNo;
}
