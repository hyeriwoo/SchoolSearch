<?php
  require "config/config.php";

  $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
  if($mysqli->connect_errno) {
    echo $mysqli->connect_error;
    exit();
  }
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

  $mysqli->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
  <link rel=" stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <style>
    #filter_form {
      margin: 10px;
      margin-left: auto;
      margin-right: auto;

    }
    #filter_form .form-group {
      padding: 10px;
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

    .container-fluid .row h1 {
		  font-size: 100px;
	   }

	.container-fluid .row {
		padding: 50px;
		text-align: center;
		margin-right: auto;
		margin-left: auto;
		color: #1F1F1F ;
	}

	.container-fluid .form-row {
		text-align: center;
		padding: 30px;
		margin-right: auto;
		margin-left: auto;
	}


    #wrap {
      font-size: 6rem;
      font-weight:  100;
      letter-spacing: 2px;
      text-align: center;
      color: #f35626;
      background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      -webkit-animation: hue 10s infinite linear;
    }

    @-webkit-keyframes hue {
      from {
        -webkit-filter: hue-rotate(0deg);
      }
      to {
        -webkit-filter: hue-rotate(-360deg);
      }
    }

    @media(max-width: 600px) {
      #wrap {
        font-size: 70px;
      }
    }



  </style>
</head>
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
    <div class = "row justify-content-center">
      <h1 class="col-12" id="wrap"> FIND <br> YOUR <br> SCHOOL</h1>
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
  </div> <!-- container -->


  <script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

  <script>
    $(window).on('load', function() {
      $("#filter_form").css("display", "none");
    });

    // slide down and up the input
    $("#filter_btn").click(function() {
      $("#filter_form").slideToggle("slow");
    });

    $("#cost").on("change", function() {
      $("#cost_value").text("$" + $(this).val());
    })

  </script>

</body>
</html>