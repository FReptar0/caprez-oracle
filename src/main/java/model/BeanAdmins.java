package model;

public class BeanAdmins {
    private long id;
    private String usuario;
    private String contra;
    private String nombre;
    private String apellido;
    private int longitug;

    public BeanAdmins() {
    }

    public BeanAdmins(long id, String usuario, String contra, String nombre, String apellido, int longitug) {
        this.id = id;
        this.usuario = usuario;
        this.contra = contra;
        this.nombre = nombre;
        this.apellido = apellido;
        this.longitug = longitug;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getLongitug() {
        return longitug;
    }

    public void setLongitug(int longitug) {
        this.longitug = longitug;
    }

}