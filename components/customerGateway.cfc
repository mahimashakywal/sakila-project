<cfcomponent displayName="customerGateway" output="false" >
    <cfset variables.datasource = 'sakila'>

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

    <cffunction name="get" access="public" returntype="customer" output="true">

        <cfargument name="customer_id" type="numeric" required="true" />

        <cfset var customer = new customerDAO().read( customer_id = arguments.customer_id )>
        
        <cfreturn customer/>

    </cffunction>

    <cffunction name="save" access="public" returntype="customer" output="true">
        <cfargument name="customer" type="customer" required="true" />

        <cfif val(arguments.customer.getCustomer_id()) EQ 0>
            <cfreturn new customerDAO().insert( arguments.customer ) />
        <cfelse>
            <cfreturn new customerDAO().update( arguments.customer ) />
        </cfif>

    </cffunction>
</cfcomponent>