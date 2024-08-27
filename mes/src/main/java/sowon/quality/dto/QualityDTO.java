package sowon.quality.dto;

import java.time.LocalDate;

public class QualityDTO {
	
		private String ins_id;
		private String production_id;
		private String planid2;
		private LocalDate ins_date;
		private String result;
		private int defect_count;
		private String defect_cause;
		private String resultid;
		private String taskid;
		
		
		public String getIns_id() {
			return ins_id;
		}
		public void setIns_id(String ins_id) {
			this.ins_id = ins_id;
		}
		public String getProduction_id() {
			return production_id;
		}
		public void setProduction_id(String production_id) {
			this.production_id = production_id;
		}
		public String getPlanid2() {
			return planid2;
		}
		public void setPlanid2(String planid2) {
			this.planid2 = planid2;
		}
		public LocalDate getIns_date() {
			return ins_date;
		}
		public void setIns_Date(LocalDate ins_date) {
			this.ins_date = ins_date;
		}
		public String getResult() {
			return result;
		}
		public void setResult(String result) {
			this.result = result;
		}
		public int getDefect_count() {
			return defect_count;
		}
		public void setDefect_count(int defect_count) {
			this.defect_count = defect_count;
		}
		public String getDefect_cause() {
			return defect_cause;
		}
		public void setDefect_cause(String defect_cause) {
			this.defect_cause = defect_cause;
		}
		public String getResultID() {
			return resultid;
		}
		public void setResultID(String resultid) {
			this.resultid = resultid;
		}
		public String getTaskid() {
			return taskid;
		}
		public void setTaskid(String taskid) {
			this.taskid = taskid;
		}
		public String getPlanid() {
			return planid;
		}
		public void setPlanid(String planid) {
			this.planid = planid;
		}
		private String planid;


		@Override
		public String toString() {
			return "QualityDTO [ins_id=" + ins_id + ", production_id=" + production_id + ", planid2=" + planid2
					+ ", ins_date=" + ins_date + ", result=" + result + ", defect_count=" + defect_count
					+ ", defect_cause=" + defect_cause + ", resultid=" + resultid + ", taskid=" + taskid + ", planid="
					+ planid + "]";
		}

	

}
