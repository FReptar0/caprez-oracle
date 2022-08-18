<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <html lang="en">

      <head>
        <%@ include file="views/head.jsp" %>
        <meta charset="utf-8">
      </head>

      <body>
        <%@ include file="views/header.jsp" %>
          <style>
            .container-carrusel {
              width: 80%;
              margin: 0 auto;
            }
          </style>
          <style>
            .gridCards {
              /* DIV que almacena todas las tarjetas */
              display: grid;
              grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
              /* auto-fit: auto-ajusta el tamaño de las tarjetas */
              justify-content: space-around;
              /* Alinear las tarjetas en el eje X */
              margin-top: 5%;
              /* Alejarlo del tope */
              margin-left: auto;
              margin-right: auto;
            }

            /*CSS de la Tarjeta*/

            .card {
              /* DIV de la tarjea completa */
              width: 300px;
              margin-top: 2rem;
              z-index: 9999;
              margin: 0 auto;
              transition: .3s;
            }

            .alertIcon {
              /* Icono ALERTA */

              position: absolute;
              top: -5%;
              right: -5%;
              z-index: 9999;
              /* Posicionamiento sobre todo */
              color: rgb(255, 32, 32);
              /* Color del icono */
              background-color: white;
              /* Cambiar el relleno del icono para que no sea transparente */
              border-radius: 50%;
              /* Redondear el div */
            }

            .containerImg {
              /*DIV que contiene la img*/
              height: 100%;
              width: 100%;
              justify-content: center;
              border-bottom: 2px solid #cccccc;
            }

            .card-img-top {
              /*Es la img*/
              padding-top: 20px;
              padding-left: 20px;
              padding-right: 20px;
              width: 100%;
              height: 250px;
              max-height: 250px;
              margin-bottom: 2%;
            }

            .card:hover {
              /*Animación de la tarjeta*/
              box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, .2);
              transition: .2s;
              transform: scale(1.1);
            }

            #titleCard {
              /* DIV que muestra el título de la card */
              text-decoration: underline;
              text-align: center;
              margin-top: 5%;

            }

            .description {
              /* DIV que almacena dIzq y dDer */
              display: inline-block;
              width: 100%;
              margin-top: 10px;
            }

            .dIzq {
              /*DIV que donde se muestra talla y Categoría */
              width: 50%;
              height: 100%;
              float: left;
              padding: 10px;
            }

            .dDer {
              /* DIV que muestra el precio */
              width: 50%;
              height: 100%;
              float: right;
              text-align: center;
              padding: 10px;
            }

            a.card {
              text-decoration: none;
              color: #000;
            }
          </style>
          <div class="container-carrusel mt-2">
            <%@ include file="views/carrusel.jsp" %>

          </div>
          <div class="gridCards container">
            <c:forEach var="lista" items="${lista}">
              <c:if test="${lista.getEstado()}">
                <a class="card m-3" href="Store?accion=producto&id=${lista.getId()}">
                  <!-- DIV de la tarjeta -->
                  <c:if test="${lista.getId_oferta() > 0}">
                    <div class="alertIcon">
                      <!-- Icono ALERTA bootstrap -->
                      <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                        class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                          d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                      </svg>
                    </div>
                  </c:if>
                  <div class="containerImg p-3" style="width: 250px; height: 250px; margin:0 auto;">
                    <img src="data:image/*;base64, ${lista.image}" style="width:100%; height: 100%"
                         alt="Avatar" />
                  </div>
                  <div class="seccion-inferior p-2">
                    <div class="nameItem">
                      <!-- Titulo del item-->
                      <h3 class="card-title" style="text-align: center;" id="titleCard m-3">
                        <c:out value="${lista.getTitulo()}"></c:out>
                      </h3>
                    </div>
                    <div class="description">
                      <!-- Descripcion del item -->
                      <h5 class="card-title">
                        Categor&iacute;a: <c:out value="${lista.getCategoria()}"></c:out>
                      </h5>
                      <h5 class="card-title">
                        Precio: $<c:out value="${lista.getPrecioMin()}"></c:out>
                        <c:if test="${lista.getPrecioMax() > 0}"> - $<c:out value="${lista.getPrecioMax()}"></c:out>
                        </c:if>
                      </h5>
                    </div>
                  </div>
                </a>
              </c:if>
            </c:forEach>
          </div>
      </body>

      </html>