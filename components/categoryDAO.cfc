<cfcomponent displayname="categoryDAO" >

    <cffunction name="read" access="public" returntype="category" output="true" >
        <cfargument name="category_id" type="numeric" required="true" />

        <cfset var qCategory = "" />
        <cfquery name="qCategory" datasource="sakila">
            select *
            from category
            where category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfif qCategory.recordCount>
            <cfreturn new category().init( argumentCollection = queryGetRow( qCategory, 1 ))/>
        <cfelse>
            <cfreturn new category().init()/>
        </cfif>

    </cffunction>


    <cffunction name="insert" access="public" returntype="category" output="false">
        <cfargument name="category" type="category" required="true" />

        <cfquery name="local.qCategory" datasource="sakila">
        insert into category (name)
        values
        (
            <cfqueryparam value="#arguments.category.getName()#" cfsqltype="cf_sql_varchar" />
        );    

        select last_insert_id() id;
        </cfquery> 

        <cfset arguments.category.setCategory_id(qCategory.id) />

        <cfreturn arguments.category />
    </cffunction>


    <cffunction name="update" access="public"  returntype="category" output="false">
        
        <cfargument name="category" type="category" required="true" />
    
        <cfquery name="local.qCategory" datasource="sakila">
            UPDATE category
            SET name = <cfqueryparam value="#arguments.category.getName()#" cfsqltype="cf_sql_varchar" />
            WHERE category_id = <cfqueryparam value="#arguments.category.getCategory_id()#" cfsqltype="cf_sql_integer" />
        </cfquery> 

        <cfreturn arguments.category />
    </cffunction>
</cfcomponent>