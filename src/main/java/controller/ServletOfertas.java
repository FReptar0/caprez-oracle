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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.BeanCategorias;
import model.BeanOfertas;
import model.DAOfertas;
import model.DAOCategorias;

@MultipartConfig
@WebServlet(name = "ServletOfertas", urlPatterns = {
        "/ServletOfertas"
})
public class ServletOfertas extends HttpServlet {

    String action;
    DAOfertas dao = new DAOfertas();
    BeanOfertas bof = new BeanOfertas();
    DAOCategorias daoCate = new DAOCategorias();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        action = request.getParameter("accion");
        switch (action) {
            case "listar-Offer":
                List<BeanOfertas> ListaOffer = dao.listar();
                // setear cada dato
                request.setAttribute("ListaOffer", ListaOffer);
                request.getRequestDispatcher("admin/ofertas.jsp").forward(request, response);
                break;
            case "agregar-Offer":
                List<BeanCategorias> listaCategorias = daoCate.listar();
                request.setAttribute("listado", listaCategorias);
                request.getRequestDispatcher("admin/newOffer.jsp").forward(request, response);
                break;
            case "guardar":
                String nomOffer = request.getParameter("offerTitle");
                String DesOffer = request.getParameter("offerDescription");
                String fechaInicio = request.getParameter("offerDateInc");
                String fechaFin = request.getParameter("offerDateFin");
                String catego = request.getParameter("cat");

                Part part = request.getPart("Imagen");
                InputStream inputStream = part.getInputStream();

                bof.setTitulo(nomOffer);
                bof.setDescripcion(DesOffer);
                bof.setFechaInicio(fechaInicio);
                bof.setFechaFin(fechaFin);
                bof.setCategoriaInsert(Integer.parseInt(catego));
                bof.setEstado(true);
                bof.setImg(inputStream);

                dao.agregar(bof);
                request.getRequestDispatcher("ServletOfertas?accion=listar-Offer").forward(request, response);
                break;

                case "visibilidadTrue":
                BeanOfertas bca1 = new BeanOfertas();
                int id3 = Integer.parseInt(request.getParameter("id"));

                bca1.setId(id3);
                bca1.setEstado(true);
                dao.visibilidad(bca1);
                request.getRequestDispatcher("ServletOfertas?accion=listar-Offer").forward(request, response);
                break;

            case "visibilidadFalse":
                BeanOfertas bca2 = new BeanOfertas();
                int id4 = Integer.parseInt(request.getParameter("id"));

                bca2.setId(id4);
                bca2.setEstado(false);
                dao.visibilidad(bca2);
                request.getRequestDispatcher("ServletOfertas?accion=listar-Offer").forward(request, response);
                break;

            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                BeanOfertas bean = dao.buscar(id);
                request.setAttribute("BeanOfertas", bean);
                request.getRequestDispatcher("admin/editOffer.jsp").forward(request, response);
                break;

            case "actualizar":
                int id1 = Integer.parseInt(request.getParameter("id"));
                String nomOffer1 = request.getParameter("offerTitle");
                String DesOffer1 = request.getParameter("offerDescription");
                String fechaInicio1 = request.getParameter("offerStartDate");
                String fechaFin1 = request.getParameter("offerEndDate");
                BeanOfertas bn = new BeanOfertas();
                bn.setTitulo(nomOffer1);
                bn.setDescripcion(DesOffer1);
                bn.setFechaInicio(fechaInicio1);
                bn.setFechaFin(fechaFin1);
                bn.setEstado(true);
                bn.setId(id1);
                dao.actualizar(bn);
                request.getRequestDispatcher("ServletOfertas?accion=listar").forward(request, response);
                break;


            default:
                request.getRequestDispatcher("ServletOfertas?accion=listar-Offer").forward(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "listar-Offer":
                List<BeanOfertas> lista = dao.listar();
                // setear cada dato
                request.setAttribute("ListaOffer", lista);
                request.getRequestDispatcher("admin/ofertas.jsp").forward(request, response);
                break;

            case "agregar-Offer":
                List<BeanCategorias> listaCategorias = daoCate.listar();
                request.setAttribute("listado", listaCategorias);
                request.getRequestDispatcher("admin/newOffer.jsp").forward(request, response);
                break;

            case "editar":
                request.getRequestDispatcher("admin/editOffer.jsp").forward(request, response);
                break;
            
            case "actualizar":
                request.getRequestDispatcher("ServletOfertas?accion=listar-Offer").forward(request, response);
                break;

            default:
                List<BeanOfertas> lista2 = dao.listar();
                // setear cada dato
                request.setAttribute("ListaOffer", lista2);
                request.getRequestDispatcher("admin/ofertas.jsp").forward(request, response);
                break;
        }
    }
}
