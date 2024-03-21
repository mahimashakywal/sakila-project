<cfif NOT structKeyExists(session, 'name') >
    <cflocation url="index.cfm?msg=session expired" addtoken="false" />
</cfif>

<!DOCTYPE html>
<html>
    <head>
        <title>List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
            <cfinclude template="./includes/header.cfm" />

        <cfoutput>
            <div class="text-center mt-5 ">
                <h1 class="fs-1"> WELCOME #session.name# </h1>
            </div>
        </cfoutput>
    </body>

</html>