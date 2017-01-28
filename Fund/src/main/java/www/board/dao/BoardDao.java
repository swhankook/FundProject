package www.board.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import www.common.dao.AbstractDAO;

@Repository("boardDao")
public class BoardDao extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectPagingList("board.selectBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> boardList(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)pagingList("board.boardList", map);
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
}
