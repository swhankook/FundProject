package www.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import www.common.dao.AbstractDAO;

@Repository("boardDao")
public class BoardDao extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList("board.selectBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> boardList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) pagingList("board.boardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("board.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		update("board.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("board.deleteBoard", map);
	}

	public void insertLoanBoard(Map<String, Object> map) throws Exception {
		insert("loan.insertLoanBoard", map);
	}
	
	public void deleteLoan(Map<String, Object> map) throws Exception {
		update("loan.deleteLoan", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoanList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList("loan.selectLoanList", map);
	}

	public void updateLoanHitCnt(Map<String, Object> map) throws Exception {
		update("loan.updateLoanHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoanDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("loan.selectLoanDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSubLoanList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("board.subList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoanMyList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList("loan.selectLoanMyList", map);
	}
}
