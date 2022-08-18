<style>
  /* CSS Code Here */
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
  function showAlertEditCategoria() {
    Swal.fire({
      title: '&#191;Est&aacute;s seguro?',
      html: '<p>&#191;Seguro que deseas modificar esta Categor&iacute;a?</p>',
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#00D427', /* Verde  00D427*/
      cancelButtonColor: '#d33', /* Rojo d33 */ /*  Amarillo FFF000 */
      confirmButtonText: 'Continuar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        document.formEditCat.submit();
        Swal.fire(
          'Modificado!',
          'Ha sido modificado la Categor&iacute;a.',
          'success'
        )
      } else {
        Swal.fire(
          'Cancelado!',
          'No se ha modificado la Categor&iacute;a.',
          'error'
        )
      }
    })
  }
</script>

<div class="contenedor titulo-form">
  <h1>Editar Categor&iacute;a</h1>
</div>

<div class="contenedor">
  <form action="ServletCategorias" method="post" name="formEditCat">
    <input type="hidden" name="id" value="${BeanCategorias.getId()}">
    <div class="group">
      <label for="category" class="form-label">
        <h3>Categor&iacute;a*</h3>
      </label>
      <input type="text" name="category" id="category" class="form-control" value="${BeanCategorias.getCategoria()}"
        placeholder="Ingrese la categor&iacute;a" required>
    </div>
    <div class="group">

      <h3>Estado de la categor&iacute;a</h3>
      <select name="estado" id="" class="form-select">
        <c:if test="${BeanCategorias.getStatus()}">
          <option value="1" selected>Habilitada</option>
          <option value="0">Deshabilitada</option>
        </c:if>
        <c:if test="${!BeanCategorias.getStatus()}">
          <option value="1">Habilitada</option>
          <option value="0" selected>Deshabilitada</option>
        </c:if>
      </select>

    </div>
    <input type="hidden" name="accion" value="actualizar">
    <div class="formButtons">
      <button style="width: 57%; margin-top: 50px;" type="button" class="btn btn-success"
        onclick="showAlertEditCategoria()">Guardar</button>
    </div>
  </form>
</div>