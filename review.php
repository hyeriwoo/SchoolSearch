<?php
  // this review.php connect from navigation bar (which does not value of school_id)
  // and from detail "Add review" button which has value of school_id, so 
  // I did not error check about this. 
    require "config/config.php";

    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if($mysqli->connect_errno) {
      echo $mysqli->connect_error;
      exit();
    }
    $mysqli->set_charset('utf8');
    $sql = "SELECT * FROM school
        ORDER BY school.name;";
    $result = $mysqli->query($sql);
    if(!$result) {
      echo $mysqli->error;
      exit();
    }
  // }
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Review</title>
  <link rel=" stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<style>
	.container-fluid .row h1 {
		font-size: 80px;
		margin: 35px;
	}

	#review_id {
		height: 250px;
	}

	.col-9 {
		margin: 20px;
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

  <div class="container-fluid">
    <div class="row justify-content-center">
      <h1> Write A Review! </h1>
    </div>
    <div class="row justify-content-center">
      <form action="review-confirmation.php" method="POST" class="col-12" id="search-form">
        <div class="form-row justify-content-center">
          <div class="col-9 col-md-7"> 
            <select name="school" id="school_id" class="form-control">
              <option value="" selected> Select A School </option>
                <?php while($row = $result->fetch_assoc()) : ?>
                    <?php if($_GET['school_id'] == $row['school_id']) :?>
                    <option selected value="<?php echo $row['school_id']; ?>">
                      <?php echo $row['name'] ?>
                    </option>
                    <?php else: ?>
                      <option value="<?php echo $row['school_id']; ?>">
                        <?php echo $row['name'];?>
                      </option>
                    <?php endif; ?>
                <?php endwhile; ?>
            </select>
          </div>
          <div class="col-9 col-md-7"> 
            <div> 1000 characters limits: </div>
            <textarea name="review" id="review_id" class="form-control" placeholder="text here"> </textarea>
          </div>
          <div class="col-9 col-md-7"> 
            <label for="password"> Please enter password for this review: <br>     </label>
            <input type="password" id="password" name="password" placeholder="password">
          </div>
          <div class="col-9 col-md-7">
            <button type="submit" class="btn btn-dark" id="submit-btn">Submit</button>
            <button type="reset" class="btn btn-dark">Reset</button>
          </div>
        </div>
      </form>
    </div>
  </div>


   <script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script>


  $("form").submit(function() {
    if($("#school_id").val().trim() == "") {
      alert("Please select a school");
      return false;
    }
    if($("#review_id").val().trim() == "") {
      alert("Please write a reivew to add");
      return false;
    }
    if($("#password").val().trim() == "") {
      alert("Please enter password!");
      return false;
    }
    if($("#review_id").val().length > 1000) {
      alert("Text cannot be over 1000 characters");
      return false;
    }
  });


</script>

</body>
</html>