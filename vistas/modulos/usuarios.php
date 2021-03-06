<?php

if($_SESSION["perfil"] == "Especial" || $_SESSION["perfil"] == "Vendedor"){

  echo '<script>

    window.location = "inicio";
  
  </script>';

  return;

}

?>

<div class="content-wrapper">

    <section class="content-header">

      <h1>

        Administrar Usuarios

      </h1>

      <ol class="breadcrumb">

        <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

        <li class="active">Administrar Usuarios</li>
        
      </ol>

    </section>

    <!-- Main content -->

    <section class="content">

      <!-- Default box -->

      <div class="box">

        <div class="box-header with-border">

            <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarUsuario">

            Agregar Usuario

            </button>
    
        </div>

        <div class="box-body">

            <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

            <thead>

            <tr>
              <th style="width:10px">#</th>
              <th>Nombre</th>
              <th>Usuario</th>
              <th>Foto</th>
              <th>Perfil</th>
              <th>Estado</th>
              <th>Último login</th>
              <th>Acciones</th>
            </tr>

            </thead>

            <tbody>

            <?php

              $item = null;
              $valor = null;

              $usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

              foreach ($usuarios as $key => $value){

                echo '<tr>
                <td>'.($key+1).'</td>
                <td>'.$value["nombre"].'</td>
                <td>'.$value["usuario"].'</td>';

                if($value["foto"] != ""){

                  echo '<td><img src="'.$value["foto"].'" class="img-thumbnail" width="40px"></td>';

                } else{

                  echo '<td><img src="vistas/img/usuarios/default/anonymous.png" class="img-thumbnail" width="40px"></td>';

                }

                
                echo '<td>'.$value["perfil"].'</td>';

                if($value["estado"] != 0){

                  echo '<td><button class="btn btn-success btn-xs btnActivar" idUsuario="'.$value["id"].'" estadoUsuario="0">Activado</button></td>';

                }else{

                  echo '<td><button class="btn btn-danger btn-xs btnActivar" idUsuario="'.$value["id"].'" estadoUsuario="1">Desactivado</button></td>';

                }

                

                echo '<td>'.$value["ultimo_login"].'</td>
                <td>

                  <div class="btn-group">

                      <button class="btn btn-warning btnEditarUsuario" idUsuario="'.$value["id"].'" data-toggle="modal" data-target="#modalEditarUsuario"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btnEliminarUsuario" idUsuario="'.$value["id"].'" fotoUsuario="'.$value["foto"].'" usuario="'.$value["usuario"].'"><i class="fa fa-times"></i></button>

                  </div>

                </td>
              </tr>';

              }

            ?>

            

            </tbody>

            </table>
          
        </div>


        <!-- /.box-body -->
      
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Modal Agregar Usuarios -->

  <div id="modalAgregarUsuario" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">
    
    <form role="form" method="POST" enctype="multipart/form-data">

    <!-- Cabecera del modal -->

      <div class="modal-header" style="background: #3c8dbc; color:white;">

        <button type="button" class="close" data-dismiss="modal">&times;</button>

        <h4 class="modal-title">Agregar Usuario</h4>

      </div>

      <!-- Cuerpo del Modal -->

      <div class="modal-body">

        <div class="box-body">
 
        <!-- Entrada para el nombre-->
          <div class="form-group">

            <div class="input-group">

              <span class="input-group-addon"><i class="fa fa-user"></i></span>

              <input type="text" class="form-control input-lg" name="nuevoNombre" placeholder="ingresar nombre" required>

            </div>

          </div>

            <!-- Entrada para el usuario-->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-key"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoUsuario" placeholder="ingresar usuario" id="nuevoUsuario" required>

              </div>

            </div>

               <!-- Entrada para la contraseña-->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-lock"></i></span>

                <input type="password" class="form-control input-lg" name="nuevoPassword" placeholder="ingresar contraseña" required>

              </div>

            </div>

                <!-- Entrada para seleccionar su perfil-->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-users"></i></span>

                <select name="nuevoPerfil"  class="form-control input-lg">

                  <option value="">Seleccionar perfil</option>

                  <option value="Administrador">Administrador</option>

                  <option value="Especial">Especial</option>

                  <option value="Vendedor">Vendedor</option>

                </select>

              </div>

            </div>

                            <!-- Entrada para subir foto-->

            <div class="form-group">

              <div class="panel">SUBIR FOTO</div>

              <input type="file" class="nuevaFoto" name="nuevaFoto">

              <p class="help-block">Peso máximo de la foto 2 mb</p>

              <img src="vistas/img/usuarios/default/anonymous.png" class="img-thumbnail previsualizar" width="100px">

            </div>



        </div>

      </div>

      <!-- Pie del modal -->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary">Guardar usuario</button>

      </div>

      <?php

        $crearUsuario = new ControladorUsuarios();
        $crearUsuario -> ctrCrearUsuario();

      ?>

      </form>

    </div>

  </div>

</div>

  <!-- Modal Editar Usuario -->

  <div id="modalEditarUsuario" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">
    
    <form role="form" method="POST" enctype="multipart/form-data">

    <!-- Cabecera del modal -->

      <div class="modal-header" style="background: #3c8dbc; color:white;">

        <button type="button" class="close" data-dismiss="modal">&times;</button>

        <h4 class="modal-title">Editar Usuario</h4>

      </div>

      <!-- Cuerpo del Modal -->

      <div class="modal-body">

        <div class="box-body">
 
        <!-- Entrada para el nombre-->
          <div class="form-group">

            <div class="input-group">

              <span class="input-group-addon"><i class="fa fa-user"></i></span>

              <input type="text" class="form-control input-lg" id="editarNombre" name="editarNombre" value="" required>

            </div>

          </div>

            <!-- Entrada para el usuario-->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-key"></i></span>

                <input type="text" class="form-control input-lg" id="editarUsuario" name="editarUsuario" value="" readonly>

              </div>

            </div>

               <!-- Entrada para la contraseña-->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-lock"></i></span>

                <input type="password" class="form-control input-lg" name="editarPassword" placeholder="escriba la nueva contraseña">

                <input type="hidden" name="passwordActual" id="passwordActual">

              </div>

            </div>

                <!-- Entrada para seleccionar su perfil-->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-users"></i></span>

                <select name="editarPerfil"  class="form-control input-lg">

                  <option value="" id="editarPerfil"></option>

                  <option value="Administrador">Administrador</option>

                  <option value="Especial">Especial</option>

                  <option value="Vendedor">Vendedor</option>

                </select>

              </div>

            </div>

                            <!-- Entrada para subir foto-->

            <div class="form-group">

              <div class="panel">SUBIR FOTO</div>

              <input type="file" class="nuevaFoto" name="editarFoto">

              <p class="help-block">Peso máximo de la foto 2 mb</p>

              <img src="vistas/img/usuarios/default/anonymous.png" class="img-thumbnail previsualizarEditar" width="100px">

              <input type="hidden" name="fotoActual" id="fotoActual">

            </div>



        </div>

      </div>

      <!-- Pie del modal -->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary">Modificar usuario</button>

      </div>

     <?php

        $editarUsuario = new ControladorUsuarios();
        $editarUsuario -> ctrEditarUsuario();

      ?> 

      </form>

    </div>

  </div>

</div>

<?php

$borrarUsuario = new ControladorUsuarios();
$borrarUsuario -> ctrBorrarUsuario();

?>