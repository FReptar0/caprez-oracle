<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
                    rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                    crossorigin="anonymous">
                <link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                    crossorigin="anonymous">
                <title>Administración</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <link rel="stylesheet" type="text/css"
                    href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

                <script type="text/javascript" charset="utf8"
                    src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
            </head>
            <style>
                table {
                    width: 100%;
                    margin: 0 auto;
                    margin-top: 25px;
                    text-align: center;
                }

                thead {
                    margin-top: 25px;
                }

                label {
                    margin-top: 25px;
                    margin-bottom: 25px;
                }

                table th {
                    margin-top: 25px;
                    border: 2px solid black;
                    padding: 10px;
                }


                .encabezado {
                    font-weight: bold;
                    font-size: 18px;
                    background-color: rgb(12, 177, 143);
                }

                .btn-success,
                .btn-warning,
                .btn-info {
                    width: 150px;
                    margin-left: 10px;
                }

                .btn-toolbar{
                    margin-left: 10%;
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
                        <div class="add_oferta mt-5">
                            <form action="ServletOfertas" method="post">
                                <button type="submit" class="btn btn-outline-success" id="agregar" type="submit"
                                    name="accion" value="agregar-Offer">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                        class="bi bi-plus-circle" viewBox="0 0 16 16">
                                        <path
                                            d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                        <path
                                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                    </svg> Agregar Oferta
                                </button>
                            </form>
                        </div>
                        <div class="table-responsive">
                            <table id="ofertas" class="display">
                                <thead>
                                    <tr>
                                        <th class="encabezado">#</th>
                                        <th class="encabezado">Imagen</th>
                                        <th class="encabezado">Nombre</th>
                                        <td class="encabezado">Descripcion</td>
                                        <th class="encabezado">Validez</th>
                                        <th class="encabezado">Estado</th>
                                        <th class="encabezado">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ListaOffer" items="${ListaOffer}" varStatus="status">
                                        <tr>
                                            <td>
                                                <c:out value="${status.count}"></c:out>
                                            </td>
                                            <td>
                                                <img src="data:image/*;base64, ${ListaOffer.image}" style="width: 80px;"
                                                    alt="Avatar" />
                                            </td>
                                            <td>
                                                <c:out value="${ListaOffer.getTitulo()}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${ListaOffer.getDescripcion()}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${ListaOffer.getFechaInicio()}"></c:out> - <c:out
                                                    value="${ListaOffer.getFechaFin()}"></c:out>
                                            </td>


                                            <c:if test="${ListaOffer.getEstado()}">
                                                <td>Habilitado</td>

                                            </c:if>
                                            <c:if test="${!ListaOffer.getEstado()}">
                                                <td>Deshabilitado</td>
                                            </c:if>
                                            <td>
                                                <form action="ServletOfertas" method="post">
                                                    <input type="hidden" name="id" value="${ListaOffer.getId()}">
                                                    <div class="btn-toolbar" role="toolbar"
                                                        aria-label="Toolbar with button groups">
                                                        <div class="btn-group" role="group" aria-label="First group">
                                                            <button type="submit" name="accion" value="editar"
                                                                class="btn btn-info" style="color: white;">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="25"
                                                                    height="25" fill="currentColor"
                                                                    class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                                    <path
                                                                        d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                                    <path fill-rule="evenodd"
                                                                        d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                                                </svg>
                                                            </button>
                                                        </div>
                                                        <c:if test="${!ListaOffer.getEstado()}">
                                                            <div class="btn-group" role="group"
                                                                aria-label="Second group">
                                                                <button type="submit" name="accion"
                                                                    value="visibilidadTrue" class="btn btn-success">
                                                                    Habilitar
                                                                </button>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${ListaOffer.getEstado()}">
                                                            <div class="btn-group" role="group"
                                                                aria-label="Third group">
                                                                <button type="submit" name="accion"
                                                                    value="visibilidadFalse" class="btn btn-warning">
                                                                    Deshabilitar
                                                                </button>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </form>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <script>
                        $(document).ready(function () {
                            $('#ofertas').DataTable();
                        });
                    </script>
            </body>
            <%
                }
            %>

            </html>