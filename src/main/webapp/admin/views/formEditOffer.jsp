<script src="../../js/alertas.js"></script>
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

    .lastDate {
        padding-left: 3%;
    }

    .photo {
        width: 90%;
        text-align: center;

    }



    .group {
        margin-top: 2%;
    }

    .dates {
        margin-top: 20px;
        margin-left: 8px;
        margin-bottom: 25px;
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
</style>

<!-- HTML Code Here-->
<div class="contenedor titulo-form">
    <h1>Editar Oferta</h1>
</div>
<div class="contenedor">
    <!-- Contenedor General -->
    <form action="ServletOfertas" method="post" name="formEditOffer">
        <input type="hidden" name="id" value="${BeanOfertas.getId()}">
        <div class="group">
            <!-- Contenedor Titulo y Descripcción -->
            <label for="offerTitle" class="form-label">
                <h2>T&iacute;tulo de la Oferta*</h2>
            </label>
            <input type="text" class="form-control" id="offerTitle" value="${BeanOfertas.getTitulo()}" name="offerTitle"
                required>
        </div>
        <div class="group">
            <label for="offerDescription" class="form-label">
                <h3>Descripci&oacute;n de la Oferta*</h3>
            </label>
            <textarea class="form-control" id="offerDescription" name="offerDescription" rows="5"
                value="${BeanOfertas.getDescripcion()}"
                required><c:out value="${BeanOfertas.getDescripcion()}"></c:out></textarea>
        </div>
        <div class="row">
            <div class="col-lg-5 imgmg col-md-12">
                <label for="offerPhoto" class="form-label">
                    <h3 style="margin-top: 20px;">Estado de la Oferta</h3>
                </label>
                <select class="form-select" aria-label="Estado" id="" name="estado">
                    <c:if test="${BeanOfertas.getEstado()}">
                        <option value="1" selected>Habilitada</option>
                        <option value="0">Deshabilitada</option>
                    </c:if>
                    <c:if test="${!BeanOfertas.getEstado()}">
                        <option value="1">Habilitada</option>
                        <option value="0" selected>Deshabilitada</option>
                    </c:if>
                </select>
            </div>


            <div class="col-lg-7 col-md-12">
                <div class="row date">
                    <div class="col-md-6">
                        <div class="dates">
                            <label for="firstDate" class="form-label">
                                <h3>Fecha de Inicio </h3>
                            </label>
                            <input type="date" class="form-control" id="firstDate" name="offerStartDate"
                                value="${BeanOfertas.getFechaInicio()}" id="firstDate">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="dates">
                            <label for="lastDate" class="form-label">
                                <h3>Fecha de Fin </h3>
                            </label>
                            <input type="date" class="form-control" value="${BeanOfertas.getFechaFin()}" id="lastDate" name="offerEndDate">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="accion" value="actualizar">
        <div class="formButtons">
            <button style="width: 57%;" type="button" class="btn btn-success btn-lg"
                onclick="showAlertEditOferta()">Actualizar</button>
        </div>
    </form>
</div>

<script>
    function showAlertEditOferta() {
        Swal.fire({
            title: '&#191;Est&aacutes seguro?',
            text: 'Seguro que desea modificar la Oferta?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00D427',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.formEditOffer.submit();
                Swal.fire(
                    'Modificado!',
                    'Ha sido modificada una Oferta.',
                    'success'
                )
            } else {
                Swal.fire(
                    'Cancelado!',
                    'No se ha modificado la Oferta.',
                    'error'
                )
            }
        })
    }
</script>