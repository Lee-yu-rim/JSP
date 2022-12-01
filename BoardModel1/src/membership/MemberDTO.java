package membership;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor

public class MemberDTO {
	//DTO(Data Transfer Object)/vo : bean 객체를 생성하여 데이터를 담는 역할
	private String id;
	private String pass;
	private String name;
	private String regidate;
}
