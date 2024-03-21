<cfoutput>

    <cfparam name="url.page" default="1" />
    <cfparam name="url.maxRows" default="10" />

    <cfset variables.qGetActors = new components.actorGateway().list(
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
                  <li class="breadcrumb-item active" aria-current="page"><a href="/actor/index.cfm">Actor</a></li>
                </ol>
              </nav>
            </div>
        </nav>

        <h1 class="text-center mt-2">ACTOR</h1>

        <div class="container">

            <div class="float-end mb-4">
                <button class="btn btn-dark ml-auto"><a href="add-edit.cfm" class="text-light link-underline-dark">ADD</a></button>
            </div>

            <table cellpadding="5" cellspacing="0" width="100%" class="text-center mb-4 table-bordered ">
                <tr>
                    <th>Actor Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>

                <cfloop query="variables.qGetActors">
                    <tr class="text-center">
                        <td>#variables.qGetActors.actor_id#</td>
                        <td>#variables.qGetActors.first_name#</td>
                        <td>#variables.qGetActors.last_name#</td>
                        <td>#variables.qGetActors.email#</td>
                        <td><a href="add-edit.cfm?id=#variables.qGetActors.actor_id#">Edit</a></td>
                    </tr>
                </cfloop>

                
            </table>
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