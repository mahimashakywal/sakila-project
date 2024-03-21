<cfcomponent displayName="addressGateway" output="false" >

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

    <cffunction name="get" access="public" returntype="query">

        <cfargument name="id" type="numeric" required="true" />

        <cfquery name="local.qAddress" datasource="sakila">
            select *
            from address
            where address_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn local.qAddress />

    </cffunction>

    <cffunction name="insert" access="public">

            <cfargument name="address" required="true" />
            <cfargument name="address2" required="true" />
            <cfargument name="district" required="true" />
            <cfargument name="city_id" required="true" />
            <cfargument name="postal_code" required="true" />
            <cfargument name="phone" required="true" />

            <cfquery name="local.qAddress" datasource="sakila">
            insert into address (address, address2, district, city_id, postal_code, phone)
            values
            (
                <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address2#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.district#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.city_id#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.postal_code#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar" />

            );    
            </cfquery> 

    </cffunction>

    <cffunction name="update" access="public" >
        
        <cfargument name="address_id" required="true" />
        <cfargument name="address" required="false" />
        <cfargument name="address2" required="false" />
        <cfargument name="district" required="false" />
        <cfargument name="city_id" required="false" />
        <cfargument name="postal_code" required="false" />
        <cfargument name="phone" required="false" />

        <cfset var qAddress = get(id = arguments.address_id) />

        <cfif qAddress.recordCount EQ 0>
            <cfthrow message="Invalid id"/>
        </cfif>
        
        <cfset var address = queryGetRow( qAddress, 1 ) />
        <cfset address.append( arguments, true ) />

        <cfquery name="local.updateRecord" datasource="sakila">
            UPDATE address
            SET address = <cfqueryparam value="#address.address#" cfsqltype="cf_sql_varchar" />,
            address2 = <cfqueryparam value="#address.address2#" cfsqltype="cf_sql_varchar" />,
            district = <cfqueryparam value="#address.district#" cfsqltype="cf_sql_varchar" />,
            city_id = <cfqueryparam value="#address.city_id#" cfsqltype="cf_sql_integer" />,
            postal_code = <cfqueryparam value="#address.postal_code#" cfsqltype="cf_sql_varchar" />,
            phone = <cfqueryparam value="#address.phone#" cfsqltype="cf_sql_varchar" />
            WHERE address_id = <cfqueryparam value="#address.address_id#" cfsqltype="cf_sql_integer" />
        </cfquery> 

    </cffunction>

</cfcomponent>