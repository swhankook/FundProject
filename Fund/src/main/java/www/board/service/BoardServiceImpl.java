package www.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import www.board.dao.BoardDao;
import www.common.CommonsWeb;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardDao")
	private BoardDao boardDao;

	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDao.selectBoardList(map);
	}

	@Override
	public Map<String, Object> boardList(Map<String, Object> map) throws Exception {
		return boardDao.boardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		boardDao.insertBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		boardDao.updateHitCnt(map);
		Map<String, Object> resultMap = boardDao.selectBoardDetail(map);
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		boardDao.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDao.deleteBoard(map);
	}

	@Transactional
	@Override
	public void insertLoanBoard(Map<String, Object> map) throws Exception {
		boardDao.insertLoanBoard(map);
	}
	
	@Override
	public void loanDelete(Map<String, Object> map) throws Exception {
		boardDao.deleteLoan(map);
	}
	
	@Override
	public Map<String, Object> selectLoanList(Map<String, Object> map) throws Exception {
		return boardDao.selectLoanList(map);
	}

	@Override
	public Map<String, Object> selectLoanDetail(Map<String, Object> map) throws Exception {
		boardDao.updateLoanHitCnt(map);
		Map<String, Object> resultMap = boardDao.selectLoanDetail(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectSubLoanList(Map<String, Object> map) throws Exception {
		return boardDao.selectSubLoanList(map);
	}

	@Override
	public Map<String, Object> selectLoanMyList(Map<String, Object> map) throws Exception {
		return boardDao.selectLoanMyList(map);
	}

}
