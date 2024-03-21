<cfparam name="url.id" default="0" />

<cfparam name="form.first_name" default="" />
<cfparam name="form.last_name" default="" />
<cfparam name="form.email" default="" />
<cfparam name="form.store_id" default="" />
<cfparam name="form.address_id" default="" />

<cfif val(url.id)>

    <cfset variables.customer = new components.customerGateway().get( customer_id = url.id ) />

    <cfset form.first_name = variables.customer.getFirstName() />
    <cfset form.last_name = variables.customer.getLastName() />
    <cfset form.email = variables.customer.getEmail() />
    <cfset form.store_id = variables.customer.getStoreId() />

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
                
            <input type="hidden" id="id" name="id" value="#url.id#" />

            <div class="w-50">      
                <label for="first_name">First Name:<sup>*</sup></label>
                <input type="text" id="first_name" name="first_name" value="#form.first_name#" class="mb-3"/>
            </div>

            <div class="w-50">      
                <label for="last_name">Last Name:<sup>*</sup></label>
                <input type="text" id="last_name" name="last_name" value="#form.last_name#" class="mb-3"/>
            </div>

            <div class="w-50">
                <label for="email">Email:<sup>*</sup></label>
                <input type="text" id="email" name="email" value="#form.email#" class="mb-3"/>
            </div>

            <div class="w-50">
                <label class="d-block">Store:<sup>*</sup></label>

                <input type="radio" id="str1" name="store_id" value="1" class="mb-3" <cfif form.store_id EQ 1>checked</cfif>/>
                <label for="str1">Store 1</label><br/>

                <input type="radio" id="str2" name="store_id" value="2" class="mb-3" <cfif form.store_id EQ 2>checked</cfif>/>
                <label for="str2">Store 2</label>
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
                email,
                store_id
            } = form;

            if(!isBlank(first_name, 'Please enter your first name!')) {
                first_name.focus();
                return false;
            };

            if(!isBlank(last_name, 'Please enter your last name!')) {
                last_name.focus();
                return false;
            };

            if(!isBlank(email, 'Please enter your email!')) {
                email.focus();
                return false;
            };

            if(!isBlank(store_id, 'Please choose a store!')) {
                store_id.focus();
                return false;
            };

            form.submit();
        }
    </script>
</body>
</cfoutput>

</html>