<?php
    define('HOST', 'localhost');
    define('USER', 'root');
    define('PASSWORD', '');
    define('DB_NAME','budget_app');
    $con =mysqli_connect(HOST,USER,PASSWORD,DB_NAME) or die('Unable to Connect');
?>