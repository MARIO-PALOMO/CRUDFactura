<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Facturación</title>

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">

        <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="../css/plugins/dataTables/datatables.min.css" rel="stylesheet">
        <link href="../css/plugins/toastr/toastr.min.css" rel="stylesheet">

        <style>
            @media (max-width: 600px) {
                #imagen_logo {
                    display: none;
                }
            }
        </style>
    </head>

    <body class="skin-1">

        <div id="wrapper">

            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element"> <span>
                                    <img alt="image" class="img-rounded" src="../images/logo.png" width="100%" height="30%"/>
                                </span>
                            </div>
                            <div class="logo-element">
                                EL+
                            </div>
                        </li>
                        <li class="active">
                            <a href=""><i class="fa fa-shopping-basket"></i> <span class="nav-label">CATEGORIAS</span>  </a>
                        </li>    
                        <li>
                            <a href=""><i class=""></i> <span class="nav-label">Tarjetas Madre</span>  </a>
                        </li> 
                        <li>
                            <a href=""><i class=""></i> <span class="nav-label">Memorias RAM</span>  </a>
                        </li> 
                        <li>
                            <a href=""><i class=""></i> <span class="nav-label">Discos Duros</span>  </a>
                        </li> 
                        <li>
                            <a href=""><i class=""></i> <span class="nav-label">Dispositivos</span>  </a>
                        </li> 
                        <li>
                            <a href=""><i class=""></i> <span class="nav-label">Redes</span>  </a>
                        </li> 

                    </ul>

                </div>
            </nav>

            <div id="page-wrapper" class="gray-bg">
                <div class="row border-bottom">
                    <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-shekel"></i> </a>

                        </div>
                        <ul class="nav navbar-top-links navbar-right">
                            <li>
                                <span class="m-r-sm text-muted welcome-message"> <b> FACTURACIÓN</b></span>
                            </li>

                            <li>
                                <a href=""><i class="fa fa-bomb"></i>ELECTRONIX</a>
                            </li>
                        </ul>

                    </nav>
                </div>
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-sm-4">
                        <h2>Lista de Productos</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Cliente</a>
                            </li>
                            <li class="active">
                                <strong>Productos</strong>
                            </li>
                        </ol>
                    </div>
                    <div class="col-sm-8">
                        <div class="title-action">

                        </div>
                    </div>
                </div>

                <div class="wrapper wrapper-content animated fadeInRight">

                    <button type="submit" id="btnComprobar" class="btn btn-success">Continuar <i class="fa fa-arrow-right"></i></button>
                    <br><br>
                    <div class="row" id="products">
                    </div>
                </div>

            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Custom and plugin javascript -->
        <script src="../js/inspinia.js"></script>
        <script src="../js/plugins/pace/pace.min.js"></script>

        <script src="../js/plugins/dataTables/datatables.min.js"></script>

        <script src="../js/plugins/toastr/toastr.min.js"></script>

        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>


        <script>

            var idProductos = new Array();

            $(document).ready(function () {
                BuscarProductos();
            });

            function BuscarProductos() {

                $.ajax({
                    type: "POST",
                    url: "../ServletProducto",
                    data: {txtCodigoProducto: 0, txtStockProducto: 0, txtPrecioProducto: 0, gestion: 'buscarListaPrincipal'},
                    success: function (productss) {
                        $('#products').empty();
                        $('#products').append(productss);
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Buscar Producto', 'Gestión Producto');
                });
            }

            $('#btnComprobar').click(function (e) {

                idProductos.length = 0;

                $('input[type=checkbox]:checked').each(function () {
                    idProductos.push($(this).prop("id"));
                });

                EnviarProductos(idProductos);
                /*for (var i = 0; i < idProductos.length; i++) {
                 console.log(idProductos[i]);
                 }*/

            });

            function EnviarProductos(json) {
                for (var i = 0; i < idProductos.length; i++) {
                    console.log(idProductos[i]);
                }
                $.ajax({
                    url: "../ServletFactura",
                    type: "POST",
                    data: {json: json},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Factura');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Enviar Datos', 'Gestión Producto');
                });
            }

        </script>

    </body>

</html>
