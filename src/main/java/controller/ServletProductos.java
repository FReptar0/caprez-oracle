package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.*;

@MultipartConfig
@WebServlet(name = "/ServletProductos", urlPatterns = { "/ServletProductos" })
public class ServletProductos extends HttpServlet {

    DAOCategorias daoCate = new DAOCategorias();
    DAOProductos dao = new DAOProductos();
    BeanProductos bean = new BeanProductos();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "listar":
                List<BeanProductos> lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
                break;
            case "visibilidadTrue":
                BeanProductos bean1 = new BeanProductos();
                int id3 = Integer.parseInt(request.getParameter("id"));
                bean1.setId(id3);
                bean1.setEstado(true);
                dao.visibilidad(bean1);
                request.getRequestDispatcher("ServletProductos?accion=listar").forward(request, response);
                break;
            case "visibilidadFalse":
                BeanProductos bean2 = new BeanProductos();
                int id4 = Integer.parseInt(request.getParameter("id"));
                bean2.setId(id4);
                bean2.setEstado(false);
                dao.visibilidad(bean2);
                request.getRequestDispatcher("ServletProductos?accion=listar").forward(request, response);
                break;
            case "agregar":

                DAOfertas daoOfer = new DAOfertas();
                List<BeanOfertas> ListaOffe = daoOfer.listar();
                // setear cada dato
                request.setAttribute("lis", ListaOffe);

                List<BeanCategorias> listaCategorias = daoCate.listar();
                request.setAttribute("listado", listaCategorias);
                request.getRequestDispatcher("admin/newProducto.jsp").forward(request, response);
                break;
            case "editar":
                DAOfertas daoOfertas = new DAOfertas();
                List<BeanOfertas> ListaOffer = daoOfertas.listar();
                // setear cada dato
                request.setAttribute("lis", ListaOffer);
                int id = Integer.parseInt(request.getParameter("id"));
                BeanProductos bean = dao.listarId(id);
                request.setAttribute("BeanProductos", bean);
                request.getRequestDispatcher("admin/editProducto.jsp").forward(request, response);
                break;

            case "guardar":
                System.out.println("si llegue al servlet");

                String titulo = request.getParameter("titulo");
                String desc = request.getParameter("descripcion_corta");
                String info = request.getParameter("descripcion_larga");
                // pasar a dobuble
                String precioMin = request.getParameter("precioMin");
                String precioMax = request.getParameter("precioMax");
                Boolean estado = true;
                // pasar a int
                String stock = request.getParameter("stock");
                String Id_cat = request.getParameter("cat");

                // imagen
                Part part = request.getPart("Imagen");
                InputStream inputStream = part.getInputStream();

                System.out.println(titulo + "\n" + desc + "\n" + info + "\n" + precioMin + "\n" + precioMax + "\n"
                        + estado + "\n" + stock + "\n" + Id_cat + "\n" + inputStream);

                BeanProductos bp = new BeanProductos();
                bp.setTitulo(titulo);
                bp.setDescripcionProducto(desc);
                bp.setMasInfo(info);
                bp.setPrecioMin(Double.parseDouble(precioMin));
                bp.setPrecioMax(Double.parseDouble(precioMax));
                bp.setEstado(estado);
                bp.setStock(Integer.parseInt(stock));
                bp.setId_categoria(Integer.parseInt(Id_cat));
                bp.setImg(inputStream);
                dao.agregar(bp);
                request.getRequestDispatcher("ServletProductos?accion=listar").forward(request, response);

                break;
            case "actualizar":
                int id1 = Integer.parseInt(request.getParameter("id"));
                String titulo1 = request.getParameter("titulo");
                Double precioMin1 = Double.parseDouble(request.getParameter("precioMin"));
                Double precioMax1 = Double.parseDouble(request.getParameter("precioMax"));
                int stock1 = Integer.parseInt(request.getParameter("stock"));
                String descripcion = request.getParameter("descripcion");
                String masInfo = request.getParameter("masinfo");
                BeanProductos bn = new BeanProductos();
                bn.setId(id1);
                bn.setTitulo(titulo1);
                bn.setPrecioMin(precioMin1);
                bn.setPrecioMax(precioMax1);
                bn.setStock(stock1);
                bn.setEstado(true);
                bn.setDescripcionProducto(descripcion);
                bn.setMasInfo(masInfo);
                dao.actualizar(bn);
                request.getRequestDispatcher("ServletProductos?accion=listar").forward(request, response);
                break;
            default:
                List<BeanProductos> lista2 = dao.listar();
                request.setAttribute("lista", lista2);
                request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
                break;
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("action");
        if (accion == null) {
            List<BeanProductos> lista = dao.listar();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
        }
        if (accion.equals("listar")) {
            List<BeanProductos> lista = dao.listar();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
        }

        if (accion.equals("agregar")) {
            List<BeanCategorias> listaCategorias = daoCate.listar();
            request.setAttribute("listado", listaCategorias);
            request.getRequestDispatcher("admin/newProducto.jsp").forward(request, response);
        }

        if (accion.equals("editar")) {
            request.getRequestDispatcher("admin/editProducto.jsp").forward(request, response);
        }
        if (accion.equals("actualizar")) {
            request.getRequestDispatcher("ServletProductos?accion=listar").forward(request, response);
        }
    }
}