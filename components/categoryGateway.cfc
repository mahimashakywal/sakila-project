<cfcomponent displayName="categoryGateway" output="false" >

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

    <cffunction name="get" access="public" returntype="query">

        <cfargument name="id" type="numeric" required="true" />

        <cfquery name="local.qCategory" datasource="sakila">
            select *
            from category
            where category_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn local.qCategory />

    </cffunction>

    <cffunction name="insert" access="public">

            <cfargument name="name" required="true" />

            <cfquery name="local.qCategory" datasource="sakila">
            insert into category (name)
            values
            (
                <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" />
            );    
            </cfquery> 

    </cffunction>

    <cffunction name="update" access="public" >
        
        <cfargument name="category_id" required="true" />
        <cfargument name="name" required="false" />
       
        <cfset var qCategory = get(id = arguments.category_id) />

        <cfif qCategory.recordCount EQ 0>
            <cfthrow message="Invalid id"/>
        </cfif>
        
        <cfset var category = queryGetRow( qCategory, 1 ) />
        <cfset category.append( arguments, true ) />

        <cfquery name="local.updateRecord" datasource="sakila">
            UPDATE category
            SET name = <cfqueryparam value="#category.name#" cfsqltype="cf_sql_varchar" />
            WHERE category_id = <cfqueryparam value="#category.category_id#" cfsqltype="cf_sql_integer" />
        </cfquery> 

    </cffunction>

</cfcomponent>