<?php
  if(!isset($_GET['review_id']) || empty($_GET['review_id'])) {
    $error = "Invalid Review ID";
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

    $sql = "SELECT * FROM review
                   WHERE review.review_id=" . $_GET['review_id'] . ";";
    $results = $mysqli->query($sql);
    if(!$results) {
      echo $mysqli->error;
      exit();
    }
    $row = $results->fetch_assoc();
    $mysqli->close();
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Edit Or Delete</title>
  <link rel=" stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <style>
    #edit-btn, #delete-btn {
      visibility: hidden;
    }

    #password {
    	height: 40px;
    }

    .container-fluid h1 {
    	margin-top: 50px;
    	padding: 60px;
    }

    #message {
    	margin: 20px;
    }

    #edit-btn, #delete-btn {
    	margin: 10px;
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
   <div class="row justify-content-center col-12"> 
    <?php if(isset($error) && !empty($error)) :?>
      <div class="text-danger font-italic">
        <?php echo $error; ?>
      </div>
    <?php else: ?>
      <h1 class="col-12"> Please enter a password for this review </h1>
      <form method="post" name="password-checker" id="form-password" action="">
        <input type="password" id="password" name="password">
        <button type="submit" id="confirm-btn" class="btn btn-dark"> Confirm </button>
        <p id="message"> </p>
       </div>
     </form>
     <div class="form-row justify-content-center col-12">
      <form action="edit.php?review_id=<?php echo $_GET['review_id']?>" method="POST"> 
        <button type="submit" class="btn btn-dark" id="edit-btn"> Edit this review </button>
      </form>
      <form action="delete.php?review_id=<?php echo $_GET['review_id']?>" method="POST"> 
        <button type="submit" class="btn btn-dark" id="delete-btn" onclick="return confirm('Are you sure about delete this reivew?')"> Delete this review </button>
      </form>
    <?php endif; ?>
   </div>
  </div>


  <script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

  <script>

    $("#confirm-btn").click(function() {
      event.preventDefault();
      $("#message").html("Confirmed!");
      if($("#password").val() == "") {
        $("#message").html("Please enter password!");
      }
      else if($("#password").val() == "<?php echo $row['password']; ?>"){
        $("#message").html("Confirmed!");
        $("#edit-btn").css("visibility", "visible");
        $("#delete-btn").css("visibility", "visible");
      }
      else {
        $("#message").html("Wrong Password! Try Again!");
        $("#edit-btn").css("visibility", "hidden");
        $("#delete-btn").css("visibility", "hidden");
      }
    });



  </script>

</body>
</html>