package model;

import java.io.InputStream;

public class BeanProductos {
    private int id;
    private int id_oferta;
    private int id_categoria;
    private String titulo;
    private String descripcionProducto;
    private String masInfo;
    private double precioMin;
    private double precioMax;
    private boolean estado;
    private boolean estado_categoria;
    private int stock;
    private String categoria;
    private String descripcionOferta;

    //imagen
    private InputStream img;
    private String image;
    
    public BeanProductos() {
    }

    public BeanProductos(int id, int id_oferta, int id_categoria, String titulo, String descripcionProducto, String masInfo, double precioMin, double precioMax, boolean estado, boolean estado_categoria, int stock, String categoria, String descripcionOferta,InputStream img, String image) {
        this.id = id;
        this.id_oferta = id_oferta;
        this.id_categoria = id_categoria;
        this.titulo = titulo;
        this.descripcionProducto = descripcionProducto;
        this.masInfo = masInfo;
        this.precioMin = precioMin;
        this.precioMax = precioMax;
        this.estado = estado;
        this.estado_categoria = estado_categoria;
        this.stock = stock;
        this.categoria = categoria;
        this.descripcionOferta = descripcionOferta;

        this.img=img;
        this.image=image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_oferta() {
        return id_oferta;
    }

    public void setId_oferta(int id_oferta) {
        this.id_oferta = id_oferta;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public String getMasInfo() {
        return masInfo;
    }

    public void setMasInfo(String masInfo) {
        this.masInfo = masInfo;
    }

    public double getPrecioMin() {
        return precioMin;
    }

    public void setPrecioMin(double precioMin) {
        this.precioMin = precioMin;
    }

    public double getPrecioMax() {
        return precioMax;
    }

    public void setPrecioMax(double precioMax) {
        this.precioMax = precioMax;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public boolean getEstado_categoria() {
        return estado_categoria;
    }

    public void setEstado_categoria(boolean estado_categoria) {
        this.estado_categoria = estado_categoria;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescripcionOferta() {
        return descripcionOferta;
    }

    public void setDescripcionOferta(String descripcionOferta) {
        this.descripcionOferta = descripcionOferta;
    }

    public InputStream getImg(){
        return img;
    }
    public void setImg(InputStream img){
        this.img=img;
    }

    public String getImage(){
        return image;
    }

    public void setImage(String image){
        this.image=image;
    }

}
