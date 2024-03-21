<cfcomponent displayname="countryGateway" output="false" >

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

    <cffunction name="get" access="public" returntype="query">

        <cfargument name="id" type="numeric" required="true" />

        <cfquery name="local.qCountry" datasource="sakila">
            select *
            from country
            where country_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn local.qCountry />

    </cffunction>

    <cffunction name="insert" access="public">

            <cfargument name="country" required="true" />

            <cfquery name="local.qCountry" datasource="sakila">
            insert into country (country)
            values
            (
                <cfqueryparam value="#arguments.country#" cfsqltype="cf_sql_varchar" />
            );    
            </cfquery> 

    </cffunction>

    <cffunction name="update" access="public" >
        
        <cfargument name="country_id" required="true" />
        <cfargument name="country" required="false" />
       
        <cfset var qCountry = get(id = arguments.country_id) />

        <cfif qCountry.recordCount EQ 0>
            <cfthrow message="Invalid id"/>
        </cfif>
        
        <cfset var country = queryGetRow( qCountry, 1 ) />
        <cfset country.append( arguments, true ) />

        <cfquery name="local.updateRecord" datasource="sakila">
            UPDATE country
            SET country = <cfqueryparam value="#country.country#" cfsqltype="cf_sql_varchar" />
            WHERE country_id = <cfqueryparam value="#country.country_id#" cfsqltype="cf_sql_integer" />
        </cfquery> 

    </cffunction>

</cfcomponent>