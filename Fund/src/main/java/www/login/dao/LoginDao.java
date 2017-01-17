package www.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.common.common.User;

@Repository("loginDAO")
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public User userSelect(User user) {
		return sqlSession.selectOne("Login.userSelect", user);
	}

	public void insertUser(User user) {
		sqlSession.insert("Login.userInsert", user);
	}
}
