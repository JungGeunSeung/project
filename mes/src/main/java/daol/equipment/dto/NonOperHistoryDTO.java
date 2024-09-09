package daol.equipment.dto;

public class NonOperHistoryDTO {
    private String downReason; // 비가동 사유
    private String downtimeHistory; // 비가동이력
    private String equiID; // 설비번호
    private String resultID; // 기준 컬럼
    private String equiName; // 설비명

    // Getters and Setters
    public String getDownReason() {
        return downReason;
    }

    public void setDownReason(String downReason) {
        this.downReason = downReason;
    }

    public String getDowntimeHistory() {
        return downtimeHistory;
    }

    public void setDowntimeHistory(String downtimeHistory) {
        this.downtimeHistory = downtimeHistory;
    }

    public String getEquiID() {
        return equiID;
    }

    public void setEquiID(String equiID) {
        this.equiID = equiID;
    }

    public String getResultID() {
        return resultID;
    }

    public void setResultID(String resultID) {
        this.resultID = resultID;
    }

    public String getEquiName() {
        return equiName;
    }

    public void setEquiName(String equiName) {
        this.equiName = equiName;
    }
}

