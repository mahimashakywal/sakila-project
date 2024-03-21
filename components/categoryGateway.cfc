<cfcomponent displayName="categoryGateway" output="true" >

    <cffunction name="list" access="public" returntype="query">

        <cfargument name="page" type="numeric" default="1">
        <cfargument name="maxRows" type="numeric" default="10" />

        <cfset local.currentRecords = (arguments.page - 1) * arguments.maxRows />

        <cfquery name="local.qCategory" datasource="sakila">
            select *
            from category
            order by category_id desc
            limit #local.currentRecords# , #arguments.maxRows#;
        </cfquery>

        <cfreturn local.qCategory/>

    </cffunction>

    <cffunction name="get" access="public" returntype="category" output="true">

        <cfargument name="id" type="numeric" required="true" />

        <cfset var category = new categoryDAO().read( category_id = arguments.id )>
        
        <cfreturn category/>

    </cffunction>


    <cffunction name="save" access="public" returntype="category" output="false">
        <cfargument name="category" type="category" required="true" />

        <cfif category.getCategory_id() EQ 0>
            <cfreturn new categoryDAO().insert( arguments.category ) />
        <cfelse>
            <cfreturn new categoryDAO().update( arguments.category ) />
        </cfif>

    </cffunction>
</cfcomponent>