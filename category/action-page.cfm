
<cfif form.category_id eq 0>
    <!--- Insert --->
    
    <cfset variables.categoryGateway = new components.categoryGateway() />
    <cfset variables.categoryGateway.insert(
        name = form.name
    ) />

    <cfset variables.message = "Record inserted suceessfully" />

    
<cfelseif form.category_id GT 0>
    <!--- Update --->
    
    <cfset variables.categoryGateway = new components.categoryGateway() />
    <cfset variables.categoryGateway.update(
        category_id = form.category_id,
        name = form.name
    
    ) />

<cfset variables.message = "Record updated suceessfully" />
</cfif>
 
<cflocation addtoken="false" url="index.cfm?id=#form.category_id#&message=#variables.message#" />