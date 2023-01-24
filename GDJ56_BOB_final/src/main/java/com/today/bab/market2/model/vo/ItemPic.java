package com.today.bab.market2.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ItemPic {
	
	private int picNo;
	private SellItem selItem;
	private String picName;
}
