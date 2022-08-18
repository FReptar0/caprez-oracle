<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%@ include file="views/formOffer.jsp" %>
</div>
</body>
    <%
        }
    %>
</html>