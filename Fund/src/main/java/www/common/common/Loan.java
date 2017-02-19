package www.common.common;

import java.util.Date;

public class Loan {
	private int idx;
	private int parent_idx;
	private String purpose;
	private int money;
	private int period;
	private int income;
	private String name;
	private int birthday;
	private String email;
	private String phone;
	private String sex;
	private int hit_cnt;
	private String del_gb;
	private Date crea_dtm;
	private String crea_id;
	private int total_count;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getParent_idx() {
		return parent_idx;
	}

	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBirthday() {
		return birthday;
	}

	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getHit_cnt() {
		return hit_cnt;
	}

	public void setHit_cnt(int hit_cnt) {
		this.hit_cnt = hit_cnt;
	}

	public String getDel_gb() {
		return del_gb;
	}

	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}

	public Date getCrea_dtm() {
		return crea_dtm;
	}

	public void setCrea_dtm(Date crea_dtm) {
		this.crea_dtm = crea_dtm;
	}

	public String getCrea_id() {
		return crea_id;
	}

	public void setCrea_id(String crea_id) {
		this.crea_id = crea_id;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
}
