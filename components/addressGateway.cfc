<cfcomponent displayName="addressGateway" output="false" >
    <cfset variables.datasource = 'sakila'>

    <cffunction name="list" access="public" returntype="query">

        <cfargument name="page" type="numeric" default="1">
        <cfargument name="maxRows" type="numeric" default="10" />

        <cfset local.currentRecords = (arguments.page - 1) * arguments.maxRows />

        <cfquery name="local.qAddress" datasource="sakila">
            select *
            from address
            order by address_id desc
            limit #local.currentRecords# , #arguments.maxRows#;
        </cfquery>

        <cfreturn local.qAddress/>

    </cffunction>

    <cffunction name="get" access="public" returntype="address" output="true">

        <cfargument name="address_id" type="numeric" required="true" />

        <cfset var address = new addressDAO().read( address_id = arguments.address_id )>
        
        <cfreturn address/>

    </cffunction>

    <cffunction name="save" access="public" returntype="address" output="true">
        <cfargument name="address" type="address" required="true" />

        <cfif val(arguments.address.getAddress_id()) EQ 0>
            <cfreturn new addressDAO().insert( arguments.address ) />
        <cfelse>
            <cfreturn new addressDAO().update( arguments.address ) />
        </cfif>

    </cffunction>
</cfcomponent>