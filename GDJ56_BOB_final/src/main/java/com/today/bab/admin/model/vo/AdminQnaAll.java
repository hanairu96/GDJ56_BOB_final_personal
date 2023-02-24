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
public class AdminQnaAll {
	private String cate;
	private int iqNo;
	private String iqContent;
	private Date iqDate;
	private String memberId;
	private int itemNo;
	private String iqSecret;
	private String itemName;
}
