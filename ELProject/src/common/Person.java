package common;
//형식 : 자바빈 클래스
//역할 : DTO 클래스


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class Person {
	private String name;
	private int age;

}
