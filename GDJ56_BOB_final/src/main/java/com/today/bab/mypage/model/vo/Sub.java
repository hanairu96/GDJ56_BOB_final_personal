package com.today.bab.mypage.model.vo;

import java.util.Date;

import com.today.bab.sub.model.vo.SubItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Sub {
	private int subNo;
	private String memberId;
	private SubItem subitems;
	private Date subDate;
}
