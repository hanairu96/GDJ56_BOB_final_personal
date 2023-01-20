package com.today.bab.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String memberId;
	private String password;
	private String mName;
	private String nickname;
	private Date birth;
	private String phone;
	private char gender;
	private String email;
	private String address;
	private char grade;

}
