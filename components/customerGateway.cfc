<cfcomponent displayName="customerGateway" output="false" >

    <cffunction name="list" access="public" returntype="query">

        <cfargument name="page" type="numeric" default="1">
        <cfargument name="maxRows" type="numeric" default="10" />

        <cfset local.currentRecords = (arguments.page - 1) * arguments.maxRows />

        <cfquery name="local.qCustomer" datasource="sakila">
            select *
            from customer
            order by customer_id desc
            limit #local.currentRecords# , #arguments.maxRows#;
        </cfquery>

        <cfreturn local.qCustomer/>

    </cffunction>

    <cffunction name="get" access="public" returntype="any">

        <cfargument name="id" type="numeric" required="true" />

        <cfquery name="local.qCustomer" datasource="sakila">
            select *
            from customer
            where customer_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn local.qCustomer />

    </cffunction>

    <cffunction name="insert" access="public">

            <cfargument name="store_id" required="true" />
            <cfargument name="first_name" required="true" />
            <cfargument name="last_name" required="true" />
            <cfargument name="email" required="true" />
            <cfargument name="active" default="1" />

            <cfquery name="local.qCustomer" datasource="sakila">
            insert into customer ( store_id, first_name, last_name, email, active)
            values
            (
                <cfqueryparam value="#arguments.store_id#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.active#" cfsqltype="cf_sql_integer" />

            );    
            </cfquery> 

    </cffunction>

    <cffunction name="update" access="public" >
        
        <cfargument name="customer_id" required="true" />
        <cfargument name="store_id" required="false" />
        <cfargument name="first_name" required="false" />
        <cfargument name="last_name" required="false" />
        <cfargument name="email" required="false" />


        <cfset var qCustomer = get(id = arguments.customer_id) />

        <cfif qCustomer.recordCount EQ 0>
            <cfthrow message="Invalid id"/>
        </cfif>
        
        <cfset var customer = queryGetRow( qCustomer, 1 ) />
        <cfset customer.append( arguments, true ) />

        <cfquery name="local.updateRecord" datasource="sakila">
            UPDATE customer
            SET store_id = <cfqueryparam value="#customer.store_id#" cfsqltype="cf_sql_integer" />,
            first_name = <cfqueryparam value="#customer.first_name#" cfsqltype="cf_sql_varchar" />,
            last_name = <cfqueryparam value="#customer.last_name#" cfsqltype="cf_sql_varchar" />,
            email = <cfqueryparam value="#customer.email#" cfsqltype="cf_sql_varchar" />
            WHERE customer_id = <cfqueryparam value="#customer.customer_id#" cfsqltype="cf_sql_integer" />
        </cfquery> 

    </cffunction>

</cfcomponent>