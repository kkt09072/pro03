package com.morning.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.domain.Board;
import com.morning.per.BoardMapper;

@Service
public class BoardService implements BoardBiz {

	@Autowired
	private BoardMapper boardDAO;
	
	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}

	@Override
	public List<Board> getBoardList() {
		return boardDAO.getBoardList();
	}

	@Override
	public Board getBoard(int bno) {
		return boardDAO.getBoard(bno);
	}

	@Override
	public void insBoard(Board board) {
		boardDAO.insBoard(board);		
	}

	@Override
	public void upBoard(Board board) {
		boardDAO.upBoard(board);
	}

	@Override
	public void vcntCount(int bno) {
		boardDAO.vcntCount(bno);		
	}

	@Override
	public void delBoard(int bno) {
		boardDAO.delBoard(bno);
	}
	
}
