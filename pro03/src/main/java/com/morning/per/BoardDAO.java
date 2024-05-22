package com.morning.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.morning.domain.Board;

@Repository
public class BoardDAO implements BoardMapper {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("board.getTotalCount");
	}

	@Override
	public List<Board> getBoardList() {
		return sqlSession.selectList("board.getBoardList");
	}

	@Override
	public Board getBoard(int bno) {
		return sqlSession.selectOne("board.getBoard", bno);
	}

	@Override
	public void insBoard(Board board) {
		sqlSession.insert("board.insBoard", board);
	}

	@Override
	public void upBoard(Board board) {
		sqlSession.update("board.upBoard", board);
	}

	@Override
	public void vcntCount(int bno) {
		sqlSession.update("board.vcntCount", bno);
	}

	@Override
	public void delBoard(int bno) {
		sqlSession.delete("board.delBoard", bno);
	}
}
