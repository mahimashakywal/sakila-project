
<cfif form.country_id eq 0>
    <!--- Insert --->
    
    <cfset variables.countryGateway = new components.countryGateway() />
    <cfset variables.countryGateway.insert(
        country = form.country
    ) />

    <cfset variables.message = "Record inserted suceessfully" />

    
<cfelseif form.country_id GT 0>
    <!--- Update --->
    
    <cfset variables.countryGateway = new components.countryGateway() />
    <cfset variables.countryGateway.update(
        country_id = form.country_id,
        country = form.country
    
    ) />

<cfset variables.message = "Record updated suceessfully" />
</cfif>
 
<cflocation addtoken="false" url="index.cfm?id=#form.country_id#&message=#variables.message#" />