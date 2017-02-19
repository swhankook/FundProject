package www.board.service;

import java.util.Map;

public interface BoardService {
	Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception;

	Map<String, Object> boardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

	void insertLoanBoard(Map<String, Object> map) throws Exception;

	Map<String, Object> selectLoanList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectLoanDetail(Map<String, Object> map) throws Exception;
}
