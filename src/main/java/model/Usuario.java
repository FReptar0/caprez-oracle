package model;

public class Usuario {
    int id;
    String user;
    String password;

    public Usuario() {
    }

    public Usuario(int id, String user, String password) {
        this.id = id;
        this.user = user;
        this.password = password;
    }

    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return password;
    }

    public void setPass(String password) {
        this.password = password;
    }
}
