<cfparam name="url.id" default="0" />

<cfparam name="form.first_name" default="" />
<cfparam name="form.last_name" default="" />
<cfparam name="form.email" default="" />

<cfif val(url.id)>

    <cfset variables.actor = new components.actorGateway().get( id = url.id ) />

    <cfset form.first_name = variables.actor.getFirst_name()/>
    <cfset form.last_name = variables.actor.getLast_name() />
    <cfset form.email = variables.actor.getEmail() />

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
                
            <input type="hidden" id="actor_id" name="actor_id" value="#url.id#" />
            <div class="w-50">      
                <label for="first_name">First Name:<sup>*</sup></label>
                <input type="text" id="first_name" name="first_name" value="#form.first_name#" />
            </div>

            <div class="w-50">      
                <label for="last_name">Last Name:<sup>*</sup></label>
                <input type="text" id="last_name" name="last_name" value="#form.last_name#" />
            </div>

            <div class="w-50">
                <label for="email">Email:<sup>*</sup></label>
                <input type="email" id="email" name="email" value="#form.email#" />
            </div>

            <div class="text-center pt-4">
                <button class="btn btn-dark w-50" type="button" onclick="validateForm()">Submit</button>
            </div >
        </div>  

    </form>

    <script>

        function validateForm() {
            const form = document.editFrm;
            const {
                first_name,
                last_name,
                email
            } = form;

            if(!isBlank(first_name, 'Please enter your first name!')) {
                first_name.focus();
                return false;
            };

            if(!isBlank(last_name, 'Please enter your first name!')) {
                last_name.focus();
                return false;
            };

            if(!isBlank(email, 'Please enter your email!')) {
                email.focus();
                return false;
            };

            form.submit();
        }
    </script>

</body>
</cfoutput>

</html>