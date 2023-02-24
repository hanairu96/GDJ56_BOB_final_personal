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
public class OnedayclassMember {
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberGender;
}
