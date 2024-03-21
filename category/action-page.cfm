
<cfset variables.categoryGateway = new components.categoryGateway() />
<cfset variables.category = variables.categoryGateway.get( id = val(form.id) )/>
<cfset variables.category.setName(form.name) />

<cfset variables.category = variables.categoryGateway.save( variables.category ) />
    
<cfset variables.message = form.id eq 0 ? "Record_inserted_suceessfully" : "Record_updated_suceessfully" />
 
<cflocation addtoken="false" url="index.cfm?id=#form.id#&message=#variables.message#" />