package sowon.quality.dto;

public class DefectDTO {
	
		private String report_id;
		private String ins_id;
		private String production_id;
		private String planid;
		private int defect_count;
		
		public void setReport_id(String report_id) {
			this.report_id = report_id;
		}
		public String getReport_id() {
			return report_id;
		}
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
		public String getPlanid() {
			return planid;
		}
		public void setPlanid(String planid) {
			this.planid = planid;
		}
		public int getDefect_count() {
			return defect_count;
		}
		public void setDefect_count(int defect_count) {
			this.defect_count = defect_count;
		}
		
		
		@Override
		public String toString() {
			return "DefectDTO [report_id=" + report_id + ", ins_id=" + ins_id + ", production_id=" + production_id
					+ ", planid=" + planid + ", defect_count=" + defect_count + "]";
		}
		


}
