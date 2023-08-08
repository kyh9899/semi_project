package com.hm.mvc.member.model.vo;	

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String pwd;
	
	private String name;
	
	private String SSN1;
	
	private String SSN2;
	
	private String phone;
	
	private String address1;
	
	private String address2;
	
	private String email;
	
	private String status;
	
	private Date joinDate;
	
	private Date quitDate;
	
	private String ONF;
}
