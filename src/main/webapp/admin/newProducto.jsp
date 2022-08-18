<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <html lang="en">

            <head>
                <%@ include file="views/head.jsp" %>
                    <title>Formulario Producto</title>
                    <!-- formulario producto -->
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                    <%@ include file="views/richtext.jsp" %>
            </head>
            <%
        session = request.getSession();
        String usuarioSession = (String) session.getAttribute("usuario");
        if (usuarioSession == null) {
            request.getRequestDispatcher("noSession.jsp").forward(request, response);
        }
        else{
    %>
    <body>

        <%@ include file="views/headerAdmin.jsp" %>

                    <%@ include file="views/formProducto.jsp" %>

    </body>
    <%
        }
    %>
    </html>