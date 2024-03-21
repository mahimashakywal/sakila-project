<cfcomponent displayname="customerDAO" >

    <cffunction name="read" access="public" returntype="customer" output="true" >
        <cfargument name="customer_id" type="numeric" required="true" />

        <cfset var qCustomer = "" />
        <cfquery name="qCustomer" datasource="sakila">
            select *
            from customer
            where customer_id = <cfqueryparam value="#arguments.customer_id#" cfsqltype="cf_sql_integer" />
        </cfquery>
        <cfif qCustomer.recordCount>
            <cfreturn new customer().init(argumentCollection = qCustomer.getRow(1))/>
        <cfelse>
            <cfreturn new customer().init()/>
        </cfif>

    </cffunction>       


    <cffunction name="insert" access="public" returntype="customer" output="true">
        <cfargument name="customer" type="customer" required="true" />

        <cfquery name="local.qCustomer" datasource="sakila">
            insert into customer (first_name, last_name, email, store_id)
            values
            (
                <cfqueryparam value="#arguments.customer.getFirstName()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.customer.getLastName()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.customer.getEmail()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.customer.getStoreId()#" cfsqltype="cf_sql_varchar" />
                
            );      

            select last_insert_id() id;
        </cfquery> 

        <cfset arguments.customer.setCustomer_id(qCustomer.id) />

        <cfreturn arguments.customer />
    </cffunction>


    <cffunction name="update" access="public"  returntype="customer" output="false">

        <cfargument name="customer" type="customer" required="true" />

        <cfquery datasource="sakila">
            UPDATE customer
            SET first_name = <cfqueryparam value="#arguments.customer.getFirstName()#" cfsqltype="cf_sql_varchar" />,
            last_name = <cfqueryparam value="#arguments.customer.getLastName()#" cfsqltype="cf_sql_varchar" />,
            email = <cfqueryparam value="#arguments.customer.getEmail()#" cfsqltype="cf_sql_varchar" />,
            store_id = <cfqueryparam value="#arguments.customer.getStoreId()#" cfsqltype="cf_sql_integer" />
            WHERE customer_id = <cfqueryparam value="#arguments.customer.getCustomer_id()#" cfsqltype="cf_sql_integer" />
        </cfquery> 

        <cfreturn arguments.customer />
    </cffunction>
</cfcomponent>