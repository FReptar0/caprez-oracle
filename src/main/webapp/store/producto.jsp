<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <html lang="en">

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
                <title>Producto</title>
            </head>
            <style>
                #contenedor {
                    margin-bottom: 30px;
                }

                #contenedor-img {
                    margin: 0 auto;
                    margin-top: 5vh;
                    text-align: center;
                    background-color: white;
                }

                .informacion {
                    margin: 0 auto;
                }

                #titulo {
                    padding-bottom: 40px;
                    font-size: 2.8em;
                    padding-top: 7vh;
                    text-align: center;
                }

                #disponibilidad {
                    padding-top: 1vh;
                    padding-left: 7vh;
                    color: green;
                }

                .desc {
                    padding-left: 7vh;
                    padding-top: 4vh;
                }

                #desc_c {
                    padding-left: 3vh;
                    padding-right: 2vh !important;
                }

                #precio {
                    font-size: 3em;
                    padding-left: 7vh;
                    margin-bottom: 0;
                }

                select {
                    border-radius: 4px;
                }

                label {
                    font-size: 1.5em;
                }

                #desc-larga {
                    margin-top: 15px;
                    padding: 30px;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    text-align: justify;
                }

                #detalles {
                    width: 50%;
                    padding-right: 2vh !important;
                }

                #color,
                #talla {
                    width: 80%;
                }
            </style>

            <body>
                <%@ include file="views/header.jsp" %>
                    <div class="container-fluid" id="contenedor">
                        <div class="row">
                            <div class="col-md-6 col-lg-6 p-3" id="contenedor-img" style="width: 400px; height: 400px;margin-top: 10vh;">
                                <img src="data:image/*;base64, ${BeanProducto.image}" style="width:100%; height: 100%"
                                    alt="Avatar">
                            </div>
                            <div class="col-md-6 col-lg-6 p-0" style="margin-top: 5vh;">
                                <div class="informacion">
                                    <h1 class="mt-3" id="titulo">
                                        <c:out value="${BeanProducto.getTitulo()}"></c:out>
                                    </h1>
                                    <h3 id="disponibilidad">
                                        <c:if test="${BeanProducto.getEstado() && BeanProducto.getEstado_categoria()}">
                                            Disponible
                                        </c:if>
                                        <c:if test="${!BeanProducto.getEstado() || !BeanProducto.getEstado_categoria()}">
                                            No Disponible
                                        </c:if>
                                    </h3>
                                    <div class="desc">
                                        <h5 id="desc_c_titulo"><b> Descripci&oacute;n: </b></h5>
                                        <c:out value="${BeanProducto.getDescripcionProducto()}"></c:out>
                                    </div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 p-0" id="detalles">
                                                <h1 id="precio">$<c:out value="${BeanProducto.getPrecioMin()}">
                                                    </c:out>
                                                    <c:if test="${BeanProducto.getPrecioMax() > 0}"> - $
                                                        <c:out value="${BeanProducto.getPrecioMax()}">
                                                        </c:out>
                                                    </c:if>
                                                </h1>
                                            </div>
                                        </div>
                                        <c:if test="${BeanProducto.getId_oferta() > 0}">
                                            <div class="row mt-3">
                                                <div class="col-md-6 col-lg-6 p-0" id="detalles">
                                                    <h1>
                                                        <c:out value="${bOfer.getTitulo()}"></c:out>:
                                                    </h1>
                                                    <c:out value="${bOfer.getDescripcion()}"></c:out>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid" id="desc-larga">
                        <h3>Mas informaci&oacute;n:</h3>
                        <div>
                            <c:out value="${BeanProducto.getMasInfo()}"></c:out>
                        </div>
                    </div>
            </body>

            </html>