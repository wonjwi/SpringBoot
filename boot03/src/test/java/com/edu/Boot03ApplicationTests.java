package com.edu;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.edu.dto.BoardDTO;
import com.edu.persistence.BoardRepository;

@SpringBootTest
class Boot03ApplicationTests {

	@Autowired
	private BoardRepository repo;
	@Test
	public void testInsert200() { //데이터 200건 만들기
		for(int i = 1; i <= 200; i++) {			
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setTitle(i + "번째 글");
			boardDTO.setContent(i + "번째 글입니다.");
			boardDTO.setWriter("user0" + (i % 10));
			repo.save(boardDTO);
		}
	}
	
	@Test
	public void testByTitle() {
		//repo.find 뒤에 엔터티 타입을 지정 
		//By 뒤에는 컬럼명을 이용해서 만든다.
		repo.findBoardDTOByTitle("147번째 글").forEach(boardDTO -> System.out.println(boardDTO));
		repo.findBoardDTOByWriter("user04").forEach(boardDTO -> System.out.println(boardDTO));
	}

} // End - class Boot03ApplicationTests