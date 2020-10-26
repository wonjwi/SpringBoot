package com.edu.persistence;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.edu.dto.BoardDTO;

public interface BoardRepository extends CrudRepository<BoardDTO, Long> {
	
	//제목에 의한 검색
	public List<BoardDTO> findBoardDTOByTitle(String title);

	public List<BoardDTO> findBoardDTOByWriter(String writer);
	
}