package com.today.bab.market2.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SellItem {
	private int itemNo;
	private String itemBrand;
	private String itemName;
	private int itemPrice;
	private int delPrice;
	private String madeIn;
	private String weight;
	private String mainPic;
	private String mainContent;
	private String itemContent;
	private String itemPoint;
	private String itemKeep;
	private String itemTip;
	private String itemLabel;
	private String itemDiscount;
	private String itemCategory;
	private String itemStock;
	private Date itemEnroll;
	private List<ItemPic> ipic;
	
	private int sellitem_count;
}