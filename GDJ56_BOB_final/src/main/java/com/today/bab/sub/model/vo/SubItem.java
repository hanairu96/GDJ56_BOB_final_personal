package com.today.bab.sub.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubItem {
	private String subName;
	private String subKind;
	private int subPrice;
}
