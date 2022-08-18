<style>
    .imagen-principal {
        margin: 0 auto;
        width: 400px;
        height: 400px;
    }

    #img-principal {
        object-fit: contain;
        width: 100%;
        height: 100%;
    }


    #contenedor-displayer {
        display: flex;
        align-items: center;
        margin: 0 auto;
        margin-top: 5vh;
        padding-left: 0px;
        padding-right: 0px;
        width: 400px;
        height: 120px;
        overflow-x: scroll;
        overflow-y: hidden;
        scrollbar-color: rgba(0, 0, 0, .5) rgba(0, 0, 0, 0);
        scrollbar-width: thin;
    }

    #inner {
        display: flex;
        overflow: auto;
        flex: none;
        flex-flow: row nowrap;
        scroll-snap-type: x mandatory;
        overflow-y: hidden;
    }

    .child {
        scroll-snap-align: start;
        width: 100px;
        height: 100px;
    }

    .img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    #contenedor-displayer::-webkit-scrollbar {
        -webkit-appearance: none;
    }

    #contenedor-displayer::-webkit-scrollbar-button:increment,
    #contenedor-displayer::-webkit-scrollbar-button {
        display: none;
    }

    #contenedor-displayer::-webkit-scrollbar:horizontal {
        height: 10px;
    }

    #contenedor-displayer::-webkit-scrollbar:vertical {
        display: none;
    }

    #contenedor-displayer::-webkit-scrollbar-thumb {
        background-color: #797979;
        border-radius: 20px;
        border: 2px solid #f1f2f3;
    }

    #contenedor-displayer::-webkit-scrollbar-track {
        border-radius: 10px;
    }

    .btn {
        width: 100px;
        height: 100px;
        padding: 0px;
        margin: 0px;
        border: none;
        margin-right: 15px;
    }

    .contenedor-imagenes {
        width: 100%;
    }

    .contenedor-secundario {
        width: 400px;
        margin: 0 auto;
    }

    @media (max-width: 943px) {
        .contenedor-imagenes {
            padding-left: 50px;
        }
    }

    @media (max-width: 767px) {
        .contenedor-imagenes {
            padding-left: 0px;
        }
    }

    @media (max-width: 410px) {
        .contenedor-secundario {
            width: 304px;
            height: 304px;
        }

        .imagen-principal {
            width: 304px;
            height: 304px;
        }

        #contenedor-displayer {
            width: 300px !important;
            height: 120px !important;
        }
    }
</style>
<div class="contenedor-imagenes">
    <div class="contenedor-secundario">
        <div class="imagen-principal">
            <img src="https://images.unsplash.com/photo-1618354691373-d851c5c3a990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80"
                 id="img-principal">
        </div>
        <div class="container mv-5" id="contenedor-displayer">
            <div id="inner">
                <button class="btn" onclick="imagen1()" onfocus="opacidadfocus(this)"
                        onblur="opacidadblur(this)">
                    <div class="child"><img
                            src="https://images.unsplash.com/photo-1618354691229-88d47f285158?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80"
                            class="img" id="img1"></div>
                </button>
                <button class="btn" onclick="imagen2()" onfocus="opacidadfocus(this)"
                        onblur="opacidadblur(this)">
                    <div class="child"><img
                            src="https://images.unsplash.com/photo-1618354691551-44de113f0164?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80"
                            class="img" id="img2"></div>
                </button>
                <button class="btn" onclick="imagen3()" onfocus="opacidadfocus(this)"
                        onblur="opacidadblur(this)">
                    <div class="child"><img src="img/img2.jpg" class="img" id="img3"></div>
                </button>
                <button class="btn" onclick="imagen4()" onfocus="opacidadfocus(this)"
                        onblur="opacidadblur(this)">
                    <div class="child"><img src="img/img3.jpg" class="img" id="img4"></div>
                </button>
                <button class="btn" onclick="imagen5()" onfocus="opacidadfocus(this)"
                        onblur="opacidadblur(this)">
                    <div class="child"><img src="img/img4.jpg" class="img" id="img5"></div>
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    function imagen1() {
        document.getElementById("img-principal").src = document.getElementById("img1").src;
    }
    function imagen2() {
        document.getElementById("img-principal").src = document.getElementById("img2").src;
    }
    function imagen3() {
        document.getElementById("img-principal").src = document.getElementById("img3").src;
    }
    function imagen4() {
        document.getElementById("img-principal").src = document.getElementById("img4").src;
    }
    function imagen5() {
        document.getElementById("img-principal").src = document.getElementById("img5").src;
    }
    function opacidadfocus(img) {
        img.style.opacity = "0.3";
    }
    function opacidadblur(img) {
        img.style.opacity = "1";
    }
</script>
