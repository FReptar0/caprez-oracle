<style>
  .container-fluid {
    height: 100%;
    width: 100%;
  }

  .carousel-inner img {
    height: 270px;
  }

  #carouselExampleDark {
    box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.2);
  }
</style>
<div id="carouselExampleDark" class="carousel carousel-dark slide carousel-fade" data-ride="carousel">
  <div class="carousel-indicators">
    <c:forEach var="ListaOffer" items="${ListaOffer}" varStatus="status">
      <c:if test="${status.count > 1 && ListaOffer.getEstado()}">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.count-1}"></button>
      </c:if>
      <c:if test="${status.count == 1 && ListaOffer.getEstado()}">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.count-1}"
          class="active"></button>
      </c:if>
    </c:forEach>
    <!-- 
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"></button> -->
  </div>
  <div class="carousel-inner">
    <c:forEach var="ListaOffer" items="${ListaOffer}" varStatus="status">
      <c:if test="${status.count == 1 && ListaOffer.getEstado()}">
        <div class="carousel-item active">
          <!-- Cambiar -->
          <img src="data:image/*;base64, ${ListaOffer.image}" alt="${ListaOffer.getTitulo()}" width="100%">
        </div>
      </c:if>
      <c:if test="${status.count > 1 && ListaOffer.getEstado()}">
        <div class="carousel-item">
          <img src="data:image/*;base64, ${ListaOffer.image}" alt="${ListaOffer.getTitulo()}" width="100%">
        </div>
      </c:if>
    </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleDark" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleDark" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<script>
  $(document).ready(function () {
    $(".carousel").carousel({
      interval: 5000,
    });
  });
</script>