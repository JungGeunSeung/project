package sowon.quality.dto;

import java.time.LocalDate;

public class StandardDTO {
	
		private String quality_id;
		private String title;
		private String mgr;
		private String insti;
		private LocalDate revision;
		
		
		public String getQuality_id() {
			return quality_id;
		}
		public void setQuality_id(String quality_id) {
			this.quality_id = quality_id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getMgr() {
			return mgr;
		}
		public void setMgr(String mgr) {
			this.mgr = mgr;
		}
		public String getInsti() {
			return insti;
		}
		public void setInsti(String insti) {
			this.insti = insti;
		}
		public LocalDate getRevision() {
			return revision;
		}
		public void setRevision(LocalDate revision) {
			this.revision = revision;
		}
		
		@Override
		public String toString() {
			return "StandardDTO [quality_id=" + quality_id + ", title=" + title + ", mgr=" + mgr + ", insti=" + insti
					+ ", revision=" + revision + "]";
		}
		
		
}
