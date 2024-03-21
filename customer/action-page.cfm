<cfif form.id eq 0>
    <!--- Insert --->
    
    <cfset variables.customerGateway = new components.customerGateway() />
    <cfset variables.customerGateway.insert(
       store_id = form.store_id,
       first_name = form.first_name,
       last_name = form.last_name,
       email = form.email 

    ) />

    <cfset variables.message = "Record inserted suceessfully" />

    
<cfelseif form.id GT 0>
    <!--- Update --->
    
    <cfset variables.customerGateway = new components.customerGateway() />
    <cfset variables.customerGateway.update(
        customer_id = form.id,
        store_id = form.store_id,
        first_name = form.first_name,  
        last_name = form.last_name,
        email = form.email
       
    ) />

<cfset variables.message = "Record updated suceessfully" />
</cfif>
 
<cflocation addtoken="false" url="index.cfm?id=#form.id#&message=#variables.message#" />