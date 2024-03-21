<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN PAGE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="container bg-dark">

        <h1 class="text-light text-center mt-5">LOG-IN</h1>

        <form action="./login-action.cfm" method="POST" class="container">
            <div class="w-25 border border-dark bg-light mx-auto mt-5 mb-5 p-5 rounded ">   
                    <div class="w-50">      
                        <label for="email" class="pt-3 pb-1 fw-bold">Email Id:</label>
                        <input type="email" id="email" required name="email" value="" />
                    </div>

                    <div class="w-50">      
                        <label for="password" class="pt-3 pb-1 fw-bold">Password:</label>
                        <input type="password" required id="password" name="password" value=""/>
                    </div>

                    <div class="text-center pt-4">
                        <button class="btn btn-dark w-50">LOGIN</button>
                    </div >
            </div>
        <form>
    </body>
</html> 