<?php
  if(!isset($_GET['school_id']) || empty($_GET['school_id'])) {
    $error = "Invalid School ID";
    exit();
  }
  else {
    require "config/config.php";

    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if($mysqli->connect_errno) {
      echo $mysqli->connect_error;
      exit();
    }
    $mysqli->set_charset('utf8');

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
          WHERE school.school_id=" . $_GET['school_id'] . ";";
    $results = $mysqli->query($sql);
    if(!$results) {
      echo $mysqli->error;
      exit();
    }
    $row = $results->fetch_assoc();


    $sql_review = "SELECT * FROM review
                   WHERE review.school_id=" . $_GET['school_id'] . ";";
    $results_review = $mysqli->query($sql_review);
    if(!$results_review) {
      echo $mysqli->error;
      exit();
    }

    $mysqli->close();
  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detail</title>
  <link rel=" stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<style>
  #school-header {
    height: auto;
    padding: 20px;
  }
  #school-header h1 {
    height: auto;
    font-size: 60px;
    padding: 0px;
    margin: 0px;
  }
  #school-header p {
    font-size: 20px;
    height: auto;
  }
  #school-info .col-12 {
    padding: 10px;
  }
  #school-info {
    margin: 20px;
    margin-bottom: 50px;
  }
  #add-btn {
    margin: 20px;
  }
  .infos {
    font-size: 30px;
  }
  .table {
    margin: 10px;
    background-color: #B6D5B8 ;
    padding: 20px;
  }
  #noReview {
    padding: 30px;
  }
  .review_container {
    padding: 40px;
  }
  .edit_btn {
    padding-top: 20px;
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
    <div class="row justify-content-center" id="school-header">
      <h1 class="col-12"> <?php echo $row['name']; ?> </h1>
      <p class="col-10 col-md-8 col-xl-6" id="des"> <?php echo $row['description']; ?> </p>
    </div>
    <div class="row justify-content-center" id="school-info">
      <?php if(isset($error) && !empty($error)) :?>
          <div class="text-danger font-italic">
            <?php echo $error; ?>
          </div>
        <?php else: ?>
          <div class="col-10 col-md-5 table"> Location: <br> <span class="infos"> <?php echo $row['location']; ?> </span> </div>
          <div class="col-10 col-md-5 table"> Website: <br> <span class="infos"> <a href="<?php echo "http://" . $row['website']; ?>"><?php echo $row['website']; ?></a> </span> </div>
          <div class="col-10 col-md-5 table"> College Type: <br> <span class="infos"> <?php echo $row['college_type']; ?> </span> </div>
          <div class="col-10 col-md-5 table"> Student Body Size: <br> <span class="infos"> <?php echo $row['student_size']; ?> </span> </div>
          <div class="col-10 col-md-5 table"> Cost: <br> <span class="infos"> $ <?php echo $row['cost']; ?> per year </span> </div>
          <div class="col-10 col-md-5 table"> Acceptance Rate: <br> <span class="infos"> <?php echo $row['acceptance_rate']; ?> </span> </div>
        <?php endif; ?>
    </div>

    <div class="row justify-content-center" id="see-review">
      <h2 class="col-12"> Review </h2>
      <ul class="list-group col-10 col-md-6" id="ranking-list">
        <form method="GET" action="" id="editORdelete-id">
          <div id=noReview> <?php
            if($results_review->num_rows == 0) {
              echo "No Review! Please Add the first review!";
            }
          ?> </div>
          <?php while($row = $results_review->fetch_assoc()) : ?>
            <li class="list-group-item col-12 review_container"> 
                <?php echo $row['review'] ?>
                <div class="col-12 edit_btn"> <a href="editORdelete.php?review_id=<?php echo $row['review_id'] ?>"> Edit or Delete this Review </a> <br> </div>
            </li>
          <?php endwhile; ?>
        </form>
      </ul>
    </div>

    <div class="row justify-content-center" id="edit-review">
      <form method="POST" action="review.php?school_id=<?php echo $_GET['school_id'] ?>" id="write-id">
        <button type="submit" class="btn btn-dark" id="add-btn"> Add A Review </button>
      </form>
    </div>

  </div>


   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>	

    <script>

    </script>

</body>
</html>