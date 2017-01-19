package www.login.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.common.common.User;
import www.login.dao.LoginDao;
import www.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDao loginDao;

	@Override
	public boolean userCheck(User user) {
		User selectUser = loginDao.userSelect(user);

		if (selectUser != null) {
			return false;
		}
		return true;
	}

	@Override
	public void userInsert(User user) throws Exception {
		loginDao.insertUser(user);
	}

	@Override
	public User userLogin(User user) {
		return loginDao.userLogin(user);
	}
}
