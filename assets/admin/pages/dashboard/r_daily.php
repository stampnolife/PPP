<div class="container">
    <div class="row">
        <div class="col-md-12">
            <?php
            $query = "
            SELECT product_id, price_total, SUM(price_total) AS totol, DATE_FORMAT(order_date, '%d-%M-%Y') AS order_date
            FROM orders, order_detail
            GROUP BY DATE_FORMAT(order_date, '%d%')
            ORDER BY DATE_FORMAT(order_date, '%Y-%m-%d') DESC
            ";
            $result = mysqli_query($conn, $query);
            $resultchart = mysqli_query($conn, $query);
            // echo '<pre>'.print_r($result),'<pre>';
            // exit(0);
            //for chart
            $order_date = array();
            $totol = array();
            while($rs = mysqli_fetch_array($resultchart)){
            $order_date[] = "\"".$rs['order_date']."\"";
            $totol[] = "\"".$rs['totol']."\"";
            }
            $order_date = implode(",", $order_date);
            $totol = implode(",", $totol);
            
            ?>
            <h3 align="center">รายงานในแบบกราฟ</h3>
            
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
            <hr>
            <p align="center">
                <!--devbanban.com-->
                <canvas id="myChart" width="800px" height="300px"></canvas>
                <script>
                var ctx = document.getElementById("myChart").getContext('2d');
                var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                labels: [<?php echo $order_date;?>
                
                ],
                datasets: [{
                label: 'รายงานรายได้ แยกตามวัน (บาท)',
                data: [<?php echo $totol;?>
                ],
                backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
                }]
                },
                options: {
                scales: {
                yAxes: [{
                ticks: {
                beginAtZero:true
                }
                }]
                }
                }
                });
                </script>
            </p>
            <div class="col-sm-12">
                <h3>List</h3>
                <table  class="table table-striped" border="1" cellpadding="0"  cellspacing="0" align="center">
                    <thead>
                        <tr class="table-primary">
                            <th width="20%">วัน/เดือน/ปี</th>
                            <th width="50%">รายละเอียด</th>
                            <th width="10%"><center>รายได้</center></th>
                        </tr>
                    </thead>
                    kuy tawan
                    
                    <?php 
					
		   $sql = "
           SELECT * FROM orders , order_detail
           ORDER BY orders.order_id  DESC
            ";
            $result2 = mysqli_query($conn, $sql);
            // echo '<pre>'.print_r(mysqli_fetch_array($result2)),'<pre>';
            //             exit(0);
					while($row2 = mysqli_fetch_array($result2)) { 
                        
					?>
                    <tr>
                        <td><?php echo $row2['order_date'];?></td>
                        <td><?php echo $row2['product_id'];?></td>
                        <td align="right"><?php echo number_format($row2['price_total'],2);?></td>
                    </tr>
                    <?php
                    @$price_total_total += $row2['price_total'];
                    }
                    ?>
                    <tr class="table-danger">
                         <td align="center"></td>
                        <td align="center">รวม</td>
                        <td align="right"><b>
                        <?php echo number_format($price_total_total,2);?></b></td></td>
                    </tr>
                </table>
            </div>
            <?php mysqli_close($conn);?>
        </div>
    </div>
</div>