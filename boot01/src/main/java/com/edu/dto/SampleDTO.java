package com.edu.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Getter
//@Setter
//@ToString
@Data //@Data를 쓰면 위 3개는 안 써도 됨
@ToString(exclude={"val2"})
public class SampleDTO {
	private String val1;
	private String val2;
	private String val3;
}