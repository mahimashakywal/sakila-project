<cfset variables.addressGateway = new components.addressGateway() />

<cfset variables.address = variables.addressGateway.get( address_id = val(form.address_id) )/>


<cfset variables.address.setAddress(form.address)/>
<cfset variables.address.setAddress2(form.address2) />
<cfset variables.address.setDistrict(form.district) />
<cfset variables.address.setCity_id(form.city) />
<cfset variables.address.setPostal_code(form.postal_code) />
<cfset variables.address.setPhone(form.phone) />

<cfset variables.address = variables.addressGateway.save( variables.address ) />

<cfset variables.message = form.address_id eq 0 ? "Record_inserted_suceessfully" : "Record_updated_suceessfully" />

<cflocation addtoken="false" url="index.cfm?id=#form.address_id#&message=#variables.message#" />