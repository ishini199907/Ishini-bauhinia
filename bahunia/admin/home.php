<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bahunia Clothing Store Dashboard</title>

    <!-- Add your existing CSS and JS libraries here -->

    <!-- Add Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

    <div class="container-fluid">
        <center><h1>Welcome to <?php echo $_settings->info('name') ?></h1></center>
        <hr>

        <div class="row">
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box">
                    <span class="info-box-icon bg-maroon elevation-1"><i class="fas fa-table"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Stocks</span>
                        <span class="info-box-number">
                            <?php 
                            $inv = $conn->query("SELECT sum(quantity) as total FROM inventory ")->fetch_assoc()['total'];
                            $sales = $conn->query("SELECT sum(quantity) as total FROM order_list where order_id in (SELECT order_id FROM sales) ")->fetch_assoc()['total'];
                            echo number_format($inv - $sales);
                            ?>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-purple elevation-1"><i class="fas fa-th-list"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Pending Orders</span>
                        <span class="info-box-number">
                            <?php 
                            $pending = $conn->query("SELECT sum(id) as total FROM `orders` where status = '0' ")->fetch_assoc()['total'];
                            echo number_format($pending);
                            ?>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Sales Today</span>
                        <span class="info-box-number">
                            <?php 
                            $sales = $conn->query("SELECT sum(amount) as total FROM `orders` where date(date_created) = '".date('Y-m-d')."' ")->fetch_assoc()['total'];
                            echo number_format($sales);
                            ?>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-pink elevation-1"><i class="fas fa-users"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Registered Clients</span>
                        <span class="info-box-number">
                            <?php 
                            $clients = $conn->query("SELECT * FROM `clients` where delete_flag = 0 ")->num_rows;
                            echo number_format($clients);
                            ?>
                        </span>
                    </div>
                </div>
            </div>
        </div>

<!-- Chart: Sales Trend -->
<div class="row mt-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Sales Trend</h3>
            </div>
            <div class="card-body">
                <canvas id="salesChart" style="height: 250px;"></canvas>
            </div>
        </div>
    </div>
</div>

        <!-- Table: Top Selling Products -->
<div class="row mt-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Top Selling Products</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity Sold</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>T-Shirt</td>
                            <td>120</td>
                        </tr>
                        <tr>
                            <td>Jeans</td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>Hoodie</td>
                            <td>80</td>
                        </tr>
                        <tr>
                            <td>Shorts</td>
                            <td>75</td>
                        </tr>
                        <tr>
                            <td>Dress</td>
                            <td>60</td>
                        </tr>
                        <!-- Add more rows with sample data -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


    </div>

    <script>
// Sample data for the chart
var salesChartData = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [
        {
            label: 'Monthly Sales',
            backgroundColor: 'rgba(60,141,188,0.9)',
            borderColor: 'rgba(60,141,188,0.8)',
            data: [15000, 18000, 22000, 20000, 25000, 28000, 30000, 32000, 28000, 25000, 20000, 18000]
        }
    ]
};

// Get the chart element
var salesChartCanvas = document.getElementById('salesChart').getContext('2d');

// Create the chart
var salesChart = new Chart(salesChartCanvas, {
    type: 'bar',
    data: salesChartData,
    options: {
        maintainAspectRatio: false,
        responsive: true,
        legend: {
            display: false
        },
        scales: {
            xAxes: [{
                gridLines: {
                    display: false
                }
            }],
            yAxes: [{
                gridLines: {
                    display: false
                }
            }]
        }
    }
});
</script>