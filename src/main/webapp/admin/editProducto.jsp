<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <html lang="en">

            <head>
                <%@ include file="views/head.jsp" %>
                    <!-- formulario producto -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                    <link rel="stylesheet" href="utils/css/richtext.min.css">
                    <%@ include file="views/richtext.jsp" %>
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

            <header class="p-3">
                <div class="container">
                    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                        <div class="img-center" style="margin: 0 auto;margin-bottom: 2vh;width: 20%;">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/5/54/Logo-utez.png" width="200vw" alt="404">
                        </div>
                        <div class="container-fluid pb-3">
                            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                                <li class="navbar-item">
                                    <a href="inicio" class="nav-link" id="home" role="button">Inicio <svg xmlns="http://www.w3.org/2000/svg"
                                                                                                          width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                        <path fill-rule="evenodd"
                                              d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                                    </svg>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        Productos
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="ServletProductos?action=listar">Ver productos</a></li>
                                        <li><a class="dropdown-item" href="ServletProductos?action=agregar">Agregar producto</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        Categor&iacute;as
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="ServletCategorias?action=listar">Ver categor&iacute;as</a></li>
                                        <li><a class="dropdown-item" href="ServletCategorias?action=agregar">Agregar categor&iacute;a</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        Ofertas
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="ServletOfertas?action=Ofertas">Ver ofertas</a></li>
                                        <li><a class="dropdown-item" href="ServletOfertas?action=agregar">Agregar ofertas</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        Administradores
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="ServletAdmin?action=listar">Ver administradores</a></li>
                                        <li><a class="dropdown-item" href="ServletAdmin?action=agregar">Agregar administrador</a></li>
                                    </ul>
                                </li>
                                <li class="navbar-item">
                                    <a href="#" class="nav-link" id="logout" role="button">Cerrar sesi&oacute;n <svg
                                            xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z" />
                                        <path fill-rule="evenodd"
                                              d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z" />
                                    </svg>
                                    </a>
                                </li>
                            </ul>
                        </div>
            </header>

                    <div class="container">
                        <%@ include file="views/formEditProducto.jsp" %>
                    </div>
            </body>
            <%
                }
            %>
            </html>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>