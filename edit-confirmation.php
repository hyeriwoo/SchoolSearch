<?php
  require "config/config.php";
  $isUpdated = false;

  if(!isset($_GET['review_id']) || empty($_GET['review_id'])) {
    $error = "Invalid Review ID";
    exit();
  }
  else {

    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if ( $mysqli->connect_errno ) {
      echo $mysqli->connect_error;
      exit();
    }

    $statement = $mysqli->prepare("UPDATE review SET school_id=?, review=?, password=? WHERE review_id = ?");
    $statement->bind_param("issi", $_POST['school'], $_POST['review'], $_POST['password'], $_GET['review_id']);
    $executed = $statement->execute();
    if(!executed) {
      echo $mysqli->error;
    }
    if($statement->affected_rows == 1 || $statement->affected_rows == 0) {
      $isUpdated = true;
    }
    $statement->close();
    $mysqli->close();
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Edit Confirmation</title>
  <link rel=" stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<style>
		.container-fluid h2 {
			padding: 50px;
			margin-top: 100px;
			margin-bottom: 100px;
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

  <div class="container-fluid">
    <div class="row justify-content-center">
      <?php if(isset($error) && !empty($error)) :?>
        <div class="text-danger font-italic">
        <?php echo $error; ?>
      <?php endif; ?>
      <?php if($isUpdated) :?>
        <h3 class="text-success"> <span class="font-italic"> <?php echo $_POST['review']; ?> </span> <br> <br> review was successfully edited! </h3>
      <?php endif; ?>
    </div>
    <div class="row mt-4 mb-4">
      <div class="col-12">
      <a href="detail.php?school_id=<?php echo $_POST['school'] ?>" role="button" class="btn btn-dark">Back to Detail</a>
      <a href="home.php" role="button" class="btn btn-dark">Back to Home</a>
      </div> <!-- .col -->
    </div> <!-- .row -->
  </div>


   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>	

</body>
</html>