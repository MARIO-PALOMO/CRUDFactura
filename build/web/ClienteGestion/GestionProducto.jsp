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
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Mario Palomo</strong>
                                        </span> <span class="text-muted text-xs block"> Administrador <b class="caret"></b></span> </span> </a>
                                <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                    <li><a href="./adminPerfil.jsp">Perfil</a></li>
                                    <li class="divider"></li>
                                    <li><a href="../index.jsp?cerrar=true">Cerrar Sesión</a></li>
                                </ul>
                            </div>
                            <div class="logo-element">
                                FA+
                            </div>
                        </li>
                        <li>
                            <a href="GestionCliente.jsp"><i class="fa fa-users"></i> <span class="nav-label">Gestión Clientes</span>  </a>
                        </li>    
                        <li class="active">
                            <a href="GestionProducto.jsp"><i class="fa fa-cart-plus"></i> <span class="nav-label">Gestión Producto</span>  </a>
                        </li> 
                    </ul>

                </div>
            </nav>

            <div id="page-wrapper" class="gray-bg">
                <div class="row border-bottom">
                    <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>

                        </div>
                        <ul class="nav navbar-top-links navbar-right">
                            <li>
                                <span class="m-r-sm text-muted welcome-message"> <b> FACTURACIÓN</b></span>
                            </li>

                            <li>
                                <a href="../index.jsp"><i class="fa fa-sign-out"></i>Cerrar Sesión</a>
                            </li>
                        </ul>

                    </nav>
                </div>
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-sm-4">
                        <h2>Gestión Producto</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Producto</strong>
                            </li>
                        </ol>
                    </div>
                    <div class="col-sm-8">
                        <div class="title-action">

                        </div>
                    </div>
                </div>

                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="ibox-title">
                                <div class="form-group">
                                    <button type="button" class="btn btn-w-m btn-success" data-toggle="modal" data-target="#mdProducto" id="guardar"><i class="fa fa-plus"></i> Agregar Producto</button>
                                </div>
                                <div class="table-responsive" >
                                    <table id="tbProducto" class="table table-striped table-bordered table-hover" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="background: #3B93D1; color: white">Código</th>
                                                <th style="background: #3B93D1; color: white">Nombre</th>
                                                <th style="background: #3B93D1; color: white">Stock</th>
                                                <th style="background: #3B93D1; color: white">Precio</th>
                                                <th style="background: #3B93D1; color: white"></th>
                                                <th style="background: #3B93D1; color: white"></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="modal fade" id="mdProducto" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrProducto" name="fmrProducto">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Gestión Producto</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <input type="text" class="form-control" id="txtCodigoProducto" name="txtCodigoProducto" style="display: none" value="0">
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" placeholder="Ingresar Nombre" class="form-control" id="txtNombreProducto" name="txtNombreProducto">
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="text" placeholder="Ingresar Stock" class="form-control" id="txtStockProducto" name="txtStockProducto" value="0">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="text" placeholder="Ingresar Precio" class="form-control" id="txtPrecioProducto" name="txtPrecioProducto" value="0">
                            </div>
                            <input type="text" name="gestion" id="gestion" style="display: none" value="guardar">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="btn btn-warning" id="btnModificarProducto"><i class="fa fa-pencil"></i> Modificar</button>
                            <button type="submit" class="btn btn-success" id="btnGuardarProducto"><i class="fa fa-save"></i> Guardar</button>
                        </div>
                    </form>
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

            $(document).ready(function () {
                BuscarProducto();
            });

            $('#btnGuardarProducto').click(function (e) {
                e.preventDefault();
                GuardarProducto();

            });

            $('#btnModificarProducto').click(function (e) {
                e.preventDefault();
                ModificarProducto();
            });

            $('#guardar').click(function (e) {
                Limpiar();
                $("#btnModificarProducto").css("display", "none");
                $("#btnGuardarProducto").css("display", "inline");
                $("#gestion").val("guardar");
            });

            function BuscarProducto() {

                var table = $('#tbProducto').DataTable({
                    "ajax": {
                        "url": "../ServletProducto",
                        "data": {
                            "gestion": 'buscar',
                            "txtCodigoProducto": 0,
                            "txtStockProducto": 0,
                            "txtPrecioProducto": 0
                        }
                    },
                    destroy: true,
                    empty: true,
                    "columnDefs": [{
                            "targets": -2,
                            "data": null,
                            "width": "1%",
                            "defaultContent": "<button id='btnModificar' class='btn btn-warning' type='button'><i class='fa fa-pencil'></i></button>"
                        },
                        {
                            "targets": -1,
                            "data": null,
                            "width": "1%",
                            "defaultContent": "<button id='btnEliminar' class='btn btn-danger' type='button'><i class='fa fa-trash'></i></button>"
                        },
                        {
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        }],
                    "language": {

                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }

                    }
                });

                $('#tbProducto tbody').on('click', '#btnModificar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#btnGuardarProducto").css("display", "none");
                    $("#btnModificarProducto").css("display", "inline");
                    $("#gestion").val("modificar");
                    $('#mdProducto').modal('show');

                    $('#txtCodigoProducto').val(data[0]);
                    $('#txtNombreProducto').val(data[1]);
                    $('#txtStockProducto').val(data[2]);
                    $('#txtPrecioProducto').val(data[3]);

                });

                $('#tbProducto tbody').on('click', '#btnEliminar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#gestion").val("eliminar");
                    swal({
                        title: "¿Desea Eliminar el Registro?",
                        text: "El Producto " + data[1] + " será Eliminado",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Sí, Eliminar!",
                        closeOnConfirm: false
                    }, function () {
                        EliminarProducto(data[0], $("#gestion").val());
                        sweetAlert.close();
                    });


                });
            }

            function GuardarProducto() {

                var data = $('#fmrProducto').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletProducto",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Producto');
                        BuscarProducto();
                        Limpiar();
                        $('#mdProducto').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Producto', 'Gestión Producto');
                });
            }

            function ModificarProducto() {

                var data = $('#fmrProducto').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletProducto",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Producto');
                        BuscarProducto();
                        Limpiar();
                        $('#mdProducto').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Error al Modificar Producto', 'Gestión Producto');
                });
            }

            function EliminarProducto(txtCodigoProducto, gestion) {

                $.ajax({
                    type: "POST",
                    url: "../ServletProducto",
                    data: {txtCodigoProducto: txtCodigoProducto, txtStockProducto: 0, txtPrecioProducto: 0, gestion: gestion},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Producto');
                        BuscarProducto();
                        Limpiar();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Error al Eliminar Producto', 'Gestión Producto');
                });
            }


            function Limpiar() {
                $('#txtCodigoProducto').val("0");
                $('#txtNombreProducto').val("");
                $('#txtStockProducto').val("0");
                $('#txtPrecioProducto').val("0");
                $("#gestion").val("guardar");
            }

        </script>

    </body>

</html>
