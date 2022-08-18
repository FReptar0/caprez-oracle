package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCategorias {
    PreparedStatement ps;
    ResultSet rs;
    Connection con;
    Conexion cn = new Conexion();

    public List listar() {
        List<BeanCategorias> lista = new ArrayList<>();
        String sql = "SELECT * FROM CATEGORIAS";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanCategorias bca = new BeanCategorias();
                bca.setId(rs.getInt(1));
                bca.setCategoria(rs.getString(2));
                bca.setStatus(rs.getBoolean(3));
                lista.add(bca);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return lista;
    }

    public int agregar(BeanCategorias bca) {
        int r = 0;
        String sql = "INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA, ESTADO) VALUES (?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, 0);
            ps.setBoolean(3, bca.getStatus());
            ps.setString(2, bca.getCategoria());

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

    public BeanCategorias listarId(int id) {
        BeanCategorias bca = new BeanCategorias();
        String sql = "SELECT * FROM CATEGORIAS WHERE ID_CATEGORIA = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                bca.setId(rs.getInt(1));
                bca.setStatus(rs.getBoolean(3));
                bca.setCategoria(rs.getString(2));
            }
        } catch (Exception e) {

        }
        return bca;
    }

    public int actualizar(BeanCategorias bca) {
        int r = 0;
        String sql = "UPDATE CATEGORIAS SET NOMBRE_CATEGORIA = ?, ESTADO = ? WHERE ID_CATEGORIA = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBoolean(2, bca.getStatus());
            ps.setString(1, bca.getCategoria());
            ps.setInt(3, bca.getId());
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

    public int visibilidad(BeanCategorias bca) {
        int r = 0;
        String sql = "UPDATE CATEGORIAS SET ESTADO = ? WHERE ID_CATEGORIA = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, bca.getStatus());
            ps.setInt(2, bca.getId());
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

    public void eliminar(int id) {
        String sql = "DELETE FROM CATEGORIAS WHERE ID_CATEGORIA = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
