
<div class="content-wrapper">

    <section class="content-header">

      <h1>

        Crear Venta

      </h1>

      <ol class="breadcrumb">

        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>

        <li class="active">Crear Venta</li>
        
      </ol>

    </section>

    
    <section class="content">

      <div class="row">

      <!-- El Formulario -->

        <div class="col-lg-5 col-xs-12">

          <div class="box box-success">

            <div class="box-header with-border">

            <form role="form" method="POST" class="formularioVenta">

              <div class="box-body">

                  <div class="box">

                  <?php

                            $item = "id";
                            $valor = $_GET["idVenta"];

                            $venta = ControladorVentas::ctrMostrarVentas($item, $valor);

                            $itemUsuario = "id";
                            $valorUsuario = $venta["id_vendedor"];

                            $vendedor = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);

                            $itemCliente = "id";
                            $valorCliente = $venta["id_cliente"];

                            $cliente = ControladorClientes::ctrMostrarClientes($itemCliente, $valorCliente);

                            $porcentajeImpuesto = $venta["impuesto"] * 100 / $venta["neto"];
                            
                    ?>

                  <!-- ENTRADA DEL VENDEDOR -->

                    <div class="form-group">

                      <div class="input-group">

                        <span class="input-group-addon"><i class="fa fa-user"></i></span>

                        <input type="text" class="form-control" id="nuevoVendedor" value="<?php echo $vendedor["nombre"]; ?>" readonly>

                        <input type="hidden" name="idVendedor" value="<?php echo $vendedor["id"]; ?>">

                      </div>

                    </div>

                    <!-- ENTREDA C??DIGO VENTA -->

                    <div class="form-group">

                      <div class="input-group">

                        <span class="input-group-addon"><i class="fa fa-key"></i></span>

                    <input type="text" class="form-control" id="nuevaVenta" name="editarVenta" value="<?php echo $venta["codigo"]; ?>" readonly>
                  


                      </div>

                    </div>


                    <!-- ENTRADA DEL CLIENTE -->

                    <div class="form-group">

                      <div class="input-group">

                        <span class="input-group-addon"><i class="fa fa-users"></i></span>

                        <select class="form-control" name="seleccionarCliente" id="seleccionarCliente" required>

                        <option value="<?php echo $cliente["id"]; ?>"><?php echo $cliente["nombre"]; ?></option>

                          <?php

                            $item = null;
                            $valor = null;

                            $categorias = ControladorClientes::ctrMostrarClientes($item, $valor);

                            foreach ($categorias as $key => $value){

                              echo '<option value="'.$value["id"].'">'.$value["nombre"].'</option>';

                            }

                          ?>

                        </select>

                        <span class="input-group-addon"><button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalAgregarCliente" data-dismiss="modal">Agregar Cliente</button></span>

                      </div>

                    </div>

                    <!-- ENTRADA PARA AGREGAR PRODUCTO -->

                   <div class="form-group row nuevoProducto">

                    <?php

                $listaProducto = json_decode($venta["productos"], true);

                
                foreach ($listaProducto as $key => $value) {

                  $item = "id";
                  $valor = $value["id"];
                  $orden = "id";

                  $respuesta = ControladorProductos::ctrMostrarProductos($item, $valor, $orden);

                  $stockAntiguo = $respuesta["stock"] + $value["cantidad"];
                  
                  echo '<div class="row" style="padding:5px 15px">
            
                        <div class="col-xs-6" style="padding-right:0px">
            
                          <div class="input-group">
                
                            <span class="input-group-addon"><button type="button" class="btn btn-danger btn-xs quitarProducto" idProducto="'.$value["id"].'"><i class="fa fa-times"></i></button></span>

                            <input type="text" class="form-control nuevaDescripcionProducto" idProducto="'.$value["id"].'" name="agregarProducto" value="'.$value["descripcion"].'" readonly required>

                          </div>

                        </div>

                        <div class="col-xs-3">
              
                          <input type="number" class="form-control nuevaCantidadProducto" name="nuevaCantidadProducto" min="1" value="'.$value["cantidad"].'" stock="'.$stockAntiguo.'" nuevoStock="'.$value["stock"].'" required>

                        </div>

                        <div class="col-xs-3 ingresoPrecio" style="padding-left:0px">

                          <div class="input-group">

                            <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>
                   
                            <input type="text" class="form-control nuevoPrecioProducto" precioReal="'.$respuesta["precio_venta"].'" name="nuevoPrecioProducto" value="'.$value["total"].'" readonly required>
   
                          </div>
               
                        </div>

                      </div>';
                }


                ?>

                    </div>

                    <input type="hidden" id="listaProductos" name="listaProductos">

                    <!-- B??TON PARA AGREGAR PRODUCTO -->

                    <button type="button" class="btn btn-default hidden-lg btnAgregarProducto">Agregar producto</button>

                    <hr>

                    <div class="row">
                    
                    <!-- ENTRADA IMPUESTO Y TOTAL -->

                      <div class="col-xs-8 pull-right">

                        <table class="table">

                          <thead>

                            <tr>
                              <th>Inpuesto</th>
                              <th>Total</th>
                            </tr>

                          </thead>

                          <tbody>

                            <tr>
                              <td style="width: 50%">

                                <div class="input-group">

                                  <input type="number" class="form-control input-lg" min="0" name="nuevoImpuestoVenta" id="nuevoImpuestoVenta" value="<?php echo $porcentajeImpuesto; ?>" >

                                  <input type="hidden" name="nuevoPrecioImpuesto" id="nuevoPrecioImpuesto" value="<?php echo $venta["impuesto"]; ?>" required>

                                  <input type="hidden" name="nuevoPrecioNeto" id="nuevoPrecioNeto" value="<?php echo $venta["neto"]; ?>" required>

                                  <span class="input-group-addon"><i class="fa fa-percent"></i></span>

                                </div>

                              </td>

                              <td style="width: 50%">

                                <div class="input-group">

                                  <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>

                                  <input type="text" class="form-control input-lg" id="nuevoTotalVenta" name="nuevoTotalVenta" total="<?php echo $venta["neto"]; ?>" value="<?php echo $venta["total"]; ?>" readonly required>

                              <input type="hidden" name="totalVenta" value="<?php echo $venta["total"]; ?>" id="totalVenta">
                                  

                                </div>

                              </td>
                            </tr>

                          </tbody>

                        </table>

                      </div>

                    </div>

                    <hr>

                    <!-- ENTRADA M??TODO DE PAGO -->

                    <div class="form-group row">

                      <div class="col-xs-6" style="padding-right: 0px">

                        <div class="input-group">

                          <select class="form-control" name="nuevoMetodoPago" id="nuevoMetodoPago" required>
                            <option value="">Seleccione m??todo de pago</option>
                            <option value="Efectivo">Efectivo</option>
                            <option value="TC">Tarjeta Credito</option>
                            <option value="TD">Tarjeta Debito</option>
                          </select>

                        </div>

                      </div>
                    
                      <div class="cajasMetodoPago"></div>

                      <input type="hidden" id="listaMetodoPago" name="listaMetodoPago">

                    </div>

                    <br>

                  </div>

              </div>

              <div class="box-footer">

                <button type="submit" class="btn btn-primary pull-right">Guardar Cambios</button>

              </div>

            </form>

            <?php

              $editarVenta = new ControladorVentas();
              $editarVenta -> ctrEditarVenta();

            ?>

            </div>

          </div>

        </div>

      <!-- La Tabla de Productos -->

        <div class="col-lg-7 hidden-md hidden-sm hidden-xs">

          <div class="box box-warning">

            <div class="box-header with-border"></div>

            <div class="box-body">

              <table class="table table-bordered table-striped dt-responsive tablaVentas">

                <thead>

                  <tr>
                    <th style="width: 10px">#</th>
                    <th>Imagen</th>
                    <th>C??digo</th>
                    <th>Descripci??n</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                  </tr>

                </thead>

              </table>

            </div>

          </div>

        </div>

      </div>
      
    </section>
    
  </div>

  <!-- Modal Agregar Cliente -->

