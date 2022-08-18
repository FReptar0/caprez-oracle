<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <%@ include file="views/head.jsp" %>
            <style>
                html,
                body {
                    height: 100%;
                }

                body {
                    display: flex;
                    align-items: center;
                    padding-top: 40px;
                    padding-bottom: 40px;
                }

                .form-signin {
                    max-width: 350px;
                    padding: 15px;
                }

                .form-signin .form-floating:focus-within {
                    z-index: 2;
                }

                .form-signin input[type="email"] {
                    margin-bottom: 10px;
                    border-radius: 5px;
                }

                .form-signin input[type="password"] {
                    margin-bottom: 10px;
                    border-radius: 5px;
                }

                form {
                    background-color: #FBFCFC;
                    padding: 10px;
                    padding-bottom: 20px;
                    border-radius: 5px;
                    box-shadow: 5px 5px 15px 5px rgba(0, 0, 0, 0.29);
                }

                #floatingPassword {
                    margin-top: 10px;
                }
            </style>

    </head>
    <body class="text-center">
        <div class="container">
            <main class="form-signin w-100 m-auto">
                <form method="post" action="controladorUsuario">
                    <img class="mb-3"
                        src="data:image/png;base64,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"
                        alt="" width="72" height="57">
                    <h1 class="h1 mb-0 p-0">Inicio de sesi&oacute;n</h1>
                    <h2 class="h3 mb-3 fw-normal">Tienda UTEZ</h2>

                    <div class="form-floating">
                        <input type="email" name="usuario" class="form-control" id="floatingInput"
                            placeholder="userExample" required>
                        <label for="floatingInput">Correo Electronico</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" name="contrasena" class="form-control" id="floatingPassword"
                            placeholder="Password" required>
                        <label for="floatingPassword">Contrase&ntilde;a</label>
                    </div>
                    <input type="hidden" name="accion" value="validar">
                    <button type="submit" class="w-100 btn btn-lg btn-primary" name="accion"
                        value="Ingresar">Ingresar</button> 
                </form>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
            <!-- Ya jala :( -->
    </body>
    </html>