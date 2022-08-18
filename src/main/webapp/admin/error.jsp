<style>
    /* Centrar container */
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .error-actions {
        margin-top: 15px;
        margin-bottom: 15px;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<body onload="redireccionar()">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="error-template">
                    <h1>
                        Oops!</h1>
                    <h2>
                        Lo sentimos, tu cuenta ha sido bloqueada, Comun&iacute;cate con el Administrador</h2>
                    <div class="error-details">
                        
                    </div>
                    <!-- Volver al index -->
                    <div class="error-actions">
                        <a href="controladorUsuario" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                            Volver al Inicio </a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function showAlertBloqueado() {
                Swal.fire({
                    title: 'CUENTA BLOQUEADA',
                    html: '<p>Tu cuenta ha sido bloqueada, Comun&iacute;cate con el Administrador</p>',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#FF0000',
                    confirmButtonText: 'Aceptar',
                })
            }

            function redireccionar() {
                setTimeout("location.href='https://www.youtube.com/watch?v=dQw4w9WgXcQ'", 10800 * 1000);
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
            crossorigin="anonymous"></script>
</body>