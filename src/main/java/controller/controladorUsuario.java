package controller;
import model.DaoUsuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controladorUsuario", urlPatterns = { "/controladorUsuario" })
public class controladorUsuario extends HttpServlet {
    HttpSession session;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoUsuario dao = new DaoUsuario();
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        int res = dao.validar(usuario, contrasena);
        String admin = "A";
        String sAdmin="SA";
        session = request.getSession();
        /* String usuarioSession = (String) session.getAttribute("usuario"); */
        if (res == 1) {
            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", admin);
            System.out.println("El admin es:" + session.getAttribute("usuario")); //Imprime el usuario en consola
            System.out.println("El rol del admin es: "+session.getAttribute("rol"));
            request.getRequestDispatcher("inicio").forward(request, response);
        }else if (res == 5) {
            request.getRequestDispatcher("admin/error.jsp").forward(request, response);
            dao.bloquear(usuario);
        }else if(res==6){
            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", sAdmin);
            System.out.println("El SuperAdmin es:" + session.getAttribute("usuario")); //Imprime el usuario en consola
            System.out.println("Rol "+ session.getAttribute("rol")); //Imprime el rol en consola
             request.getRequestDispatcher("inicio").forward(request, response);
        }else{
            request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        
    }

    

}