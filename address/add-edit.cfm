<cfparam name="url.id" default="0" />

<cfparam name="form.address" default="" />
<cfparam name="form.address2" default="" />
<cfparam name="form.district" default="" />
<cfparam name="form.postal_code" default="" />
<cfparam name="form.phone" default="" />
<cfparam name="form.city" default="" />

<cfset variables.qGetCities = new components.cityGateway().getCities() />

<cfif val(url.id)>

    <cfset variables.qGetAddress = new components.addressGateway().get(
        id = url.id
    ) />
    <cfset form.address = variables.qGetAddress.address />
    <cfset form.address2 = variables.qGetAddress.address2 />
    <cfset form.district = variables.qGetAddress.district />
    <cfset form.postal_code = variables.qGetAddress.postal_code />
    <cfset form.phone = variables.qGetAddress.phone />
    <cfset form.city = variables.qGetAddress.city_id />
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
                <label for="address">Address:<sup>*</sup></label>
                <input type="text" id="address" name="address" value="#form.address#" class="mb-3"/>
            </div>

            <div class="w-50">      
                <label for="address2">Address 2:<sup>*</sup></label>
                <input type="text" id="address2" name="address2" value="#form.address2#" class="mb-3"/>
            </div>

            <div class="w-50">
                <label for="district">District:<sup>*</sup></label>
                <input type="text" id="district" name="district" value="#form.district#" class="mb-3"/>
            </div>

            <div class="w-50">
                <label for="city">City:<sup>*</sup></label>
                <select id="city" name="city" class="w-100 mb-3">
                    <option value="">Select</option>
                    <cfloop query="variables.qGetCities">
                        <option value="#variables.qGetCities.city_id#" <cfif form.city EQ '#variables.qGetCities.city_id#'>selected</cfif>>
                            #variables.qGetCities.city# [#variables.qGetCities.country#]
                        </option>
                    </cfloop>
                </select>
            </div>

            <div class="w-50">
                <label for="postal_code">Postal Code<sup>*</sup></label>
                <input type="number" id="postal_code" name="postal_code" value="#form.postal_code#" class="mb-3"/>
            </div>

            <div>
                <label for="phone">Phone No<sup>*</sup></label>
                <input type="number" id="phone" name="phone" value="#form.phone#" class="mb-3"/>
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
                address,
                address2,
                district,
                city,
                postal_code,
                phone
            } = form;
            
            if(!isBlank(address, 'Please enter your address!')) {
                address.focus();
                return false;
            };

            if(!isBlank(address2, 'Please enter your address!')) {
                address2.focus();
                return false;
            };

            if(!isBlank(district, 'Please enter your district!')) {
                district.focus();
                return false;
            };

            if(!isBlank(city, 'Please enter your city!')) {
                city.focus();
                return false;
            };

            if(!isBlank(postal_code, 'Please enter your postal code!')) {
                postal_code.focus();
                return false;
            };

            if(!isBlank(phone, 'Please enter your phone number')){
                phone.focus();
                return false;
            };

            if(!isNumber(phone, "Please enter a valid phone No.")){
                phone.focus();
                return false;
            };

            form.submit();
        }
    </script>

</body>
</cfoutput>

</html>