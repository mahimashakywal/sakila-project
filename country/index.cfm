<cfoutput>

    <cfparam name="url.page" default="1" />
    <cfparam name="url.maxRows" default="10" />

    <cfset variables.qGetCountry = new components.countryGateway().list(
        page = url.page,
        maxRows = url.maxRows
    )/>

<!DOCTYPE html>
<html>
    <head>
        <title>Actor list</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    </head>

    <body>

        <cfinclude template="/includes/header.cfm" />

        <nav data-mdb-navbar-init class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/welcome.cfm">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><a href="/country/index.cfm">Country</a></li>
                </ol>
              </nav>
            </div>
        </nav>

        <h1 class="text-center mt-2">COUNTRY</h1>

        <div class="container">

            <div class="float-end mb-4">
                <button class="btn btn-dark ml-auto"><a href="add-edit.cfm" class="text-light link-underline-dark">ADD</a></button>
            </div>

            <cfset variables.columns = [
                {
                    'label' : 'Id',
                    'fieldName' : 'country_id'
                },
                {
                    'label' : 'Country',
                    'fieldName' : 'country'
                },
                {
                    'label' : 'Action',
                    'content' : (country) => {
                        return '<a href="add-edit.cfm?id=#country.country_id#">Edit</a>';
                    }
                }
            ] />

            <cfset new components.utility().CreateTable(
                columns = variables.columns,
                qData = variables.qGetCountry
            ) />
        </div>

        <div class="text-center pt-4">
            <input type="button" class="btn btn-dark ml-auto" value="PREVIOUS" onclick="prev_pages()">
            <input type="button" class="btn btn-dark ml-auto" value="NEXT" onclick="next_pages()">
        </div>

        <input type="hidden" name="page" value="#url.page#"/>
    
        <script src="/assests/helper.js"></script>
    </body>
</html>
</cfoutput>