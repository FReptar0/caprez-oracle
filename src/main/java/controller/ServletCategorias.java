package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanCategorias;
import model.DAOCategorias;

@WebServlet(name = "/ServletCategorias", urlPatterns = { "/ServletCategorias" })
public class ServletCategorias extends HttpServlet {

    DAOCategorias dao = new DAOCategorias();
    BeanCategorias bca = new BeanCategorias();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                List<BeanCategorias> lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
                break;

            case "agregar":
                request.getRequestDispatcher("admin/newCat.jsp").forward(request, response);
                break;

            case "guardar":
                String estado = request.getParameter("estado");
                String categoria = request.getParameter("category");
                bca.setId(0);
                if (estado.equals("1")) {
                    bca.setStatus(true);
                } else {
                    bca.setStatus(false);
                }

                bca.setCategoria(categoria);
                dao.agregar(bca);
                request.getRequestDispatcher("ServletCategorias?accion=listar").forward(request, response);
                break;

            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                BeanCategorias bean = dao.listarId(id);
                request.setAttribute("BeanCategorias", bean);
                request.getRequestDispatcher("admin/editCat.jsp").forward(request, response);
                break;

            case "actualizar":
                BeanCategorias bca = new BeanCategorias();

                int id1 = Integer.parseInt(request.getParameter("id"));
                String categoria1 = request.getParameter("category");
                String estado1 = request.getParameter("estado");

                bca.setId(id1);
                if (estado1.equals("1")) {
                    bca.setStatus(true);
                } else {
                    bca.setStatus(false);
                }
                bca.setCategoria(categoria1);
                dao.actualizar(bca);
                request.getRequestDispatcher("ServletCategorias?accion=listar").forward(request, response);
                break;

            case "eliminar":
                int id2 = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(id2);
                request.getRequestDispatcher("ServletCategorias?accion=listar").forward(request, response);
                break;

            case "visibilidadTrue":
                BeanCategorias bca1 = new BeanCategorias();
                int id3 = Integer.parseInt(request.getParameter("id"));

                bca1.setId(id3);
                bca1.setStatus(true);
                dao.visibilidad(bca1);
                request.getRequestDispatcher("ServletCategorias?accion=listar").forward(request, response);
                break;

            case "visibilidadFalse":
                BeanCategorias bca2 = new BeanCategorias();
                int id4 = Integer.parseInt(request.getParameter("id"));

                bca2.setId(id4);
                bca2.setStatus(false);
                dao.visibilidad(bca2);
                request.getRequestDispatcher("ServletCategorias?accion=listar").forward(request, response);
                break;

            default:
                List<BeanCategorias> lista2 = dao.listar();
                request.setAttribute("lista", lista2);
                request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("action");
        if (accion == null) {
            List<BeanCategorias> lista = dao.listar();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
        }

        if (accion.equals("listar")) {
            List<BeanCategorias> lista = dao.listar();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
        }

        if (accion.equals("agregar")) {
            request.getRequestDispatcher("admin/newCat.jsp").forward(request, response);
        }
    }
}
