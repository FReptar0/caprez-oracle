package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOAdmins {
    PreparedStatement ps;
    ResultSet rs;
    Connection con;
    Conexion cn = new Conexion();

    public List listar() {
        List<BeanAdmins> lista = new ArrayList<>();
        String sql = "SELECT * FROM ADMINISTRADORES";
/*         String sql1 = "SELECT COUNT(ID_ADMIN) FROM ADMINISTRADORES";*/
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanAdmins ba = new BeanAdmins();
                ba.setId(rs.getInt(1));
                ba.setUsuario(rs.getString(2));
                ba.setContra(rs.getString(3));
                ba.setNombre(rs.getString(4));
                ba.setApellido(rs.getString(5));
                lista.add(ba);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return lista;
    }

    public int agregar(BeanAdmins ba) {
        int r = 0;
        String sql = "INSERT INTO ADMINISTRADORES (ID_ADMIN, USER_ADMIN, PASS_ADMIN, NOMBRE_ADMIN, APELLIDO_ADMIN, ROL_ADMIN, ESTADO) VALUES (?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, 0);
            ps.setString(2, ba.getUsuario());
            ps.setString(3, ba.getContra());
            ps.setString(4, ba.getNombre());
            ps.setString(5, ba.getApellido());
            ps.setBoolean(6, false);
            ps.setBoolean(7, true);
            r = ps.executeUpdate();

            if (r == 1) {
                r = 1;
            } else {
                r = 0;
            }

        } catch (Exception e) {

        }
        return r;
    }

    public BeanAdmins listarId(int id) {
        BeanAdmins ba = new BeanAdmins();
        String sql = "SELECT * FROM ADMINISTRADORES WHERE ID_ADMIN = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ba.setId(rs.getInt(1));
                ba.setUsuario(rs.getString(2));
                ba.setContra(rs.getString(3));
                ba.setNombre(rs.getString(4));
                ba.setApellido(rs.getString(5));
            }
        } catch (Exception e) {
        
        }
        return ba;
    }

    public int actualizar(BeanAdmins ba){
        int r = 0;
        String sql = "UPDATE ADMINISTRADORES SET USER_ADMIN = ?, NOMBRE_ADMIN = ?, APELLIDO_ADMIN = ? WHERE ID_ADMIN = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, ba.getUsuario());
            ps.setString(2, ba.getNombre());
            ps.setString(3, ba.getApellido());
            ps.setLong(4, ba.getId());
            r = ps.executeUpdate();
            if (r == 1) {
                r = 1;
            } else {
                r = 0;
            }
        } catch (Exception e) {
        }
        return r;
    }

    public void eliminar(int id){
        String sql = "DELETE FROM ADMINISTRADORES WHERE ID_ADMIN = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
