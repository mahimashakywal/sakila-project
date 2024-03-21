<cfset variables.customerGateway = new components.customerGateway() />
<cfset variables.customer = variables.customerGateway.get( customer_id = val(form.id) )/>
<cfset variables.customer.setFirstName(form.first_name) />
<cfset variables.customer.setLastName(form.last_name) />
<cfset variables.customer.setEmail(form.email) />
<cfset variables.customer.setStoreId(form.store_id) />

<cfset variables.customer = variables.customerGateway.save( variables.customer ) />
    
<cfset variables.message = form.id eq 0 ? "Record_inserted_suceessfully" : "Record_updated_suceessfully" />
 
<cflocation addtoken="false" url="index.cfm?id=#form.id#&message=#variables.message#" />