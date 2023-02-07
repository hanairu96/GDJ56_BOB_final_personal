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

public class ClientQaMypage {
	private int cqNo;
	private String cqCate;
	private String cqTitle;
	private String cqContent;
	private Date cqDate;
	private String cqCheck;
	private String memberId;
	private String cqSe;
}
