<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 
    <!--제이쿼리-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 	<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
</head>
<body>
    
    <textarea id="test" name="test" cols="30" rows="10" class="form-control" ></textarea>
    <div id="test_cnt">(0 / 200)</div>
 
    <script>
 
    $(document).ready(function() {
        $('#test').on('keyup', function() {
            $('#test_cnt').html("("+$(this).val().length+" / 200)");
 
            if($(this).val().length > 200) {
                $(this).val($(this).val().substring(0, 200));
                $('#test_cnt').html("(200 / 200)");
            }
        });
    });
        
    </script>
 
</body>
</html>
