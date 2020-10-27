package com.edu.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name="tbl_members") //이름 지정해주지 않으면 Entity 이름이 Table 이름이 됨
@EqualsAndHashCode(of="uid")
public class Member {
	
	@Id
	private String 	uid;
	private String 	upw;
	private String 	uname;
}
