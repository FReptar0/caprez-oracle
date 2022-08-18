<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <%@ include file="views/head.jsp" %>
    </head>
    <%
        session = request.getSession();
        String usuarioSession = (String) session.getAttribute("usuario");
        String rolUser = (String) session.getAttribute("rol");
        if (usuarioSession == null) {
            request.getRequestDispatcher("noSession.jsp").forward(request, response);
        }
        else{
            if(rolUser=="SA"){
    %>

    <body>
        <%@ include file="views/headerAdmin.jsp" %>

            <div class="container">
                <%@ include file="views/formAdmin.jsp" %>
            </div>
    </body>
    <%
        }
        else{
            request.getRequestDispatcher("sinPermiso.jsp").forward(request, response);
        }
    }
        %>
    </html>