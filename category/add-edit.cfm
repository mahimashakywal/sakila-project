<cfparam name="url.id" default="0" />

<cfparam name="form.name" default="" />

<cfif val(url.id)>

    <cfset variables.category = new components.categoryGateway().get( id = url.id ) />

    <cfset form.name = variables.category.getName()/>
</cfif>
 
 
<!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <link rel="stylesheet" href="style-ticket-booking.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assests/helper.js"></script>

</head>

<cfoutput>
<body>

    <cfinclude template="/includes/header.cfm" />

    <h1 class="text-center mt-5">ADD / EDIT</h1>

    <form action="action-page.cfm"  method="post" id="editFrm" name="editFrm"  class="container">

        <div class="w-25 border border-dark bg-light mx-auto mt-5 mb-5 p-5 rounded ">  
                
            <input type="hidden" id="category_id" name="id" value="#url.id#" />

            <div class="w-50">      
                <label for="name">Category Name:<sup>*</sup></label>
                <input type="text" id="name" name="name" value="#form.name#" required/>
            </div>

            <div class="text-center pt-4">
                <button class="btn btn-dark w-50" type="button" onclick="validateForm()">Submit</button>
            </div >
        </div>  

    </form>

    <script>
        function validateForm(){
            const form = document.editFrm;
            const {
                name
            } = form;

            if(!isBlank(name, 'Please enter category name!')) {
                name.focus();
                return false;
            };

            form.submit();
        }
    </script>

</body>
</cfoutput>

</html>