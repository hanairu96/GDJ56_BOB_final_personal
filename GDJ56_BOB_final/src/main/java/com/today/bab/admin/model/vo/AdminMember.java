package com.today.bab.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminMember {
	private String memberId;
	private String password;
	private String mname;
	private String nickname;
	private Date birth;
	private String birthday;
	private String phone;
	private char gender;
	private String email;
	private String address;
	private char grade;
	
	private MemberLike memberlike; //선호식품
//	private AdminSubscription adminsubscription; //구독
//	private AdminSubItem adminsubitem; //구독상품
	
}
