<?php
    //AUTOR cristian julian triana cepeda 
    //programa de formacion ADSI
    //FICHA 2058969


    class conexion
    {
        static function conectar()
        {
            return mysqli_connect( "localhost", "root", "", "ct_estudiantes" );
        }
    }
    