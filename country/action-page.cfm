<cfset variables.countryGateway = new components.countryGateway() />
<cfset variables.country = variables.countryGateway.get( id = val(form.country_id) )/>
<cfset variables.country.setCountry(form.country) />

<cfset variables.country = variables.countryGateway.save( variables.country ) />
    
<cfset variables.message = form.country_id eq 0 ? "Record_inserted_suceessfully" : "Record_updated_suceessfully" />
 
<cflocation addtoken="false" url="index.cfm?id=#form.country_id#&message=#variables.message#" />