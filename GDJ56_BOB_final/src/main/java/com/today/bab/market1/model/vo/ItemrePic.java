package com.today.bab.market1.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ItemrePic {
	private int irpicNo;
	private int reNo;
	private String picName;
	private ItemReview itemreivew;
}
