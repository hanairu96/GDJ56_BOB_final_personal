package com.today.bab.market1.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ItemReview {
	private int reNo;
	private String memberId;
	private int itemNo;
	private String iqrContent;
	private Date iqrDate;
	private int iqrStar;
	private List<ItemrePic> repic;
}
