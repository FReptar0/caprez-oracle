package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanCategorias;
import model.BeanOfertas;
import model.BeanProductos;
import model.DAOCategorias;
import model.DAOProductos;
import model.DAOfertas;

@MultipartConfig
@WebServlet(name = "Store", urlPatterns = { "/Store" })
public class Store extends HttpServlet {
    DAOCategorias dao = new DAOCategorias();
    DAOProductos daoProductos = new DAOProductos();
    DAOfertas daoOfertas = new DAOfertas();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "inicio";
        }

        switch (accion) {
            case "inicio":
                List<BeanCategorias> listaCategorias = dao.listar();
                request.setAttribute("listado", listaCategorias);

                List<BeanProductos> listaProductos = daoProductos.listar();
                request.setAttribute("lista", listaProductos);

                List<BeanOfertas> listaOferta = daoOfertas.listar();
                request.setAttribute("ListaOffer", listaOferta);

                request.getRequestDispatcher("store/index.jsp").forward(request, response);
                break;

            case "ofertas":
                List<BeanCategorias> listaCategoriasOfertas = dao.listar();
                request.setAttribute("listado", listaCategoriasOfertas);

                List<BeanProductos> listaProductos1 = daoProductos.listar();
                request.setAttribute("lista", listaProductos1);

                List<BeanOfertas> listaOferta1 = daoOfertas.listar();
                request.setAttribute("ListaOffer", listaOferta1);

                request.getRequestDispatcher("store/indexOfertas.jsp").forward(request, response);
                break;

            case "categoria":
                List<BeanCategorias> l = dao.listar();
                request.setAttribute("listado", l);

                List<BeanOfertas> listaOf = daoOfertas.listar();
                request.setAttribute("ListaOffer", listaOf);

                List<BeanProductos> ls = daoProductos.listarPorCategoria(request.getParameter("cate"));
                request.setAttribute("lista", ls);

                request.getRequestDispatcher("store/indexCategorias.jsp").forward(request, response);
                break;

            case "producto":

                int id = Integer.parseInt(request.getParameter("id"));
                BeanProductos BeanProducto = daoProductos.buscar(id);
                request.setAttribute("BeanProducto", BeanProducto);

                
                List<BeanCategorias> ls1 = dao.listar();
                request.setAttribute("listado", ls1);

                List<BeanProductos> listaProducts = daoProductos.listar();
                request.setAttribute("listaProducts", listaProducts);

                BeanOfertas bOfer = daoOfertas.buscar(BeanProducto.getId());
                request.setAttribute("bOfer", bOfer);

                String img= daoProductos.obtenerImg(id);
                request.setAttribute("img", img);

                request.getRequestDispatcher("store/producto.jsp").forward(request, response);

                break;

            default:
                List<BeanCategorias> categorias2 = dao.listar();
                request.setAttribute("listado", categorias2);

                List<BeanProductos> listaProducto = daoProductos.listar();
                request.setAttribute("lista", listaProducto);

                List<BeanOfertas> listaO = daoOfertas.listar();
                request.setAttribute("ListaOffer", listaO);

                request.getRequestDispatcher("store/index.jsp").forward(request, response);
                break;
        }

    }

}
