<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="../../../resources/css/HosinsaLogin.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>  
<body>
    <header>
        <h1 style="text-align: center;">Hosinsa</h1>
    </header>

    <div class="slider">
        <div class="login">
            <form method="post" action="">
                <div class="login_box">
                    <span style="text-align: center;">ID</span>
                    <input type="text" name="id">
                    <br><br>
                    <span style="text-align: center;" class="span_password">PASSWORD</span>
                    <input type="password" name="password" placeholder>
                    <br><br>
                    <input type="submit" value="LOG IN" class="input_login">
                    <br><br>
                    <button id="JoinBtn" type="button">JOIN MEMBER</button>
                </div>
            </form>
        </div>
    </div>

    <footer></footer>
</body>

<script type="text/javascript">
$(document).ready(function() {
	$("#JoinBtn").on("click", function() {
		self.location = "/member/join";
	});
});
</script>
</html>
