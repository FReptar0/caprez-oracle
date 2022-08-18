package model;

public class BeanCategorias {
    private int id;
    private Boolean status;
    private String categoria;

    public BeanCategorias() {
    }

    public BeanCategorias(int id, Boolean status, String categoria) {
        this.id = id;
        this.status = status;
        this.categoria = categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}
