package www.login.service;

import www.common.common.User;

public interface LoginService {
	public boolean userCheck(User user);

	public void userInsert(User user) throws Exception;

	public User userLogin(User user);
}
