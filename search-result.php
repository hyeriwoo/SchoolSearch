<?php

  $page_url = preg_replace('/&page=\d*/', '', $_SERVER['REQUEST_URI']);

  require "config/config.php";

  $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
  if($mysqli->connect_errno) {
    echo $mysqli->connect_error;
    exit();
  }
  $mysqli->set_charset('utf8');

  $sql_location = "SELECT * FROM location";
  $result_location = $mysqli->query($sql_location);
  if(!$result_location) {
    echo $mysqli->error;
    exit();
  }
  $sql_type = "SELECT * FROM college_type";
  $result_type = $mysqli->query($sql_type);
  if(!$result_type) {
    echo $mysqli->error;
    exit();
  }
  $sql_size = "SELECT * FROM student_size";
  $result_size = $mysqli->query($sql_size);
  if(!$result_size) {
    echo $mysqli->error;
    exit();
  }
  $sql_sel = "SELECT * FROM selectivity";
  $result_sel = $mysqli->query($sql_sel);
  if(!$result_sel) {
    echo $mysqli->error;
    exit();
  }

  $sql = "SELECT school.school_id, school.name AS name, school.description AS description, 
          location.location AS location, college_type.college_type AS college_type, 
          selectivity.selectivity AS selectivity, student_size.student_size AS size_range,
          school.student_size AS student_size, school.cost AS cost, 
          school.acceptance_rate AS acceptance_rate, school.website AS website
          FROM school
          LEFT JOIN location
            ON school.location_id = location.location_id
          LEFT JOIN college_type
            ON school.college_type_id = college_type.college_type_id
          LEFT JOIN selectivity
            ON school.selectivity_id = selectivity.selectivity_id
          LEFT JOIN student_size
            ON school.student_size_id = student_size.student_size_id
          WHERE 1=1";

  if(isset($_GET["school"]) && !empty($_GET["school"])) {
    $sql = $sql . " AND school.name LIKE '%" . $_GET["school"] . "%'";
  }
  if(isset($_GET["location"]) && !empty($_GET["location"])) {
    $sql = $sql . " AND school.location_id = " . $_GET["location"];
  }
  if(isset($_GET["college_type"]) && !empty($_GET["college_type"])) {
    $input = $_GET["college_type"];
    foreach($input as $type) {
      $sql = $sql . " AND school.college_type_id = " . $type;
    }
  }
  if(isset($_GET["student_size"]) && !empty($_GET["student_size"])) {
    $sql = $sql . " AND school.student_size_id = " . $_GET["student_size"];
  }
  if(isset($_GET["cost"]) && !empty($_GET["cost"])) {
    $sql = $sql . " AND school.cost <= " . $_GET["cost"];
  }
   if(isset($_GET["selectivity"]) && !empty($_GET["selectivity"])) {
    $sql = $sql . " AND school.selectivity_id = " . $_GET["selectivity"];
  }

  $sql = $sql . ";";
  
  $results = $mysqli->query($sql);
  if(!$results) {
    echo $mysqli->error;
    exit();
  }

  
  // PAGINATION
  $results_per_page = 6;
  $first_page = 1;

  //$row = $results->fetch_assoc();
  $num_results = $results->num_rows;

  $last_page = ceil($num_results / $results_per_page);

  if(isset($_GET['page']) && !empty($_GET['page'])) {
     $current_page = $_GET['page'];
  }
  else {
    $current_page = $first_page;
  }
 
  // Error checking
  if($current_page < $first_page) {
    // force back to the first page
    $current_page = $first_page;
  }
  elseif($current_page > $last_page) {
    $current_page = $last_page;
  }

  // calculate the start index
  $start_index = ($current_page - 1) * $results_per_page;

  // new sql statement for paigination
  $sql = str_replace(';', '', $sql);

  $sql = $sql . " LIMIT " . $start_index . ", " . $results_per_page . ";";

  $results = $mysqli->query($sql);
  if(!$results) {
    echo $mysqli->error;
    exit();
  }

  $mysqli->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Results</title>
  <link rel=" stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<style>
	#filter_form {
      margin: 10px;
      margin-left: auto;
      margin-right: auto;
      color: #666666;
    }
    #filter_form .form-group {
      padding: 10px;
    }
    #filter_btn {
    	margin: 20px;
    }
    #submit-id {
      padding: 5px;
      background-color: white;
      border-color: white;
      color: white;
    }
    #search-id {
      height: 60px;
    }
    .container-fluid .row {
    	margin: 20px;
    }
    #data-container li {
      width: 80%;
    }
    a{
      color: black;
    }
    #school_name {
      font-size: 20px;
    }
    #table {
      padding: 40px;
      border: 1px #727272 solid;
      margin: 10px;
    }
    #info-container {
      padding: 40px;
    }
    .heart {
      background-color: white;
      border-color: white;
      color: white;
      margin: 5px;
      padding: 5px;
    }
    #wish-list {
      position:fixed;
      top: 20%;
      right: 0;
      padding: 30px;
      background-color:#D4CDB6;
      width: 400px;
      border-radius: 25px;
    }
    .pagination > li > a
    {
        background-color: white;
        color: #5A4181;
    }

    .pagination > li > a:focus,
    .pagination > li > a:hover,
    .pagination > li > span:focus,
    .pagination > li > span:hover
    {
        color: #5a5a5a;
        background-color: #eee;
        border-color: #ddd;
    }

    .pagination > .active > a
    {
        color: white;
        background-color: #5A4181 !Important;
        border: solid 1px #5A4181 !Important;
    }

    .pagination > .active > a:hover
    {
        background-color: #5A4181 !Important;
        border: solid 1px #5A4181;
    }
