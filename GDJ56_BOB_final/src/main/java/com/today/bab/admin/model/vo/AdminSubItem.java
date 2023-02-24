package com.today.bab.admin.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminSubItem {
	private String subName;
	private String subKind;
	private int subPrice;
}
