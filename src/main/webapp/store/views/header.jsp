<style>
    header {
        background-color: #ccc !important;
        margin: 0;
        padding: 0;
    }

    .busqueda {
        margin: 0 auto;
        width: 100%;
        display: block !important;
    }

    li a {
        color: rgb(51, 51, 51) !important;
    }

    li a:hover {
        color: #000 !important;
        transition: .3s;
        transform: scale(1.1);
    }
</style>


<header class="p-3">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <div class="img-center" style="margin: 0 auto;margin-bottom: 2vh;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/5/54/Logo-utez.png" width="200vw" alt="404">
            </div>
            <div class="busqueda">
                <form role="search"
                    class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <input type="search" class="form-control form-control-dark text-dark bg-white"
                        placeholder="Search..." aria-label="Search" style="width: 90vw" id="searcher">
                </form>
            </div>

            <div class="container-fluid pb-3">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="Store?accion=inicio" class="nav-link px-2">Inicio</a></li>
                    <li><a href="Store?accion=ofertas" class="nav-link px-2">Ofertas</a></li>
                    <c:forEach var="listado" items="${listado}">
                        <c:if test="${listado.getStatus()}">
                            <li><a href="Store?accion=categoria&cate=${listado.getCategoria()}" class="nav-link px-2">
                                    <c:out value="${listado.getCategoria()}"></c:out>
                                </a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </div>
</header>