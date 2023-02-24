package com.today.bab.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member implements UserDetails{
	private String memberId;
	private String password;
	private String mname;
	private String nickname;
	private Date birth;
	private String phone;
	private char gender;
	private String email;
	private String address;
	private char grade;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth=new ArrayList();
		auth.add(new SimpleGrantedAuthority("ROLE_USER"));
		if(memberId.equals("admin")) auth.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		
		return auth;
	}
	@Override
	public String getUsername() {
		return memberId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
