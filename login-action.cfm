<cfquery name = "variables.qCheckInformation" datasource = "sakila" >
    select *
    from actor
    where email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" /> and
     password = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar" />;
</cfquery>


<cfif variables.qCheckInformation.recordCount EQ 0 >
    <cflocation url = "index.cfm?Invalid_Information" addtoken="false" />
<cfelse>
    <cfset session.name= #variables.qCheckInformation.first_name# />
    <cflocation url = "welcome.cfm?message=login_successfully" addtoken="false" />
</cfif>  
