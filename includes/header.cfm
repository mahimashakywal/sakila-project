<!DOCTYPE html>
<html>
    <head>
        <title>header</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
         integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body>

        <nav class="navbar navbar-dark bg-dark ">


             <div class="navbar-nav  mt-2 d-flex flex-row w-100 justify-content-between "> 
                
                <div class="nav-item active">
                    <button type="button" class="btn btn-dark">
                        <a href="/welcome.cfm" class="nav-link text-light mx-5">
                            <i class="fa-solid fa-house"></i>
                        </a>
                    </button>
                </div>

                <div class="nav-item active m">
                    <button class="btn btn-dark  mx-5 " type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa-solid fa-ellipsis-vertical"></i>
                    </button>

                    <button type="button" class="btn btn-dark">
                        <a href="/log_out.cfm" class="nav-link text-light mx-5">
                            <i class="fa-solid fa-right-from-bracket"></i>
                        </a>
                    </button>
                </div>
                
            </div>
        </nav>

        
        <div class="collapse" id="navbarToggleExternalContent">
            <div class="bg-dark p-4 d-flex">
                <a href="/actor/index.cfm" class="nav-link text-light mx-4">ACTOR</a>

                <a href="/address/index.cfm" class="nav-link text-light mx-4">ADDRESS</a>

                <a href="/customer/index.cfm" class="nav-link text-light mx-4">CUSTOMER</a>

                <a href="/category/index.cfm" class="nav-link text-light mx-4">CATEGORY</a>

                <a href="/country/index.cfm" class="nav-link text-light mx-4">COUNTRY</a>
            </div>
        </div>
    
    </body>

</html>
