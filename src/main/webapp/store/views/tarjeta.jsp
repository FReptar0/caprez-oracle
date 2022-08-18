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
</style>

<div class="gridCards">

    <c: if test="${lista.getEstado != false}">
        <c:if test="${lista.getDescripcionOferta() != null}">
            <div class="card m-3">
                <!-- DIV de la tarjeta -->
                <div class="alertIcon">
                    <!-- Icono ALERTA bootstrap -->
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                        class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                            d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                    </svg>
                </div>
                <div class="containerImg">
                    <img src="https://josefacchin.com/wp-content/uploads/2020/02/como-quitar-el-fondo-de-una-imagen.png"
                        class="card-img-top" alt="...">
                </div>
                <div class="seccion-inferior p-2">
                    <div class="nameItem">
                        <!-- Titulo del item-->
                        <h3 class="card-title" id="titleCard m-3"><c:out value="${lista.getTitulo()}"></c:out></h3>
                    </div>
                    <div class="description">
                        <!-- Descripcion del item -->
                        <div class="dIzq">
                            <h5 class="card-text">Categor&iacute;a</h5>
                            <h5 class="card-text">Precio m&iacute;nimo</h5>
                            <h5 class="card-text">Precio m&aacute;ximo</h5>
                        </div>
                        <div class="dDer">
                            <h5 class="card-title"><c:out value="${lista.getCategoria()}"></c:out></h5>
                            <h5 class="card-title"><c:out value="${lista.getPrecioMin()}"></c:out></h5>
                            <h5 class="card-title"><c:out value="${lista.getPrecioMax()}"></c:out></h5>
                        </div>
                    </div>
                </div>
            </div>
        </c: if>
    </c: if>


    <c: if test="${lista.getEstado == false}">
        <c:if test="${!(lista.getDescripcionOferta() != null)}">
            <div class="card m-3">
                <!-- DIV de la tarjeta -->
                <div class="containerImg">
                    <img src="https://josefacchin.com/wp-content/uploads/2020/02/como-quitar-el-fondo-de-una-imagen.png"
                        class="card-img-top" alt="...">
                </div>
                <div class="seccion-inferior p-2">
                    <div class="nameItem">
                        <!-- Titulo del item -->
                        <h3 class="card-title" id="titleCard m-3"><c:out value="${lista.getTitulo()}"></c:out></h3>
                    </div>
                    <div class="description">
                        <!-- Descripcion del item -->
                        <div class="dIzq">
                            <h5 class="card-text">Categor&iacute;a</h5>
                            <h5 class="card-text">Precio m&iacute;nimo</h5>
                            <h5 class="card-text">Precio m&aacute;ximo</h5>
                        </div>
                        <div class="dDer">
                            <h5 class="card-title"><c:out value="${lista.getCategoria()}"></c:out></h5>
                            <h5 class="card-title"><c:out value="${lista.getPrecioMin()}"></c:out></h5>
                            <h5 class="card-title"><c:out value="${lista.getPrecioMax()}"></c:out></h5>
                        </div>
                    </div>
                </div>
            </div>
        </c: if>
    </c: if>

</div>