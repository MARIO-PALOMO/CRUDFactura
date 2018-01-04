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
                        <li class="active">
                            <a href="GestionCliente.jsp"><i class="fa fa-users"></i> <span class="nav-label">Gestión Clientes</span>  </a>
                        </li>    
                        <li>
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
                        <h2>Gestión Clientes</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Clientes</strong>
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
                                    <button type="button" class="btn btn-w-m btn-success" data-toggle="modal" data-target="#mdCliente" id="guardar"><i class="fa fa-plus"></i>Agregar Cliente</button>
                                </div>
                                <div class="table-responsive" >
                                    <table id="tbCliente" class="table table-striped table-bordered table-hover" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="background: #3B93D1; color: white">Código</th>
                                                <th style="background: #3B93D1; color: white">Nombre</th>
                                                <th style="background: #3B93D1; color: white">Cedula</th>
                                                <th style="background: #3B93D1; color: white">Direccion</th>
                                                <th style="background: #3B93D1; color: white">Telefono</th>
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


        <div class="modal fade" id="mdCliente" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrCliente" name="fmrCliente">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Gestión Cliente</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <input type="number" class="form-control" id="txtCodigoCliente" name="txtCodigoCliente" style="display: none" value="0">
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" placeholder="Ingresar Nombre" class="form-control" id="txtNombreCliente" name="txtNombreCliente" >
                            </div>
                            <div class="form-group">
                                <label>Cédula</label>
                                <input type="text" placeholder="Ingresar Cédula" class="form-control" id="txtCedulaCliente" name="txtCedulaCliente">
                            </div>
                            <div class="form-group">
                                <label>Dirección</label>
                                <input type="text" placeholder="Ingresar Dirección" class="form-control" id="txtDireccionCliente" name="txtDireccionCliente">
                            </div>
                            <div class="form-group">
                                <label>Teléfono</label>
                                <input type="text" placeholder="Ingresar Teléfono" class="form-control" id="txtTelefonoCliente" name="txtTelefonoCliente">
                            </div>
                            <input type="text" name="gestion" id="gestion" style="display: none" value="guardar">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="btn btn-warning" id="btnModificarCliente"><i class="fa fa-pencil"></i> Modificar</button>
                            <button type="submit" class="btn btn-success" id="btnGuardarCliente"><i class="fa fa-save"></i> Guardar</button>
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
                BuscarCliente();
            });

            $('#btnGuardarCliente').click(function (e) {
                e.preventDefault();
                GuardarCliente();

            });

            $('#btnModificarCliente').click(function (e) {
                e.preventDefault();
                ModificarCliente();
            });

            $('#guardar').click(function (e) {
                Limpiar();
                $("#btnModificarCliente").css("display", "none");
                $("#btnGuardarCliente").css("display", "inline");
                $("#gestion").val("guardar");
            });

            function BuscarCliente() {

                var table = $('#tbCliente').DataTable({
                    "ajax": {
                        "url": "../ServletCliente",
                        "data": {
                            "gestion": 'buscar',
                            "txtCodigoCliente": 0
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

                $('#tbCliente tbody').on('click', '#btnModificar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#btnGuardarCliente").css("display", "none");
                    $("#btnModificarCliente").css("display", "inline");
                    $("#gestion").val("modificar");
                    $('#mdCliente').modal('show');

                    $('#txtCodigoCliente').val(data[0]);
                    $('#txtNombreCliente').val(data[1]);
                    $('#txtCedulaCliente').val(data[2]);
                    $('#txtDireccionCliente').val(data[3]);
                    $('#txtTelefonoCliente').val(data[4]);

                });

                $('#tbCliente tbody').on('click', '#btnEliminar', function () {
                    var data = table.row($(this).parents('tr')).data();
                    $("#gestion").val("eliminar");
                    swal({
                        title: "¿Desea Eliminar el Registro?",
                        text: "El Cliente " + data[1] + " será Eliminado",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Sí, Eliminar!",
                        closeOnConfirm: false
                    }, function () {
                        EliminarCliente(data[0], $("#gestion").val());
                        sweetAlert.close();
                    });


                });
            }

            function GuardarCliente() {

                var data = $('#fmrCliente').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletCliente",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Cliente');
                        BuscarCliente();
                        Limpiar();
                        $('#mdCliente').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Cliente', 'Gestión Cliente');
                });
            }

            function ModificarCliente() {

                var data = $('#fmrCliente').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletCliente",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Cliente');
                        BuscarCliente();
                        Limpiar();
                        $('#mdCliente').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Error al Modificar Cliente', 'Gestión Cliente');
                });
            }

            function EliminarCliente(txtCodigoCliente, gestion) {

                $.ajax({
                    type: "POST",
                    url: "../ServletCliente",
                    data: {txtCodigoCliente: txtCodigoCliente, gestion: gestion},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Cliente');
                        BuscarCliente();
                        Limpiar();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Error al Eliminar Cliente', 'Gestión Cliente');
                });
            }


            function Limpiar() {
                $('#txtCodigoCliente').val("0");
                $('#txtNombreCliente').val("");
                $('#txtCedulaCliente').val("");
                $('#txtDireccionCliente').val("");
                $('#txtTelefonoCliente').val("");
                $("#gestion").val("guardar");
            }

        </script>

    </body>

</html>
