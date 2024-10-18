package kr.or.gaw.dto;

public class MaterialDTO {

    private int page;
    private int countperpage;
    private int offset;

    // 기존 필드들...
    private String material_id;
    private String material_name;
    private String standard;
    private int quantity;
    private String unit;

    // getter, setter 추가
    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getCountperpage() {
        return countperpage;
    }

    public void setCountperpage(int countperpage) {
        this.countperpage = countperpage;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public String getMaterial_id() {
        return material_id;
    }

    public void setMaterial_id(String material_id) {
        this.material_id = material_id;
    }

    public String getMaterial_name() {
        return material_name;
    }

    public void setMaterial_name(String material_name) {
        this.material_name = material_name;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Override
    public String toString() {
        return "MaterialDTO [material_id=" + material_id + ", material_name=" + material_name 
                + ", standard=" + standard + ", quantity=" + quantity + ", unit=" + unit + "]";
    }
}
