<cfoutput>

    <cfparam name="url.page" default="1" />
    <cfparam name="url.maxRows" default="10" />

    <cfset variables.qGetAddress = new components.addressGateway().list(
        page = url.page,
        maxRows = url.maxRows
    )/>

    <cfset variables.qGetCities = new components.cityGateway().getCities() />

<!DOCTYPE html>
<html>
    <head>
        <title>Address list</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/assests/helper.js"></script>
    
    </head>

    <body>

        <cfinclude template="/includes/header.cfm" />

        <h1 class="text-center mt-2">ADDRESS</h1>

        <div class="container">

            <div class="float-end mb-4">
                <button class="btn btn-dark ml-auto"><a href="add-edit.cfm" class="text-light link-underline-dark">ADD</a></button>
            </div>

            <table cellpadding="5" cellspacing="0" width="100%" class="text-center mb-4 table-bordered ">
                <tr>
                    <th>Address Id</th>
                    <th>Address</th>
                    <th>District</th>
                    <th>Postal Code</th>
                    <th>Phone No</th>
                    <th>Actions</th>
                </tr>

                <cfloop query="variables.qGetAddress">
                    <tr class="text-center">
                        <td>#variables.qGetAddress.address_id#</td>
                        <td>#variables.qGetAddress.address#</td>
                        <td>#variables.qGetAddress.district#</td>
                        <td>#variables.qGetAddress.postal_code#</td>
                        <td>#variables.qGetAddress.phone#</td>
                        <td><a href="add-edit.cfm?id=#variables.qGetAddress.address_id#">Edit</a></td>
                    </tr>
                </cfloop>

                
            </table>
        </div>

        <div class="text-center pt-4">
            <input type="button" class="btn btn-dark ml-auto" value="PREVIOUS" onclick="prev_pages()">
            <input type="button" class="btn btn-dark ml-auto" value="NEXT" onclick="next_pages()">
        </div>

        <input type="hidden" name="page" value="#url.page#"/>

    </body>
</html>
</cfoutput>