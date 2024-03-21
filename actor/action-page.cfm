<cfset variables.actorGateway = new components.actorGateway() />
<cfset variables.actor = variables.actorGateway.get( id = val(form.actor_id) )/>
<cfset variables.actor.setFirst_name(form.first_name) />
<cfset variables.actor.setLast_name(form.last_name) />
<cfset variables.actor.setEmail(form.email) />

<cfset variables.actor = variables.actorGateway.save( variables.actor ) />
    
    
<cfset variables.message = form.actor_id eq 0 ? "Record_inserted_suceessfully" : "Record_updated_suceessfully" />
 
<cflocation addtoken="false" url="index.cfm?id=#form.actor_id#&message=#variables.message#" />