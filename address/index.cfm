<cfoutput>

    <cfparam name="url.page" default="1" />
    <cfparam name="url.maxRows" default="10" />

    <cfset variables.qGetAddress = new components.addressGateway().list(
        page = url.page,
        maxRows = url.maxRows
    )/>

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

        <nav data-mdb-navbar-init class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/welcome.cfm">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><a href="/address/index.cfm">Address</a></li>
                </ol>
              </nav>
            </div>
        </nav>

        <h1 class="text-center mt-2">ADDRESS</h1>

        <div class="container">

            <div class="float-end mb-4">
                <button class="btn btn-dark ml-auto"><a href="add-edit.cfm" class="text-light link-underline-dark">ADD</a></button>
            </div>

    
                <cfset variables.columns = [
                    {
                        'label' : 'Address Id',
                        'fieldName' : 'address_id'
                    },
                    {
                        'label' : 'Address',
                        'fieldName' : 'address'
                    },
                    {
                        'label' : 'District',
                        'fieldName' : 'district'
                    },
                    {
                        'label' : 'Postal Code',
                        'fieldName' : 'postal_code'
                    },
                    {
                        'label' : 'Phone No',
                        'fieldName' : 'phone'
                    },
                    {
                        'label' : 'Action',
                        'content' : (category) => {
                            return '<a href="add-edit.cfm?id=#variables.qGetAddress.address_id#">Edit</a>';
                        }
                    }
                ] />
    
                <cfmodule template="/includes/table.cfm" columns="#variables.columns#" qData="#variables.qGetAddress#" >

        </div>

        <div class="text-center pt-4">
            <input type="button" class="btn btn-dark ml-auto" value="PREVIOUS" onclick="prev_pages()">
            <input type="button" class="btn btn-dark ml-auto" value="NEXT" onclick="next_pages()">
        </div>

        <input type="hidden" name="page" value="#url.page#"/>

    </body>
</html>
</cfoutput>