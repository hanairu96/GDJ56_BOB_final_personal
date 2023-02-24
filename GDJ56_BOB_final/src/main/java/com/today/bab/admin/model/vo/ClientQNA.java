package com.today.bab.admin.model.vo;

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
public class ClientQNA {
	private int cqNo;
	private String cqCate;
	private String cqTitle;
	private String cqContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date cqDate;
	private String cqCheck;
	private String memberId;
	private String cqSe;
	
	private CqAnswer cqanswer;
}
