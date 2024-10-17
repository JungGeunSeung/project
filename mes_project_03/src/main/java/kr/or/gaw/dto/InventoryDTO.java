package kr.or.gaw.dto;

public class InventoryDTO {


    private String inventory_id;
    private String product_id;
    private int quantity;
    private String location;

    public String getInventory_id() {
        return inventory_id;
    }

    public void setInventory_id(String inventory_id) {
        this.inventory_id = inventory_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "InventoryDTO [inventory_id=" + inventory_id + ", product_id=" + product_id + ", quantity=" + quantity
                + ", location=" + location + "]";
    }
}
