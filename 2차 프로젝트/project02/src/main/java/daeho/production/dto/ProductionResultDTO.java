package daeho.production.dto;

//ProductionResult 데이터를 담는 DTO 클래스
public class ProductionResultDTO {
	private String resultID;
	private String productionID;
	private String taskID;
	private String planID;
	private String productionDate;
	private int producedQuantity;
	private int defectiveQuantity;
	private String status;
    private String productType;     // 제품 유형 (품목별 생산량을 조회할 때 사용)
    private String month;           // 월 정보 (월별 데이터를 가져올 때 사용)

	
	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	// 기본 생성자
	public ProductionResultDTO() {
	}

	// 모든 필드를 초기화하는 생성자
	public ProductionResultDTO(String resultID, String productionID, String taskID, String planID,
			String productionDate, int producedQuantity, int defectiveQuantity, String status) {
		this.resultID = resultID;
		this.productionID = productionID;
		this.taskID = taskID;
		this.planID = planID;
		this.productionDate = productionDate;
		this.producedQuantity = producedQuantity;
		this.defectiveQuantity = defectiveQuantity;
		this.status = status;
	}

	// 각 필드에 대한 getter 및 setter 메서드
	public String getResultID() {
		return resultID;
	}

	public void setResultID(String resultID) {
		this.resultID = resultID;
	}

	public String getProductionID() {
		return productionID;
	}

	public void setProductionID(String productionID) {
		this.productionID = productionID;
	}

	public String getTaskID() {
		return taskID;
	}

	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}

	public String getPlanID() {
		return planID;
	}

	public void setPlanID(String planID) {
		this.planID = planID;
	}

	public String getProductionDate() {
		return productionDate;
	}

	public void setProductionDate(String productionDate) {
		this.productionDate = productionDate;
	}

	public int getProducedQuantity() {
		return producedQuantity;
	}

	public void setProducedQuantity(int producedQuantity) {
		this.producedQuantity = producedQuantity;
	}

	public int getDefectiveQuantity() {
		return defectiveQuantity;
	}

	public void setDefectiveQuantity(int defectiveQuantity) {
		this.defectiveQuantity = defectiveQuantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}