<div id="modalAgregarCliente" class="modal fade" role="dialog">

<div class="modal-dialog">

<div class="modal-content">

<form role="form" method="POST">

<!-- Cabecera del modal -->

  <div class="modal-header" style="background: #3c8dbc; color:white;">

    <button type="button" class="close" data-dismiss="modal">&times;</button>

    <h4 class="modal-title">Agregar Cliente</h4>

  </div>

  <!-- Cuerpo del Modal -->

  <div class="modal-body">

    <div class="box-body">

    <!-- Entrada para el nombre-->
      <div class="form-group">

        <div class="input-group">

          <span class="input-group-addon"><i class="fa fa-user"></i></span>

          <input type="text" class="form-control input-lg" name="nuevoCliente" placeholder="ingresar nombre" required>

        </div>

      </div>

      <!-- Ingresar documento -->
      <div class="form-group">

        <div class="input-group">

          <span class="input-group-addon"><i class="fa fa-key"></i></span>

          <input type="number" min="0" class="form-control input-lg" name="nuevoDocumentoId" placeholder="ingresar documento" required>

        </div>

      </div>

          <!-- Ingresar email -->
          <div class="form-group">

            <div class="input-group">

              <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

              <input type="email" class="form-control input-lg" name="nuevoEmail" placeholder="ingresar email" required>

            </div>

          </div>

        <!-- Ingresar Telefono -->
        <div class="form-group">

          <div class="input-group">

            <span class="input-group-addon"><i class="fa fa-phone"></i></span>

            <input type="text" class="form-control input-lg" name="nuevoTelefono" placeholder="ingresar telefono" data-inputmask="'mask':'(999) 999-9999'" data-mask required>

          </div>

        </div>

        <!-- Ingresar Direccion -->
        <div class="form-group">

          <div class="input-group">

            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>

            <input type="text" class="form-control input-lg" name="nuevaDireccion" placeholder="ingresar direccion" required>

          </div>

        </div>

        <!-- Ingresar Fecha de nacimiento -->
        <div class="form-group">

          <div class="input-group">

            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>

            <input type="text" class="form-control input-lg" name="nuevaFechaNacimiento" placeholder="ingresar fecha nacimiento" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask required>

          </div>

        </div>

      </div>
  
    </div>

  <!-- Pie del modal -->

  <div class="modal-footer">

    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

    <button type="submit" class="btn btn-primary">Guardar Cliente</button>

  </div>

  </form>

  <?php

    $crearCliente = new ControladorClientes();
    $crearCliente -> ctrCrearCliente();

  ?>

</div>

</div>

</div>

  
