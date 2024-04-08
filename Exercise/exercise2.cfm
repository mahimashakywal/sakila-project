<cfquery name="variables.qActor" datasource="sakila">
    select *
    from actor
</cfquery>

<cfoutput>
<!DOCTYPE html>
<html>
    <head>
        <title>EXERCISE 2</title>
        <style>
            table{
                border: 1px solid black;
                border-collapse: collapse;
            }
        </style>
    </head>

    <body>
        <table border="2" cellpadding="5">
            <cfloop from="1" to="#variables.qActor.RecordCount()#" index="variables.count">
                <tr>
                    <td>#variables.count#</td>
                    <td>#variables.qActor.getRow(variables.count).first_name#</td>
                </tr>
            </cfloop>
        </table>
    </body>
</html>
</cfoutput>