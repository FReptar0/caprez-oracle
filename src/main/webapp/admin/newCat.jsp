<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <html lang="en">

  <head>
    <%@ include file="views/head.jsp" %>
  </head>
  <%
    session = request.getSession();
    String usuarioSession = (String) session.getAttribute("usuario");
    if (usuarioSession == null) {
      request.getRequestDispatcher("admin/noSession.jsp").forward(request, response);
    }
    else{
  %>

  <body>
    <%@ include file="views/headerAdmin.jsp" %>

      <div class="container">
        <%@ include file="views/formCat.jsp" %>
      </div>
  </body>
  <%
    }
  %>

  </html>