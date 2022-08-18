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
    input[type="file"] {
        display: none;
    }

    #imagen-producto {
        display: block;
        position: relative;
        background-color: #008B8B;
        color: #ffffff;
        font-size: 18px;
        text-align: center;
        width: 300px;
        padding: 18px 0;
        margin: auto;
        border-radius: 5px;
        cursor: pointer;
    }

    .contenedor p {
        text-align: center;
        margin: 20px 0 30px 0;
    }

    #images {
        width: 90%;
        position: relative;
        margin: auto;
        display: flex;
        justify-content: space-evenly;
        gap: 20px;
        flex-wrap: wrap;
    }

    figure {
        width: 45%;
    }

    img {
        width: 100%;
    }

    figcaption {
        text-align: center;
        font-size: 2.4vmin;
        margin-top: 0.5vmin;
    }

    /***************checkbox*************/
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


    input[type="checkbox"] {
        appearance: none;
        -webkit-appearance: none;
        height: 30px;
        width: 30px;
        background-color: #d5d5d5;
        border-radius: 5px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        outline: none;
        margin-left: 20px;
    }

    .check-label {
        color: #4c4c4c;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-left: 15px;
    }

    .check-talla {
        color: #4c4c4c;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-left: 5px;
        margin-right: 10px;
    }

    input[type="checkbox"]:after {
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        content: "\f00c";
        font-size: 20px;
        color: white;
        display: none;
    }

    input[type="checkbox"]:hover {
        background-color: #a5a5a5;
    }

    input[type="checkbox"]:checked {
        background-color: #008B8B;
    }

    input[type="checkbox"]:checked:after {
        display: block;
    }

    button {
        margin-top: 10px;
    }
</style>
<div class="contenedor titulo-form">
    <h1>Editar Producto</h1>
</div>
<form action="ServletProductos" method="post" name="formEditProducto">
    <div class="contenedor">
        <div class="row">
            <div class="col-lg-6">
                <input type="hidden" name="id" value="${BeanProductos.getId()}">
                <h4>T&iacute;tulo del producto*</h4>
                <div class="input-group input-group-lg">
                    <input required name="titulo" type="text" class="form-control"
                        aria-describedby="inputGroup-sizing-lg" value="${BeanProductos.getTitulo()}">
                </div>

                <h4>Precio m&iacute;nimo*</h4>
                <div class="input-group mb-3">
                    <input required name="precioMin" type="number" class="form-control"
                        aria-describedby="inputGroup-sizing-default" value="${BeanProductos.getPrecioMin()}">
                </div>
                <h4>Precio m&aacute;ximo</h4>
                <div class="input-group mb-3">
                    <input name="precioMax" type="number" class="form-control"
                        aria-describedby="inputGroup-sizing-default" value="${BeanProductos.getPrecioMax()}">
                </div>
                <h4>Cantidad en Stock*</h4>
                <div class="input-group mb-3">
                    <input required name="stock" type="number" class="form-control"
                        aria-describedby="inputGroup-sizing-default" value="${BeanProductos.getStock()}">
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
                <input required type="text" id="descripcion_corta" name="descripcion"
                    value="${BeanProductos.getDescripcionProducto()}">
                <script>
                    $(document).ready(function () {
                        $('#descripcion_corta').richText();
                    });
                </script>
                <h4>M&aacute;s informaci&oacute;n*</h4>
                <input required type="text" id="descripcion_larga" name="masinfo" value="${BeanProductos.getMasInfo()}">
                <script>
                    $(document).ready(function () {
                        $('#descripcion_larga').richText();
                    });
                </script>
            </div>
        </div>
        <input type="hidden" name="accion" value="actualizar">
        <div class="container-fluid" style="text-align: center; margin-top: 30px">
            <button style="width: 55%;" class="btn btn-success btn-lg" type="button"
                onclick="showAlertEditProducto()">Actualizar</button>
        </div>
    </div>
</form>

<script>
    function showAlertEditProducto() {
        Swal.fire({
            title: '&#191;Est&aacutes seguro?',
            text: 'Seguro que desea modificar el Producto?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00D427',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.formEditProducto.submit();
                Swal.fire(
                    'Modificado!',
                    'Ha sido modificada un Producto.',
                    'success'
                )
            } else {
                Swal.fire(
                    'Cancelado!',
                    'No se ha modificado el Producto.',
                    'error'
                )
            }
        })
    }
</script>