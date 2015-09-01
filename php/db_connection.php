<?php

    //Connect to the database
    $host = "belachan1-casefacil-1468325";   //See Step 3 about how to get host name
    $user = "belachan1";                     //Your Cloud 9 username
    $pass = "";                                 //Remember, there is NO password!
    $db = "users";                          //Your database name you want to connect to
    $port = 3306;                               //The port #. It is always 3306

    $connection = mysqli_connect($host, $user, $pass, $db, $port)or die(mysql_error());



    //And now to perform a simple query to make sure it's working
    $query = "SELECT * FROM users";
    $result = mysqli_query($connection, $query);

while ($row = mysqli_fetch_assoc($result)) {
        echo "The ID is: " . $row['id'] . " and the Name is: " . $row['name'];
    }

?>