<?php

    //Connect to the database
  /* $host = "belachan1-casefacil-1468325";   //See Step 3 about how to get host name
    $user = "belachan1";                    //Your Cloud 9 username
    $pass = "";                             //Remember, there is NO password!
    $db = "users";                          //Your database name you want to connect to
    $port = 3306;                           //The port #. It is always 3306 */

   /* $connection = mysql_connect($host, $user, $pass, $db, $port)or die(mysql_error());
    
    mysql_select_db("users", $connection) or die("Banco de dados não localizado!"); */
    
    $connection = mysql_connect("127.0.0.1", "belachan1", "") or die("Não foi possível estabelecer a conexão com o servidor");
    mysql_select_db("casefacil", $connection) or die("O banco de dados não foi encontrado!");
?>