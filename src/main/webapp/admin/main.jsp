<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <%@ include file="views/head.jsp" %>    
    </head>
    <%
        session = request.getSession();
        String usuarioSession = (String) session.getAttribute("usuario");
        if (usuarioSession == null) {
            request.getRequestDispatcher("noSession.jsp").forward(request, response);
        }
        else{
    %>
    <body class="text-center">

        <h1>Aca todo bien</h1>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
    </body>
    <%
        }
    %>
    </html>