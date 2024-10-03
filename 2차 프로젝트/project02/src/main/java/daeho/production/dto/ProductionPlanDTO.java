package daeho.production.dto;

import java.sql.Date;

public class ProductionPlanDTO {
    private String planid; //계획di
    private String production_id; //제품id
    private int plannedQuan;	//계획수량
    private Date startDate;		//계획 시작일
    private Date endDate;		//계획 종료일
    private String status;		//상태
    private String userid;		//사원id
    
    private int rnum;
    //필요한것이 무엇이 있을까... 승인자?

    public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	// Getters and Setters
    public String getPlanid() {
        return planid;
    }

    public void setPlanid(String planid) {
        this.planid = planid;
    }

    public String getProduction_id() {
        return production_id;
    }

    public void setProduction_id(String production_id) {
        this.production_id = production_id;
    }

    public int getPlannedQuan() {
		return plannedQuan;
	}

	public void setPlannedQuan(int plannedQuan) {
		this.plannedQuan = plannedQuan;
	}

	public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
    
    @Override
	public String toString() {
		return "EmpDTO [planid=" + planid + ", production_id=" + production_id + ", plannedQuan=" + plannedQuan + ", startDate=" + startDate + ", endDate="
				+ endDate + ", status=" + status + ", userid=" + userid + "]";
	}
}