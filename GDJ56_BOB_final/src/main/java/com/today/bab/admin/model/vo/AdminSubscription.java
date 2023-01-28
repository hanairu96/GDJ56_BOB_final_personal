package com.today.bab.admin.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminSubscription {
	private int subNo;
	private String memberId;
	private AdminSubItem subItem;
}
