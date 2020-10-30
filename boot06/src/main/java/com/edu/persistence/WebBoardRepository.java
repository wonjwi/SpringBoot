package com.edu.persistence;

import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.CrudRepository;

import com.edu.domain.QWebBoard;
import com.edu.domain.WebBoard;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

//Querydsl을 사용하기 위해서 Querydsl을 상속 받는다.
public interface WebBoardRepository 
	extends CrudRepository<WebBoard, Long>, QuerydslPredicateExecutor<WebBoard> {
	
	public default Predicate makePredicate(String type, String keyword) {
		BooleanBuilder builder = new BooleanBuilder();
		QWebBoard board = QWebBoard.webBoard;
		
		builder.and(board.bno.gt(0)); //board.bno > 0
		
		if(type == null) {
			return builder;
		}
		
		switch(type) {
		case "t":
			//select * from board where bno > 0 and title "%keyword%";
			builder.and(board.title.like("%" + keyword + "%"));
			break;
		case "c":
			//select * from board where bno > 0 and content "%keyword%";
			builder.and(board.content.like("%" + keyword + "%"));
			break;
		case "w":
			//select * from board where bno > 0 and writer "%keyword%";
			builder.and(board.writer.like("%" + keyword + "%"));
			break;
		}
		return builder;
	}

}
