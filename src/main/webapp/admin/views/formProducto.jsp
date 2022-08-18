<script src="../../js/alertas.js"></script>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
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

    .titulo-form {
        text-align: center;
        background-color: #191970 !important;
        color: #ffffff;
    }

    h4 {
        margin-top: 30px;
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
        margin-top: 8px;
        margin-left: 7px;
    }

    button {
        margin-top: 10px;
    }
</style>
<div class="contenedor titulo-form">
    <h1>Agregar Producto</h1>
</div>
<form action="ServletProductos" name="formProducto" method="post" id="form" enctype="multipart/form-data">
    <div class="contenedor">
        <div class="container mt-3 w-100">
            <div class="card shadow-sm w-100">
                <div class="card-header d-flex justify-content-center">
                    <h4 id="img-upload">Im&aacute;genes del producto</h4>
                    <!-- input type file -->

                    <input type="file" class="form-control" style="margin-top: 5vh;" name="Imagen" id="Imagen" onchange="image_select()">

                </div>
                <div class="car-body d-flex flex-wrap justify-content-start" id="container">
                </div>
            </div>
        </div>


        <!-- input type TITULOOO -->

        <div class="row">
            <div class="col-lg-6">
                <h4>T&iacute;tulo del producto*</h4>
                <div class="input-group input-group-lg">
                    <input required placeholder="Playera UTEZ" name="titulo" type="text" class="form-control"
                        aria-describedby="inputGroup-sizing-lg">
                </div>



                <!-- radio CATEGORIA -->
                <h4>Categor&iacute;a*</h4>
                <div class="row">
                    <div class="col-6">
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


                <!-- checbox PRECIO MINIMO -->
                <h4>Precio m&iacute;nimo*</h4>

                <div class="input-group mb-3">
                    <input required name="precioMin" type="number" class="form-control"
                        aria-describedby="inputGroup-sizing-default">
                </div>
                <!-- checbox PRECIO MAXIMO -->

                <h4>Precio m&aacute;ximo</h4>
                <div class="input-group mb-3">
                    <input name="precioMax" type="number" class="form-control"
                        aria-describedby="inputGroup-sizing-default">
                </div>
                <!-- checbox PRECIO STOCK -->

                <h4>Cantidad en Stock*</h4>
                <div class="input-group mb-3">
                    <input required name="stock" type="number" class="form-control"
                        aria-describedby="inputGroup-sizing-default">
                </div>
                <h4>Ofertas:</h4>
                <div class="input-group mb-3">

                    <c:forEach var="lis" items="${lis}">
                        <div class="checks">
                            <input type="radio" value="${lis.getId()}" name="offer" id="${lis.getTitulo()}">
                            <label for="${lis.getTitulo()}" class="check-label">
                                <c:out value="${lis.getTitulo()}"></c:out>
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-6">


                <h4>Descripci&oacute;n*</h4>
                <style>
                </style>

                <!--        DESCRIPCION    -->

                <input required name="descripcion_corta" type="text" id="descripcion_corta">
                <script>
                    $(document).ready(function () {
                        $('#descripcion_corta').richText();
                    });
                </script>
                <h4>M&aacute;s informaci&oacute;n*</h4>
                <input required type="text" name="descripcion_larga" id="descripcion_larga">
                <script>
                    $(document).ready(function () {
                        $('#descripcion_larga').richText();
                    });
                </script>
            </div>
        </div>
        <div class="container-fluid" style="text-align: center; margin-top: 30px">
            <input type="hidden" name="accion" value="guardar">
            <button style="width: 55%;" name="accion" value="guardar" class="btn btn-success btn-lg" type="button"
                onclick="showAlertProducto()">Guardar</button>
        </div>
    </div>
</form>

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
    function showAlertProducto() {
        Swal.fire({
            title: '&#191;Est&aacutes seguro?',
            html: '<p>&#191;Seguro que deseas agregar este Producto?</p>',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00D427',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.formProducto.submit();
                document.formImgs.submit();
                Swal.fire(
                    'Agregado!',
                    'Ha sido agregado un Producto.',
                    'success'
                )
            } else {
                Swal.fire(
                    'Cancelado!',
                    'No se ha agregado el Producto.',
                    'error'
                )
            }
        })
    }
</script>