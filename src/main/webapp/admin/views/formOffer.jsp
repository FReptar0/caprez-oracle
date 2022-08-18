<style>
    /* Estilos del Formulario */

    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    .titulo-form {
        text-align: center;
        background-color: #191970 !important;
        color: #ffffff;
    }

    #logo {
        width: 15%;
    }

    .contenedor {
        background-color: #f5f8ff;
        border: 1px solid #191970;
        width: 70%;
        min-width: 290px;
        position: relative;
        margin: 50px auto;
        padding: 50px 20px;
        border-radius: 7px;
        box-shadow: 0 20px 35px rgba(0, 0, 0, 0.05);
    }

    .photo-calendar {
        display: grid;
        grid-template-columns: 50% 50%;
        justify-content: space-between;
    }


    .photo {
        width: 90%;
        text-align: center;

    }

    .group {
        margin-top: 2%;
    }

    .photo-calendar {
        margin-top: 2%;
    }

    /* Estilo Botones */

    .formButtons {
        margin-top: 2%;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
        width: 70%;
    }

    /******************************* input type file ********************************/
    .image_container {
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 15px;
        height: 120px;
        width: 200px;
        overflow: hidden;
    }

    .image_container img {
        height: 100%;
        width: auto;
        object-fit: cover;
    }

    .image_container span {
        top: -6px;
        right: 15px;
        color: red;
        font-size: 28px;
        font-weight: normal;
        cursor: pointer;
    }

    #img-upload {
        margin-bottom: 25px;
        margin-right: 10px;
    }

    /***************radio buttons*************/

    .checks {
        height: 60px;
        width: 100%;
        position: relative;
        margin: auto;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        display: flex;
        align-items: center;
    }

    .check-label {
        color: #4c4c4c;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-left: 15px;
    }
</style>

<!-- HTML Code Here-->
<div class="contenedor titulo-form">
    <h1>Agregar Ofertas</h1>
</div>
<div class="contenedor">
    <!-- Contenedor General -->
    <!-- ETIQUETA FOOOOORM.......................................................... -->
    <form action="ServletOfertas" method="post" name="formOffer" id="form" enctype="multipart/form-data">
        <div class="group">
            <!-- Contenedor Titulo y Descripcción -->

            <!-- TITULOOOOO.......................................................-->
            <label for="offerTitle" class="form-label">
                <h2>T&iacute;tulo de la Oferta*</h2>
            </label>
            <input type="text" class="form-control" id="offerTitle" name="offerTitle" placeholder="2X1" required>
        </div>
        <div class="group">
            <!-- DESCRIPCION........................................................-->
            <label for="offerDescription" class="form-label">
                <h3>Descripci&oacute;n de la Oferta*</h3>
            </label>
            <textarea class="form-control" id="offerDescription" name="offerDescription" rows="5"
                      placeholder="Dos productos al precio de uno" required></textarea>
        </div>

        <!-- CATEGORIAS................................................................-->
        <div class="group">
            <h3>Categor&iacute;a participante:</h3>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <!-- radio CATEGORIA -->
                <div class="row">
                    <div class="col-12">
                        <c:forEach var="listado" items="${listado}">
                            <div class="checks">
                                <c:if test="${listado.getStatus()}">

                                    <input type="radio" value="${listado.getId()}" name="cat"
                                        id="${listado.getCategoria()}">
                                    <label for="${listado.getCategoria()}" class="check-label">
                                        <c:out value="${listado.getCategoria()}"></c:out>
                                    </label>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-5 imgmg col-md-12">
                <!-- input type file -->
                <div class="container mt-3" style="width:57vw">
                    <div class="card shadow-sm mb-3">
                        <div class="card-header d-flex justify-content-between">

                            <!-- IMAGEEEEN..................................................................-->
                            <h4 id="img-upload">Imagenes del producto</h4>
                            <input type="file" name="Imagen" id="Imagen" class="form-control" onchange="image_select()">
                        </div>
                        <div class="car-body d-flex flex-wrap justify-content-start" id="container">
                        </div>
                    </div>
                </div>
                <!-- input type file end -->
            </div>

            <style>
                .date {
                    width: 100%;
                    text-align: center;
                }
            </style>
        </div>

        <div class="row">
            <div class="row date mb-3">
                <div class="col-md-6">
                    <div class="dates">
                        <label for="firstDate" class="form-label">
                            <h3>Fecha de Inicio </h3>
                        </label>

                        <!-- FECHA INICIOOOOOOOOO.........................................................-->
                        <input type="date" class="form-control" id="firstDate" name="offerDateInc" placeholder="Fecha de Inicio">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="dates">
                        <label for="lastDate" class="form-label">
                            <h3>Fecha de Fin </h3>
                        </label>
                        <!-- FECHA FINAAAAAAAL.................................................................-->
                        <input type="date" class="form-control" id="lastDate" name="offerDateFin" placeholder="Fecha de Fin">
                    </div>
                </div>
            </div>
        </div>

        <!-- ENVIAR DATOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOS-->
        <input type="hidden" name="accion" value="guardar">
        <div class="formButtons">

            <button style="width: 57%;" type="button" class="btn btn-success btn-lg"
                    onclick="showAlertOferta()">Agregar</button>
        </div>
    </form>
</div>

<!-- script del documentos para las imagenes -->
<!-- script del documentos para las imagenes -->
<script>
    var images = [];

    function image_select() {
        var image = document.getElementById('image').files;
        for (i = 0; i < image.length; i++) {
            if (check_duplicate(image[i].name)) {
                images.push({
                    "name": image[i].name,
                    "url": URL.createObjectURL(image[i]),
                    "file": image[i],
                })
            } else {
                alert(image[i].name + " ya fue agregada");
            }
        }
        document.getElementById('form').reset();
        document.getElementById('container').innerHTML = image_show();
    }

    function image_show() {
        var image = "";
        images.forEach((i) => {
            image += `<div class="image_container d-flex justify-content-center position-relative">
          <img src="`+ i.url + `" alt="Image">
          <span class="position-absolute" onclick="delete_image(`+ images.indexOf(i) + `)">&times;</span>
      </div>`;
        })
        return image;
    }

    function delete_image(e) {
        images.splice(e, 1);
        document.getElementById('container').innerHTML = image_show();
    }

    function check_duplicate(name) {
        var image = true;
        if (images.length > 0) {
            for (e = 0; e < images.length; e++) {
                if (images[e].name == name) {
                    image = false;
                    break;
                }
            }
        }
        return image;
    }
</script>

<script>
    function showAlertOferta() {
        Swal.fire({
            title: '&#191;Est&aacutes seguro?',
            text: 'Seguro que desea agregar una nueva Oferta?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00D427',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.formOffer.submit();
                Swal.fire(
                    'Agregado!',
                    'Ha sido agregada una Oferta.',
                    'success'
                )
            } else {
                Swal.fire(
                    'Cancelado!',
                    'No se ha agregado la Oferta.',
                    'error'
                )
            }
        })
    }
</script>

