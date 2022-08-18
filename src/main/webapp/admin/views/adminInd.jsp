<style>
  /* CSS Code Here */
  h2{
    text-align: center;
  }

  a {
    text-decoration: none;
    color: white;
  }

  .title {
    text-align: center;
    font-style: italic;
    margin-top: 1%;
  }

  .containerSections {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    gap: 2%;
    justify-content: space-around;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    height: 50vh;
    margin-top: 2%;
    margin-bottom: 10px;
  }

  /* Cards */
  .card {
    background-color: #009574;
    width: 300px;
    margin-top: 2rem;
    z-index: 9999;
    border-radius: 5%;
    margin-bottom: 10px;
  }

  .card:hover {
    box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, .2);
    transition: .2s;
    transform: scale(1.1);
  }

  .icon {
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 20%;
  }

  .nameSection {
    text-align: center;
    margin-top: 30%;
  }

  .card-tittle {
    text-align: center;
    margin-top: 10%;
    font-size: 1.5rem;
    font-weight: bold;
  }

  @media (max-width: 1200px) and (min-width: 320px) {
    .containerSections {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    }

    header {
      display: none;
    }
  }
</style>
<!-- HTML Code Here -->
<div class="title">
  <h1>Administrar</h1>
</div>
<div class="containerSections">
  <form action="ServletProductos" method="post">
    <button class="card" type="submit" name="accion" value="listar">
      <!-- Card Productos -->
      <div class="icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="white" class="bi bi-cart-fill"
          viewBox="0 0 16 16">
          <path
            d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </svg>
      </div>
      <div class="nameSection" style="margin: 0 auto;">
          <h2 class="card-title mt-5 text-white mb-5 pb-3">Productos</h2>
      </div>
    </button>
  </form>
  <form action="ServletAdmin" method="post">
    <button class="card" type="submit" name="accion" value="listar">
      <!-- Card Administradores -->
      <div class="icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="white" class="bi bi-people-fill"
          viewBox="0 0 16 16">
          <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
          <path fill-rule="evenodd"
            d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z" />
          <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
        </svg>
      </div>
      <div class="nameSection" style="margin: 0 auto;">
          <h2 class="card-title mt-5 text-white mb-5 pb-3">Administradores</h2>
      </div>
    </button>
  </form>
  <form action="ServletCategorias" method="post">
    <button class="card" type="submit" name="accion" value="listar">
      <!-- Card Categorias -->
      <div class="icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="white" class="bi bi-collection-fill"
          viewBox="0 0 16 16">
          <path
            d="M0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zM2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1z" />
        </svg>
      </div>
      <div class="nameSection" style="margin: 0 auto;">
          <h2 class="card-title mt-5 text-white mb-5 pb-3">Categor&iacute;as</h2>
      </div>
    </button>
  </form>


  <form action="ServletOfertas" method="post">
    <button class="card" type="submit" name="accion" value="listar-Offer">
      <!-- Card Ofertas -->
      <div class="icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="white" class="bi bi-tags-fill"
          viewBox="0 0 16 16">
          <path
            d="M2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2zm3.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
          <path
            d="M1.293 7.793A1 1 0 0 1 1 7.086V2a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l.043-.043-7.457-7.457z" />
        </svg>
      </div>
      <div class="nameSection" style="margin: 0 auto;">
          <h2 class="card-title mt-5 text-white mb-5 pb-3">Ofertas</h2>
      </div>
    </button>
  </form>


</div>