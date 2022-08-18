<%@ page contentType="text/html;charset=UTF-8" language="java" %>

  <html lang="es">

  <head>
    <%@ include file="views/head.jsp" %>
  </head>

  <style>
    header {
      background-color: #ccc;
      margin: 0;
      padding: 0;
    }

    .busqueda {
      margin: 0 auto;
      width: 100%;
      display: block !important;
    }

    li a {
      color: rgb(51, 51, 51) !important;
    }

    li a:hover {
      color: #000 !important;
      transition: .3s;
      transform: scale(1.1);
    }

    .dropdown-menu .dropdown-item:hover {
      transition: 0s;
      transform: scale(1);
    }
  </style>

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
    <div class="container">
      <%@ include file="views/adminInd.jsp" %>
    </div>
  </body>
  <%
    }
  %>
  </html>