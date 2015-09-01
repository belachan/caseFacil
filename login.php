<?php
    require_once "php/index.php";
?>

<html>
<head>
    <meta charset="utf-8" />
    <title>Login no caseFÁCIL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/javascript.js"></script>
</head>
<body>
    
    <nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-danger" href="index2.html">caseFÁCIL</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar-collapsible">
            <ul class="nav navbar-nav navbar-left">
                <!-- Barra de navegação esquerda -->
                <li><a href="index2.html#section2">SOBRE</a></li>
                <li><a href="index2.html#section3">PLANOS</a></li>
                <li><a href="index2.html#section5">QUEM SOMOS</a></li>
                <li><a href="index2.html#section4">CONTATO</a></li>
                <li><a href="login.php">LOGIN</a></li>
                <li><a href="cadastro.php">REGISTRE-SE</a></li>
                <li>&nbsp;</li>
            </ul>
            <!-- <ul class="nav navbar-nav navbar-right">
                <li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-heart-o fa-lg"></i></a></li>
            </ul> -->
        </div>
    </div>
</nav>

<section class="container-fluid" id="section1">
    <div class="v-center col-md-3 col-md-offset-3">
         <h3> Bem-vindo de volta! </br>Faça login para continuar</h1> </br>
            <form method="post" action="?go=login">
                <label for="InputUser">Usuário</label>
                <input type="text" class="form-control" name="InputUser" id="InputUser" placeholder="">
                <label for="InputPassword">Senha</label>
                <input type="password" class="form-control" id="InputPassword" name="InputPassword" placeholder="">
                </br>
                <!--<div class="v-center col-md-3 col-md-offset-3"> -->
                <input type="submit" name="submit" id="submit" value="Logar" class="btn btn-info col-md-4 pull-right">
                <!--</div> -->
            </form>
    </div>
</section>

<!-- FOOTER - CASEFACIL -->
<footer id="footer">
    <div class="container">
        caseFácil 2015
    </div>
</footer>

<div class="scroll-up">
	<a href="#"><i class="fa fa-angle-up"></i></a>
</div>



</div>

</body>
</html>

<!-- CÓDIGO PHP USADO PARA REGISTRAR USUÁRIOS NO SISTEMA. USADO COM O PHPMYADMIN -->
<?php
   if($_GET['go'] == 'login') {
        $nome = $_POST['InputName'];
        $email = $_POST['InputEmail'];
        $user = $_POST['InputUser'];
        $pwd = $_POST['InputPassword'];
        
        if(empty($user)) {
            echo "<script>alert('Preencha todos os campos.'); history.back(); </script>";
        }elseif(empty($pwd)) {
            echo "<script>alert('Preencha todos os campos.'); history.back(); </script>";
        }else {
            $query1 = mysql_num_rows(mysql_query("SELECT * FROM usuario WHERE usuario = '$user' AND senha = '$pwd'"));
                if($query1 == 1) {
                    echo "<script>alert('Usuário logado com sucesso!'); </script>";
                    header("location:painel.html");
                } else {
                
                    echo "<script>alert('Usuário e/ou senha estão incorretos.'); history.back(); </script>"; 
            }
        }
   }
?>
