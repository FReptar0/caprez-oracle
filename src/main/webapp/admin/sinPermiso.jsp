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
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="error-template">
                    <h1>
                        ACCESO DENEGADO</h1>
                    <div class="error-details">
                        <h2>No cuentas con los permisos necesarios</h2>
                    </div>
                    <!-- Volver al index -->
                    <div class="error-actions">
                        <a href="inicio" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                            Regresar </a>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
            crossorigin="anonymous"></script>
</body>