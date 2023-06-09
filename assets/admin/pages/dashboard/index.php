<?php include_once('../authen.php');
include_once('../../connect.php'); ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>PhomPongPanmai</title>
  <!-- Favicons -->

  <link rel="manifest" href="../../dist/img/favicons/site.webmanifest">
  <link rel="mask-icon" href="../../dist/img/favicons/safari-pinned-tab.svg" color="#5bbad5">
  <link rel="shortcut icon" href="../ppp_nobg.png" />
  <meta name="msapplication-TileColor" content="#da532c">
  <meta name="msapplication-config" content="../../dist/img/favicons/browserconfig.xml">
  <meta name="theme-color" content="#ffffff">
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap4.min.css">

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <?php include_once('../includes/sidebar.php') ?>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">

        <div class="row">
          <!-- Left col -->
          <div class="col-md-12">
            <!-- Widget: user widget style 1 -->
            <div class="card card-widget widget-user">
              <!-- Add the bg color to the header using any of the bg-* classes -->
              <!-- <div class="widget-user-header bg-info-active text-center">
                <h3 class="widget-user-username">ดูหน้าทั้งหมด</h3>
              </div> -->
              <div class="card-footer">
                <div class="row">
                  <!-- /.col -->
                  <div class="col-sm-4 border-right">
                    <div class="description-block">
                    <?php $sql="SELECT COUNT(*) as summember FROM `members`"; 
                          $res=mysqli_query($conn,$sql);
                          $row=mysqli_fetch_array($res);
                    ?>
                    
               
                </div>
                <!-- /.row -->
              </div>
            </div>
            <!-- /.widget-user -->
          </div>
        </div>

        <div class="row">
          <div class="col-lg-6 col-6">
            <div class="small-box bg-info">
              <div class="inner">
                <h3><?php echo $row['summember']?></h3>
                <p>สมาชิกทั้งหมด</p>
              </div>
              <div class="icon">
                <i class="ion-person-stalker"></i>
              </div>
              <a href="../members/index.php" class="small-box-footer">ดูข้อมูลทั้งหมด <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-6 col-6">
            <div class="small-box bg-success">
              <div class="inner">
              <?php $sql1="SELECT COUNT(*) as sumnews FROM news";
                    $res1=mysqli_query($conn,$sql1);
                    $row1=mysqli_fetch_array($res1);
                    ?>
                <h3><?php echo $row1['sumnews']?></h3>
                <p>ข่าวสารทั้งหมด</p>
              </div>
              <div class="icon">
              <i class="fas fa-newspaper"></i>
              </div>
              <a href="../news/index.php" class="small-box-footer">ดูข้อมูลทั้งหมด <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-6 col-6">
            <div class="small-box bg-primary">
              <div class="inner">
              <?php $sql2="SELECT COUNT(*) as sumstore FROM product";
                    $res2=mysqli_query($conn,$sql2);
                    $row2=mysqli_fetch_array($res2);
                    ?>
                <h3><?php echo $row2['sumstore']?></h3>
                <p>สินค้าทั้งหมด</p>
              </div>
              <div class="icon">
                <i class="fa fa-shopping-cart"></i>
              </div>
              <a href="../stores/index.php" class="small-box-footer">ดูข้อมูลทั้งหมด <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-6 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
              <?php $sql3="SELECT COUNT(*) as sumpayment FROM payment";
                    $res3=mysqli_query($conn,$sql3);
                    $row3=mysqli_fetch_array($res3);
                    ?>
                <h3><?php echo $row3['sumpayment']?></h3>
                <p>การชำระเงินทั้งหมด</p>
              </div>
              <div class="icon">
              <i class="ion-cash"></i></i>
              </div>
              <a href="../payment/index.php" class="small-box-footer">ดูข้อมูลทั้งหมด <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

        </div>
      </div>


      <body>
    <?php
    include('intro.php');
    $p = (isset($_GET['p']) ? $_GET['p'] : '');
    if($p=='daily'){
      include('r_daily.php');
    }elseif($p=='monthy'){
      include('r_monthy.php');
    }elseif($p=='yearly'){
      include('r_yearly.php');
    }elseif($p=='add'){
      include('form.php');
    }elseif($p=='adddb'){
      include('form_db.php');
    }else{
      include('r_daily.php');
    }
    ?>
    
  </body>
      
    </section>
    <!-- /.content -->
  </div>
  <!-- footer -->
  <?php include_once('../includes/footer.php') ?>
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SlimScroll -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>

</body>
</html>
