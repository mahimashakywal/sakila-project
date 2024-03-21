<cfif form.id eq 0>
    <!--- Insert --->
    
    <cfset variables.addressGateway = new components.addressGateway() />
    <cfset variables.addressGateway.insert(
       address = form.address,
       address2 = form.address2,
       district = form.district,
       city_id = form.city,
       postal_code = form.postal_code,
       phone = form.phone
    ) />

    <cfset variables.message = "Record inserted suceessfully" />

    
<cfelseif form.id GT 0>
    <!--- Update --->
    
    <cfset variables.addressGateway = new components.addressGateway() />
    <cfset variables.addressGateway.update(
        address_id = form.id,
        address = form.address,
        address2 = form.address2,
        district = form.district,
        city_id = form.city,
        postal_code = form.postal_code,
        phone = form.phone
    ) />

<cfset variables.message = "Record updated suceessfully" />
</cfif>
 
<cflocation addtoken="false" url="index.cfm?id=#form.id#&message=#variables.message#" />