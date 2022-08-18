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

    .clear {
        margin-left: auto;
        margin-right: auto;
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
<div class="contenedor titulo-form">
    <h1>Agregar Administrador</h1>
</div>
<div class="contenedor">

    <form action="ServletAdmin" method="post" name="formAdmin">
        <div class="group">
            <label class="form-label" for="adminName">
                <h3>Nombre*</h3>
            </label>
            <input type="text" name="nombre" class="form-control" id="adminName" placeholder="Tomas" required="">
        </div>
        <div class="group">
            <label class="form-label" for="adminName">
                <h3>Apellido*</h3>
            </label>
            <input type="text" name="apellido" class="form-control" id="adminName2" placeholder="D&iacute;az"
                required="">
        </div>
        <div class="group">
            <label class="form-label" for="adminUser">
                <h3>Correo*</h3>
            </label>
            <input type="text" name="usuario" class="form-control" id="adminUser" placeholder="TomDia123" required="">
        </div>
        <div class="group">
            <label class="form-label" for="adminPass">
                <!-- Contraseña 1 -->
                <h3>Contrase&ntilde;a*</h3>
            </label>
            <input type="password" class="form-control" name="contra" id="adminPass"
                placeholder="Te acuerdas, mejor an&oacute;tala" required="" pattern="[a-zA-Z0-9]{8,254}"
                onkeyup="coincidirContrasena()"> <!-- Que solo se acepeten contraseñas alfanumericas  -->
        </div>
        <div class="group">
            <label class="form-label" for="adminPassR">
                <!-- Contraseña 2 -->
                <h3> Repita Contrase&ntilde;a*</h3>
            </label>
            <input type="password" class="form-control" id="adminPassR"
                placeholder="Te acuerdas, mejor an&oacute;tala" required="" pattern="[a-zA-Z0-9]{8,254}"
                onkeyup="coincidirContrasena()"> <!-- Que solo se acepeten contraseñas alfanumericas  -->
        </div>
        <div class="group">
            <label class="form-control" id="contrasena"></label>
        </div>
        <input type="hidden" name="accion" value="guardar">
        <div class="formButtons">
            <button style="width: 57%; margin-top: 50px;" type="button" class="btn btn-success"
                onclick="showAlertAdAdmin()" id="btnAgregar">Agregar</button>
        </div>
    </form>
</div>

<script>
    function coincidirContrasena() {
        var pass1 = document.getElementById("adminPass");
        var pass2 = document.getElementById("adminPassR");
        var contrasena = document.getElementById("contrasena");
        var btnAgregar = document.getElementById("btnAgregar");

        btnAgregar.disabled = true; //Boton en desactivado o apagado

        if (pass1.value.length == 0 || pass2.value.length == 0) {
            contrasena.innerHTML = "Ninguna de las contrase&ntilde;as pueden quedar vacias";
            contrasena.style.color = "orange";
            btnAgregar.disabled = true;

        } else if (pass1.value != pass2.value) {
            contrasena.innerHTML = "Las contrase&ntilde;as no coinciden";
            contrasena.style.color = "red";
            pass1.style.borderColor = "red";
            pass2.style.borderColor = "red";
            btnAgregar.disabled = true;

        } else {
            contrasena.innerHTML = "Las contrase&ntilde;as coinciden";
            contrasena.style.color = "green";
            pass1.style.borderColor = "green";
            pass2.style.borderColor = "green";
            btnAgregar.disabled = false;
        }

    }

    function showAlertAdAdmin() {
        Swal.fire({
            title: '&#191;Est&aacutes seguro?',
            html: '<p>&#191;Seguro que deseas agregar este Administrador?</p>',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00D427',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                document.formAdmin.submit();
                Swal.fire(
                    'Agregado!',
                    'Ha sido agregado un Administrador.',
                    'success'
                )
            } else {
                Swal.fire(
                    'Cancelado!',
                    'No se ha agregado el Administrador.',
                    'error'
                )
            }
        })
    }
</script>