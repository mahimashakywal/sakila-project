<cfcomponent displayName="countryGateway" output="true" >

    <cffunction name="list" access="public" returntype="query">

        <cfargument name="page" type="numeric" default="1">
        <cfargument name="maxRows" type="numeric" default="10" />

        <cfset local.currentRecords = (arguments.page - 1) * arguments.maxRows />

        <cfquery name="local.qCountry" datasource="sakila">
            select *
            from country
            order by country_id desc
            limit #local.currentRecords# , #arguments.maxRows#;
        </cfquery>

        <cfreturn local.qCountry/>

    </cffunction>

    <cffunction name="get" access="public" returntype="country" output="true">

        <cfargument name="id" type="numeric" required="true" />

        <cfset var country = new countryDAO().read( country_id = arguments.id )>
        
        <cfreturn country/>

    </cffunction>


    <cffunction name="save" access="public" returntype="country" output="false">
        <cfargument name="country" type="country" required="true" />

        <cfif country.getCountry_id() EQ 0>
            <cfreturn new countryDAO().insert( arguments.country ) />
        <cfelse>
            <cfreturn new countryDAO().update( arguments.country ) />
        </cfif>

    </cffunction>
</cfcomponent>