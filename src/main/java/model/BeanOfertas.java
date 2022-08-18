package model;

import java.io.InputStream;

public class BeanOfertas {
    private int id;
    private String titulo;
    private String descripcion;
    private String fechaInicio;
    private String fechaFin;
    private boolean estado;
    private InputStream img;

    private String image;
    private String categoria;

    private int categoriaInsert;

    public BeanOfertas() {
    }

    public BeanOfertas(int id, String titulo, String descripcion, String fechaInicio, String fechaFin, boolean estado, InputStream img, String image, String categoria, int categoriaInsert) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.estado = estado;
        this.img = img;
        this.image = image;
        this.categoria = categoria;
        this.categoriaInsert = categoriaInsert;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }

    public int getCategoriaInsert() {
        return categoriaInsert;
    }

    public void setCategoriaInsert(int categoriaInsert) {
        this.categoriaInsert = categoriaInsert;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
