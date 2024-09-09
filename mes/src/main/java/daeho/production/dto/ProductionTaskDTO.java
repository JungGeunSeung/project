package daeho.production.dto;

public class ProductionTaskDTO {

	private String taskID;
    private String planID;
    private String productionID;
    private int required;
    private int used;
    private String taskStatus;
    private String taskContent;

    // Constructor
    public ProductionTaskDTO(String taskID, String planID, String productionID, int required, int used, String taskStatus, String taskContent) {
        this.taskID = taskID;
        this.planID = planID;
        this.productionID = productionID;
        this.required = required;
        this.used = used;
        this.taskStatus = taskStatus;
        this.taskContent = taskContent;
    }

    // Getters and Setters
    public String getTaskID() { return taskID; }
    public void setTaskID(String taskID) { this.taskID = taskID; }

    public String getPlanID() { return planID; }
    public void setPlanID(String planID) { this.planID = planID; }

    public String getProductionID() { return productionID; }
    public void setProductionID(String productionID) { this.productionID = productionID; }

    public int getRequired() { return required; }
    public void setRequired(int required) { this.required = required; }

    public int getUsed() { return used; }
    public void setUsed(int used) { this.used = used; }

    public String getTaskStatus() { return taskStatus; }
    public void setTaskStatus(String taskStatus) { this.taskStatus = taskStatus; }

    public String getTaskContent() { return taskContent; }
    public void setTaskContent(String taskContent) { this.taskContent = taskContent; }
}
