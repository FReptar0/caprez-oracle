package model;

import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Query;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStream;

import java.util.Base64;

public class DAOfertas {

    PreparedStatement ps;
    ResultSet rs;
    Connection con;
    Conexion cn = new Conexion();

    // LISTAR TODAS LAS OFERTAS
    public List listar() {
        List<BeanOfertas> lista = new ArrayList<>();
        String sql = "select ID_OFERTA,NOMBRE_OFERTA,DESCRIPCION_OFERTA,FEC_INICIO,FEC_FIN,CATEGORIAS.NOMBRE_CATEGORIA,OFERTAS.ESTADO,IMAGEN from OFERTAS join CATEGORIAS on ofertas.id_categoria=categorias.id_categoria;";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeanOfertas bo = new BeanOfertas();
                bo.setId(rs.getInt(1));
                bo.setTitulo(rs.getString(2));
                bo.setDescripcion(rs.getString(3));
                bo.setFechaInicio(rs.getString(4));
                bo.setFechaFin(rs.getString(5));
                bo.setCategoria(rs.getString(6));
                bo.setEstado(rs.getBoolean(7));
                byte[] img=rs.getBytes("IMAGEN");
                String setIMG =Base64.getEncoder().encodeToString(img);
                bo.setImage(setIMG);
                lista.add(bo);
            }
        } catch (Exception e) {
            System.out.println("no llegue we");
            // TODO: handle exception
        } finally {
            // agregar close connections
        }
        return lista;
    }

    // LISTAR UNA IMAGEN
    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from ofertas where id=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("imagen");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            // agregar close connections
        }
    }

    public BeanOfertas listarId(int id) {
        BeanOfertas bean = new BeanOfertas();
        String sql = "SELECT NOMBRE_OFERTA, DESCRIPCION_OFERTA, FEC_INICIO, FEC_FIN, ESTADO FROM OFERTAS WHERE ID_OFERTA = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                bean.setId(rs.getInt(1));
                bean.setTitulo(rs.getString(2));
                bean.setDescripcion(rs.getString(3));
                bean.setFechaInicio(rs.getString(4));
                bean.setFechaFin(rs.getString(5));
                bean.setEstado(rs.getBoolean(6));
                bean.setId(rs.getInt(9));
            }
        } catch (Exception e) {

        }
        return bean;
    }



    //GUARDAR UNA NUEVA OFERTA
    public void agregar(BeanOfertas ofertas){
        String sql = "INSERT INTO OFERTAS(NOMBRE_OFERTA, DESCRIPCION_OFERTA, FEC_INICIO, FEC_FIN, ID_CATEGORIA, ESTADO,imagen) VALUES(?,?,?,?,?,?,?);";
        try{
            con= cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1,ofertas.getTitulo());
            ps.setString(2,ofertas.getDescripcion());
            ps.setString(3,ofertas.getFechaInicio());
            ps.setString(4,ofertas.getFechaFin());
            ps.setInt(5,ofertas.getCategoriaInsert());
            ps.setBoolean(6,ofertas.getEstado());
            ps.setBlob(7,ofertas.getImg());
            ps.executeUpdate();
            System.out.println("si las inserte pa");
        } catch (SQLException e) {
            System.out.println("ni pdo we, no las envie");
            throw new RuntimeException(e);
        }
    }

    public BeanOfertas buscar(int id) {
        BeanOfertas bof = new BeanOfertas();
        String sql = "SELECT ID_OFERTA, NOMBRE_OFERTA, DESCRIPCION_OFERTA, ESTADO FROM OFERTAS WHERE ID_OFERTA = "+id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                bof.setId(rs.getInt("ID_OFERTA"));
                bof.setTitulo(rs.getString("NOMBRE_OFERTA"));
                bof.setDescripcion(rs.getString("DESCRIPCION_OFERTA"));
                bof.setEstado(rs.getBoolean("ESTADO"));
            }
        } catch (SQLException e) {
            System.out.println("error"+e);
        }

        return bof;
    }

    public int visibilidad(BeanOfertas bo) {
        int r = 0;
        String sql = "UPDATE OFERTAS SET ESTADO = ? WHERE ID_OFERTA = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, bo.getEstado());
            
            ps.setInt(2, bo.getId());
            
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

    
    public int actualizar(BeanOfertas bean) {
        int r = 0;
        System.out.println(bean.getId());
        String sql = "UPDATE OFERTAS SET NOMBRE_OFERTA = ?, DESCRIPCION_OFERTA = ?, FEC_INICIO = ?, FEC_FIN = ?, ESTADO = ? WHERE ID_OFERTA = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, bean.getTitulo());
            System.out.println(bean.getTitulo());
            ps.setString(2, bean.getDescripcion());
            System.out.println(bean.getDescripcion());
            ps.setString(3, bean.getFechaInicio());
            System.out.println(bean.getFechaInicio());
            ps.setString(4, bean.getFechaFin());
            System.out.println(bean.getFechaFin());
            ps.setBoolean(5, bean.getEstado());
            System.out.println(bean.getEstado());
            ps.setInt(6, bean.getId());
            System.out.println(bean.getId());

            System.out.println(sql);

            r = ps.executeUpdate();
            if (r == 1) {
                r = 1;
            } else {
                r = 0;
            }
        } catch (Exception e) {
            System.out.println("eerr");
        }
        return r;
    }

}