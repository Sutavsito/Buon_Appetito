<?php include("../template/header.php")?>
<?php

$txtID=(isset($_POST['txtID']))?$_POST['txtID']:"";
$txtNombre=(isset($_POST['txtNombre']))?$_POST['txtNombre']:"";
$txtIngredientes=(isset($_POST['txtIngredientes']))?$_POST['txtIngredientes']:"";

$txtImagen=(isset($_FILES['txtImagen']['name']))?$_FILES['txtImagen']['name']:"";
$accion=(isset($_POST['accion']))?$_POST['accion']:"";

echo $txtID."<br/>";
echo $txtNombre."<br/>";
echo $txtIngredientes."<br/>";
echo $txtImagen."<br/>";
echo $accion."<br/>";

$host="localhost";
$bd="buon_appetito";
$usuario="root";
$contrasenia="";

        //Investigar sobre el PDO 

try {
        $conexion=new PDO("Mysql:host=$host;dbname=$bd",$usuario,$contrasenia); 
        if($conexion){ echo "conectado... a sistema";}
} catch ( Exception $ex) {

    echo $ex->getMessage();

}

switch($accion){

        case"Agregar":

            //INSERT INTO `platillos` (`id`, `nombre`, `ingredientes`, `imagen`) VALUES (NULL, 'Empanadas Arabes', 'Discos de empanada', 'imagen.jpg');

            echo "presionado boton Agregar";
            break;

        case"Modificar":
            echo "presionado boton Modificar";
            break;

        case"Cancelar":
            echo "presionado boton Cancelar";
            break;
}


?>


<div class="col-md-5">
    
    <div class="card">
        <div class="card-header">
            Ingredientes de los platillos
        </div>

        <div class="card-body">

        <form method="POST" enctype="multipart/form-data" >

            <div class = "form-group">
            <label for="txtID">ID:</label>
            <input type="text" class="form-control" name="txtID" id="txtID" placeholder="ID">
            </div>

            <div class = "form-group">
            <label for="txtNombre">Nombre:</label>
            <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Nombre del platillo">
            </div>

            
            <div class = "form-group">
            <label for="txtIngredientes">Ingredientes:</label>
            <input type="text" class="form-control" name="txtIngredientes" id="txtIngredientes" placeholder="Ingredientes del platillo">
            </div>

            <div class = "form-group">
            <label for="txtImagen">imagen:</label>
            <input type="file" class="form-control" name="txtImagen" id="txtImagen" placeholder="Nombre del platillo">
            </div>


                <div class="btn-group" role="group" aria-label="">
                    <button type="submit" name="accion" value="Agregar" class="btn btn-success">Agregar</button>
                    <button type="submit" name="accion" value="Modificar" class="btn btn-warning">Modificar</button>
                    <button type="submit" name="accion" value="Cancelar" class="btn btn-info">Cancelar</button>
                </div>

        </form>

        </div>
        
    </div>

</div>

<div class="col-md-7">
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Ingredientes</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>2</td>
                <td>Aprende php</td>
                <td>Aprende php</td>
                <td>Imagen.jpg</td>
                <td>Seleccionar | Borrar</td>
            </tr>
        </tbody>

    </table>

</div>

<?php include("../template/footer.php")?>