package com.today.bab.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberLike {
	private String memberId;
	private char fruit;
	private char sea;
	private char meat;
	private char side;
	private char vege;
}
