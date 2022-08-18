<style>
    /*CSS Code Here*/
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


    .group {
        margin-top: 2rem;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
    }

    .buttons {
        margin-top: 2rem;
        margin-left: auto;
        margin-right: auto;
        justify-content: space-around;
    }

    .submit {
        margin-left: auto;
        margin-right: auto;
    }

    .formButtons {
        margin-top: 2%;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
        width: 70%;
    }
</style>
<!-- HTML Code Here -->
<script>
    function showAlertEditAdmin() {
        Swal.fire({
            title: '&#191;Est&aacute;s seguro?',
            html: '<p>&#191;Seguro que deseas modificar a este Administrador?</p>',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#FFF000', /* Verde  00D427*/
            cancelButtonColor: '#d33', /* Rojo d33 */ /*  Amarillo FFF000 */
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.formEditAdmin.submit();
                Swal.fire(
                    'Modificado!',
                    'Ha sido modificado el  Administrador',
                    'success'
                )
            } else {
                Swal.fire(
                    'Cancelado!',
                    'No se ha modificado el Administrador',
                    'error'
                )
            }
        })
    }
</script>
<div class="contenedor titulo-form">
    <h1>Editar Administrador</h1>
</div>
<div class="contenedor">
    <form action="ServletAdmin" method="post" name="formEditAdmin">
        <input type="hidden" name="id" value="${BeanAdmins.getId()}">
        <div class="group">
            <label class="form-label" for="adminName">
                <h3>Nombre*</h3>
            </label>
            <input type="text" name="nombre" class="form-control" id="adminName" value="${BeanAdmins.getNombre()}"
                required>
        </div>
        <div class="group">
            <label class="form-label" for="adminName">
                <h3>Apellido*</h3>
            </label>
            <input type="text" name="apellido" class="form-control" id="adminName" value="${BeanAdmins.getApellido()}"
                required>
        </div>
        <div class="group">
            <label class="form-label" for="adminUser">
                <h3>Correo*</h3>
            </label>
            <input type="email" name="usuario" class="form-control" id="adminUser" value="${BeanAdmins.getUsuario()}"
                required>
        </div>
        <div class="group">
            <label class="form-label" for="adminPass">
                <h3>Contrase&ntilde;a*</h3>
            </label>
            <input type="password" value="${BeanAdmins.getContra()}" class="form-control" id="adminPass" required pattern="[a-zA-Z0-9]{8,254}">
        </div>
        <input type="hidden" name="accion" value="actualizar">
        <div class="formButtons">
            <button style="width: 57%; margin-top: 50px;" type="button"
                class="btn btn-success" onclick="showAlertEditAdmin()">Guardar</button>
        </div>
    </form>
</div>