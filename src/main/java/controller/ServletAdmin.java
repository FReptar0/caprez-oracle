package controller;

/* Jala */
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanAdmins;
import model.DAOAdmins;

@WebServlet(name = "ServletAdmin", urlPatterns = { "/ServletAdmin" })
public class ServletAdmin extends HttpServlet {
    DAOAdmins dao = new DAOAdmins();
    BeanAdmins ba = new BeanAdmins();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                List<BeanAdmins> lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("admin/administradores.jsp").forward(request, response);
                break;

            case "agregar":
                request.getRequestDispatcher("admin/newAdmin.jsp").forward(request, response);
                break;

            case "guardar":
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String usuario = request.getParameter("usuario");
                String contra = request.getParameter("contra");
                ba.setId(0);
                ba.setNombre(nombre);
                ba.setApellido(apellido);
                ba.setUsuario(usuario);
                ba.setContra(contra);
                dao.agregar(ba);

                request.getRequestDispatcher("ServletAdmin?accion=listar").forward(request, response);

                break;

            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                BeanAdmins bean = dao.listarId(id);
                request.setAttribute("BeanAdmins", bean);
                request.getRequestDispatcher("admin/editAdmin.jsp").forward(request, response);
                break;

            case "actualizar":
                BeanAdmins ba = new BeanAdmins();

                long id1 = Integer.parseInt(request.getParameter("id"));
                String nombre1 = request.getParameter("nombre");
                String apellido1 = request.getParameter("apellido");
                String usuario1 = request.getParameter("usuario");

                ba.setId(id1);
                ba.setNombre(nombre1);
                ba.setApellido(apellido1);
                ba.setUsuario(usuario1);
                dao.actualizar(ba);
                request.getRequestDispatcher("ServletAdmin?accion=listar").forward(request, response);
                break;

            case "eliminar":
                int id2 = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(id2);
                request.getRequestDispatcher("ServletAdmin?accion=listar").forward(request, response);
                break;

            default:
                List<BeanAdmins> lista2 = dao.listar();
                request.setAttribute("lista", lista2);
                request.getRequestDispatcher("admin/administradores.jsp").forward(request, response);
                break;
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("action");

        if (accion == null) {
            List<BeanAdmins> lista = dao.listar();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/administradores.jsp").forward(request, response);
        }

        if (accion.equals("listar")) {
            List<BeanAdmins> lista = dao.listar();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("admin/administradores.jsp").forward(request, response);
        }
        if (accion.equals("agregar")) {
            request.getRequestDispatcher("admin/newAdmin.jsp").forward(request, response);
        }
    }
}