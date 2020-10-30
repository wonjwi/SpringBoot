package com.edu;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.junit4.SpringRunner;

import com.edu.domain.WebBoard;
import com.edu.persistence.WebBoardRepository;

import lombok.extern.java.Log;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log
@Commit
public class WebBoardRepositoryTests {
	
	@Autowired
	WebBoardRepository repo;
	
	//테스트에 사용할 데이터를 300건 만들어보자.
	@Test
	public void insertBoardDummies() {
		//range(0, 300) => 0이상 300미만
		IntStream.range(0, 300).forEach(i -> {
			WebBoard board = new WebBoard();
			
			board.setTitle("Sample Board Title " + i);
			board.setContent("Content Sample..... " + i + " of Board");
			board.setWriter("user0" + (i % 10));
			repo.save(board);
		});
	}
	
	@Test
	public void testList1() {
		Pageable pageable = PageRequest.of(0, 20, Direction.DESC, "bno");
		Page<WebBoard> result = repo.findAll(
				repo.makePredicate(null, null), pageable);
		log.info("PAGE : " + result.getPageable());
		log.info("--------------------------------------------");
		result.getContent().forEach(board -> log.info("" + board));
	}
	
	@Test
	public void testList2() {
		Pageable pageable = PageRequest.of(0, 20, Direction.DESC, "bno");
		Page<WebBoard> result = repo.findAll(
				repo.makePredicate("t", "17"), pageable);
		log.info("PAGE : " + result.getPageable());
		log.info("--------------------------------------------");
		result.getContent().forEach(board -> log.info("" + board));
	}
}