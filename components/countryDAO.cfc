<cfcomponent displayname="countryDAO" >

    <cffunction name="read" access="public" returntype="country" output="true" >
        <cfargument name="country_id" type="numeric" required="true" />

        <cfset var qCountry = "" />
        <cfquery name="qCountry" datasource="sakila">
            select *
            from country
            where country_id = <cfqueryparam value="#arguments.country_id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfif qCountry.recordCount>
            <cfreturn new country().init( argumentCollection = queryGetRow( qCountry, 1 ))/>
        <cfelse>
            <cfreturn new country().init()/>
        </cfif>

    </cffunction>


    <cffunction name="insert" access="public" returntype="country" output="false">
        <cfargument name="country" type="country" required="true" />

        <cfquery name="local.qCountry" datasource="sakila">
        insert into country (country)
        values
        (
            <cfqueryparam value="#arguments.country.getcountry()#" cfsqltype="cf_sql_varchar" />
        );    

        select last_insert_id() id;
        </cfquery> 

        <cfset arguments.country.setcountry_id(qCountry.id) />

        <cfreturn arguments.country />
    </cffunction>


    <cffunction name="update" access="public"  returntype="country" output="false">
        
        <cfargument name="country" type="country" required="true" />
    
        <cfquery name="local.qCountry" datasource="sakila">
            UPDATE country
            SET country = <cfqueryparam value="#arguments.country.getcountry()#" cfsqltype="cf_sql_varchar" />
            WHERE country_id = <cfqueryparam value="#arguments.country.getcountry_id()#" cfsqltype="cf_sql_integer" />
        </cfquery> 

        <cfreturn arguments.country />
    </cffunction>
</cfcomponent>