<cfcomponent displayname="actorDAO" >

    <cffunction name="read" access="public" returntype="actor" output="true" >
        <cfargument name="actor_id" type="numeric" required="true" />

        <cfset var qActor = "" />
        <cfquery name="qActor" datasource="sakila">
            select *
            from actor
            where actor_id = <cfqueryparam value="#arguments.actor_id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfif qActor.recordCount>
            <cfreturn new actor().init( argumentCollection = queryGetRow( qActor, 1 ))/>
        <cfelse>
            <cfreturn new actor().init()/>
        </cfif>

    </cffunction>


    <cffunction name="insert" access="public" returntype="actor" output="false">
        <cfargument name="actor" type="actor" required="true" />

        <cfquery name="local.qActor" datasource="sakila">
        insert into actor (first_name, last_name, email)
        values
        (
            <cfqueryparam value="#arguments.actor.getFirst_name()#" cfsqltype="cf_sql_varchar" />,
            <cfqueryparam value="#arguments.actor.getLast_name()#" cfsqltype="cf_sql_varchar" />,
            <cfqueryparam value="#arguments.actor.getEmail()#" cfsqltype="cf_sql_varchar" />
        );    

        select last_insert_id() id;
        </cfquery> 

        <cfset arguments.actor.setActor_id(qActor.id) />

        <cfreturn arguments.actor />
    </cffunction>


    <cffunction name="update" access="public"  returntype="actor" output="false">
        
        <cfargument name="actor" type="actor" required="true" />
    
        <cfquery name="local.qActor" datasource="sakila">
            UPDATE actor
            SET first_name = <cfqueryparam value="#arguments.actor.getFirst_name()#" cfsqltype="cf_sql_varchar" />,
            last_name = <cfqueryparam value="#arguments.actor.getLast_name()#" cfsqltype="cf_sql_varchar" />,
            email = <cfqueryparam value="#arguments.actor.getEmail()#" cfsqltype="cf_sql_varchar" />
            WHERE actor_id = <cfqueryparam value="#arguments.actor.getActor_id()#" cfsqltype="cf_sql_integer" />
        </cfquery> 

        <cfreturn arguments.actor />
    </cffunction>
</cfcomponent>