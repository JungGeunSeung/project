package kr.or.gaw.dto;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Component;
@Component
public class EmpDTO {

    private Integer empno;
    private String ename;
    private String job;
    private Integer mgr;
    private Date hireDate;
    private int sal;
    private Integer comm;
    private int deptno;
    private int rnum;
    private String keyword;
    private String type;
    private String[] checks;
    private String orderType;
    private String orderName;

    public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String[] getChecks() {
		return checks;
	}
	public void setChecks(String[] checks) {
		this.checks = checks;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public Integer getEmpno() {
        return this.empno;
    }
    public void setEmpno(Integer empno) {
        this.empno = empno;
    }
    public String getEname() {
        return ename;
    }
    public void setEname(String ename) {
        this.ename = ename;
    }
    public String getJob() {
        return job;
    }
    public void setJob(String job) {
        this.job = job;
    }
    public Integer getMgr() {
        return mgr;
    }
    public void setMgr(Integer mgr) {
        this.mgr = mgr;
    }
    public Date getHireDate() {
        return hireDate;
    }
    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }
    public int getSal() {
        return sal;
    }
    public void setSal(int sal) {
        this.sal = sal;
    }
    public Integer getComm() {
        return comm;
    }
    public void setComm(Integer comm) {
        this.comm = comm;
    }
    public int getDeptno() {
        return deptno;
    }
    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }
    
    public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "EmpDTO [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hireDate="
				+ hireDate + ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + ", rnum=" + rnum + ", keyword="
				+ keyword + ", type=" + type + ", checks=" + Arrays.toString(checks) + ", orderType=" + orderType
				+ ", orderName=" + orderName + "]";
	}
	
	

	
}