</style>
<body>
  <!-- navigation bar -->
  <nav id="navigation" class="navbar navbar-expand-lg navbar-light navbar-fixed-top">
    <a class="navbar-brand" href="home.php"> <img src="source/school-icon.png" width="50px"> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="home.php">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="review.php">Review</a>
        </li>
      </ul>
    </div>
  </nav>

  <div class = "container-fluid"> <!-- container -->
    <div class = "row">
      <h1 class="col-12"> Search by <?php echo "..." . $_GET['school'] ?> </h1>
      <form action="search-result.php" method="GET" class="col-12" id="search-form">
        <div class="form-row align-items-center justify-content-center">
          <div class="w-15">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </div>
          <div class="col-8 col-md-6 col-lg-4">
            <input type="text" name="school" class="form-control" id="search-id" placeholder="Enter a school">
          </div>
          <div class="w-30">
          <button type="submit" id="submit-id"> <img src="source/search-icon.png" width="40px"> </button>
          </div>
        </div>

        <button class="btn" type="button" id="filter_btn">
            <img src="source/plus-icon.png" width="30px">
        </button>

        <div id="filter_form" class="row justify-content-center">
          <div class="form-group col-12 col-md-6 col-xl-2">
            <label for="location-id" class="col-12"> Location: </label>
            <div class="col-12"> 
              <select name="location" id="location_id" class="form-control">
              <option value="" selected> -- All -- </option>
              <?php while($row = $result_location->fetch_assoc()) : ?>
                <option value="<?php echo $row['location_id']?>">
                  <?php echo $row['location'] ?>
                </option>
              <?php endwhile; ?>
              </select>
            </div>
          </div>

          <div class="form-group col-12 col-md-5 col-xl-3">
            <p class="col-12"> College Type: </p>
            <div class="col-12"> 
              <?php while($row = $result_type->fetch_assoc()) : ?>
                <input type="checkbox" id="<?php echo $row['college_type_id']?>" name="college_type[]" value="<?php echo $row['college_type_id']?>">
                <label for="<?php echo $row['college_type_id']?>"> <?php echo $row['college_type'] ?> </label> <br>
              <?php endwhile; ?>
            </div>
          </div>

          <div class="form-group col-12 col-md-6 col-xl-2">
            <p class="col-12"> Student Body Size: </p>
            <div class="col-12"> 
              <?php while($row = $result_size->fetch_assoc()) : ?>
                <label> <input type="radio" name="student_size" value="<?php echo $row['student_size_id']?>"> <?php echo $row['student_size'] ?> <br> </label> <br> 
              <?php endwhile; ?>
            </div>
          </div>

          <div class="form-group col-12 col-md-6 col-xl-2">
            <p class="col-12"> Cost: </p>
            <div class="col-12"> 
              <input type="range" id="cost" name="cost" min="0" max="50000" value="50000"> 
              </select>
              <p id="cost_value">$50000</p>
            </div>
          </div>

          <div class="form-group col-12 col-md-6 col-xl-2">
            <p class="col-12"> Selectivity: </p>
            <div class="col-12"> 
              <?php while($row = $result_sel->fetch_assoc()) : ?>
                <label> <input type="radio" name="selectivity" value="<?php echo $row['selectivity_id']?>"> <?php echo $row['selectivity'] ?> </label> <br> 
              <?php endwhile; ?>
            </div>
          </div>
        </div>
      </form>
    </div>


    <div class="row justify-content-center" id="info-container">
      <div class="col-12">
        <?php
          if($num_results == 0) {
            echo "No Results Found.";
          }
          else {
            echo "Page " . $current_page . "<br>";
            echo "Showing " . ($start_index+1) . " - " . ($start_index+$results_per_page) . " of " . $num_results . " result(s). ";
          }
        ?>
      </div>
      <?php while($row = $results->fetch_assoc() ) :?>
        <div class="col-12 col-md-5 col-xl-3" id="table"> 
          <img src="source/heart1.png" class="heart" width="40px" alt="<?php echo $row['name']; ?>"> 
          <a href="detail.php?school_id=<?php echo $row['school_id']; ?>" class="col-12" id="school_name"> <h2> <?php echo $row['name']; ?> </h2>
          <img src="source/school.png" class="col-12 w-50">
          </a> 
        </div>
      <?php endwhile;?>
    </div>


    <div class="col-12">
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="<?php echo $page_url . "&page=" . ($current_page - 1); ?>"> Previous</a>
          </li>
          <li class="page-item active">
            <a class="page-link" href=""><?php echo $current_page; ?></a>
          </li>
          <li class="page-item">
          <a class="page-link" href="<?php echo $page_url . "&page=" . ($current_page + 1); ?>">Next</a>
          </li>
        </ul>
      </nav>
    </div> <!-- .col -->

    <div id="wish-list"> <img src="source/heart2.png" width="20px"> My School Wish List <br> </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

  <script>
    var arr = [];
    var heart = document.querySelectorAll(".heart");
    $(window).on('load', function() {
      $("#filter_form").css("display", "none");

      // getting value from local storage
      var item = JSON.parse(localStorage.getItem("arr"));
      for(var i=0; i<item.length; i++){
        console.log(item[i]);
        var element = document.createElement("li");
        element.innerHTML = item[i];
        element.setAttribute("id", item[i]);
        document.querySelector("#wish-list").appendChild(element);
        arr.push(item[i]);

        for(var x=0; x<heart.length; x++) {
          if(heart[x].getAttribute('alt').trim() == item[i]) {
            heart[x].setAttribute("src", "source/heart2.png");
          }
        }
      }
    });

    // slide down and up the input
    $("#filter_btn").click(function() {
      $("#filter_form").slideToggle("slow");
    });

    $("#cost").on("change", function() {
      $("#cost_value").text("$" + $(this).val());
    });

    for(i=0; i<heart.length; i++){
      heart[i].onclick = function() {
        if(this.getAttribute('src') == "source/heart1.png"){
          this.src = "source/heart2.png";
          var element = document.createElement("li");
          element.innerHTML = this.getAttribute('alt');
          element.setAttribute("id", this.getAttribute('alt').trim());
          document.querySelector("#wish-list").appendChild(element);

          // adding to arry
          arr.push(this.getAttribute('alt').trim());
          for(var i=0; i<arr.length; i++){
            console.log(arr[i]);
          }

          // adding array to local storage
          localStorage.setItem("arr", JSON.stringify(arr));
        }
        else {
          this.src = "source/heart1.png";
          var item = document.getElementById(this.getAttribute('alt').trim());
          document.querySelector("#wish-list").removeChild(item);

          // remove from array 
          var index = arr.indexOf(this.getAttribute('alt').trim());
          if(index > -1) {
            arr.splice(index, 1);
          }
          for(var i=0; i<arr.length; i++){
            console.log(arr[i]);
          }

          // adding array to local storage
          localStorage.setItem("arr", JSON.stringify(arr));
        }

      }
    }

  </script>

</body>
</html>