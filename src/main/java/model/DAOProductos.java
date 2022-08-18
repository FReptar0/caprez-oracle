package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOProductos {
    PreparedStatement ps;
    ResultSet rs;
    Connection con;
    Conexion cn = new Conexion();

    public List listar() {
        List<BeanProductos> lista = new ArrayList<>();
        String sql = "select * from consulta_productos";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanProductos ba = new BeanProductos();
                ba.setId(rs.getInt(1));
                ba.setId_oferta(rs.getInt(2));
                ba.setId_categoria(rs.getInt(3));
                ba.setEstado_categoria(rs.getBoolean(4));
                ba.setTitulo(rs.getString(5));
                ba.setDescripcionProducto(rs.getString(6));
                ba.setMasInfo(rs.getString(7));
                ba.setPrecioMin(rs.getDouble(8));
                ba.setPrecioMax(rs.getDouble(9));
                ba.setEstado(rs.getBoolean(10));
                ba.setStock(rs.getInt(11));
                ba.setCategoria(rs.getString(12));
                byte[] img = rs.getBytes(13);
                String setImg = Base64.getEncoder().encodeToString(img);
                ba.setImage(setImg);

                lista.add(ba);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return lista;
    }

    public int visibilidad(BeanProductos bean) {
        int r = 0;
        String sql = "UPDATE PRODUCTOS SET ESTADO = ? WHERE ID_PRODUCTO = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, bean.getEstado());
            ps.setInt(2, bean.getId());
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

    public BeanProductos listarId(int id) {
        BeanProductos bean = new BeanProductos();
        String sql = "SELECT ID_PRODUCTO, TITULO_PRODUCTO, DESCRIPCION_PRODUCTO, INFO_PRODUCTO, PRECIO_MIN, " +
                "PRECIO_MAX, ESTADO, STOCK, ID_CATEGORIA FROM PRODUCTOS WHERE ID_PRODUCTO = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                bean.setId(rs.getInt(1));
                bean.setTitulo(rs.getString(2));
                bean.setDescripcionProducto(rs.getString(3));
                bean.setMasInfo(rs.getString(4));
                bean.setPrecioMin(rs.getDouble(5));
                bean.setPrecioMax(rs.getDouble(6));
                bean.setEstado(rs.getBoolean(7));
                bean.setStock(rs.getInt(8));
                bean.setId_categoria(rs.getInt(9));
            }
        } catch (Exception e) {

        }
        return bean;
    }

    // agregar
    public void agregar(BeanProductos bp) {
        String sql = "INSERT INTO productos(TITULO_PRODUCTO,DESCRIPCION_PRODUCTO,INFO_PRODUCTO,PRECIO_MIN,PRECIO_MAX,ESTADO,STOCK,ID_CATEGORIA,imagen)values (?,?,?,?,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            System.out.println("si estoy trayendo imagenes");

            ps.setString(1, bp.getTitulo());
            ps.setString(2, bp.getDescripcionProducto());
            ps.setString(3, bp.getMasInfo());
            ps.setDouble(4, bp.getPrecioMin());
            ps.setDouble(5, bp.getPrecioMax());
            ps.setBoolean(6, bp.getEstado());
            ps.setInt(7, bp.getStock());
            ps.setInt(8, bp.getId_categoria());
            ps.setBlob(9, bp.getImg());
            System.out.println(bp.getImg());
            System.out.println("vamos bien paa");
            ps.executeUpdate();
            System.out.println("si inserte");
        } catch (SQLException e) {
            System.out.println("no inserte");
            throw new RuntimeException(e);
        }
    }

    public int actualizar(BeanProductos bean) {
        int r = 0;
        String sql = "UPDATE PRODUCTOS SET TITULO_PRODUCTO = ?, DESCRIPCION_PRODUCTO = ?, INFO_PRODUCTO = ?," +
                "PRECIO_MIN = ?, PRECIO_MAX = ?, ESTADO = ?, STOCK = ? " +
                "WHERE ID_PRODUCTO = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, bean.getTitulo());
            ps.setString(2, bean.getDescripcionProducto());
            ps.setString(3, bean.getMasInfo());
            ps.setDouble(4, bean.getPrecioMin());
            ps.setDouble(5, bean.getPrecioMax());
            ps.setBoolean(6, bean.getEstado());
            ps.setInt(7, bean.getStock());
            ps.setInt(8, bean.getId());
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

    public BeanProductos buscar(int id) {
        BeanProductos bean = new BeanProductos();
        String sql = "SELECT PRODUCTOS.ID_PRODUCTO,PRODUCTOS.TITULO_PRODUCTO,PRODUCTOS.DESCRIPCION_PRODUCTO,PRODUCTOS.INFO_PRODUCTO,PRODUCTOS.PRECIO_MIN,PRODUCTOS.PRECIO_MAX,PRODUCTOS.ESTADO,PRODUCTOS.STOCK,PRODUCTOS.ID_OFERTA,PRODUCTOS.ID_CATEGORIA,PRODUCTOS.IMAGEN,CATEGORIAS.ESTADO FROM PRODUCTOS, CATEGORIAS WHERE PRODUCTOS.ID_CATEGORIA = CATEGORIAS.ID_CATEGORIA AND PRODUCTOS.ID_PRODUCTO = "
                + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                bean.setId(rs.getInt(1));
                bean.setTitulo(rs.getString(2));
                bean.setDescripcionProducto(rs.getString(3));
                bean.setMasInfo(rs.getString(4));
                bean.setPrecioMin(rs.getInt(5));
                bean.setPrecioMax(rs.getInt(6));
                bean.setEstado(rs.getBoolean(7));
                bean.setStock(rs.getInt(8));
                bean.setId_oferta(rs.getInt(9));
                bean.setId_categoria(rs.getInt(10));
                byte[] img = rs.getBytes(11);
                bean.setEstado_categoria(rs.getBoolean(12));
                String setImg = Base64.getEncoder().encodeToString(img);
                bean.setImage(setImg);

                System.out.println("si envie todo");

            }
        } catch (Exception sqlException) {
        }
        return bean;
    }

    public List listarPorCategoria(String cate) {
        List<BeanProductos> lista = new ArrayList<>();

        String sql = "select * from consulta_productos where categoria = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cate);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanProductos ba = new BeanProductos();
                ba.setId(rs.getInt(1));
                ba.setId_oferta(rs.getInt(2));
                ba.setTitulo(rs.getString(3));
                ba.setDescripcionProducto(rs.getString(4));
                ba.setMasInfo(rs.getString(5));
                ba.setPrecioMin(rs.getDouble(6));
                ba.setPrecioMax(rs.getDouble(7));
                ba.setEstado(rs.getBoolean(8));
                ba.setStock(rs.getInt(9));
                ba.setCategoria(rs.getString(10));
                byte[] img = rs.getBytes(11);
                String setImg = Base64.getEncoder().encodeToString(img);
                ba.setImage(setImg);
                lista.add(ba);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        return lista;
    }

    public String obtenerImg(int id) {
        String img = "";
        String sql = "select imagen from productos where id_producto = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                byte[] img2 = rs.getBytes(1);
                img = Base64.getEncoder().encodeToString(img2);
            }
        } catch (Exception e) {
        }
        return img;
    }

}
