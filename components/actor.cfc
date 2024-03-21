<cfcomponent displayname="actor">

    <cfproperty name="actor_id" type="numeric" default="0">
    <cfproperty name="first_name" type="string" default="" />
    <cfproperty name="last_name" type="string" default="" />
    <cfproperty name="email" type="string" default="" />

    <cfset variables.instanse = {} />

    <cffunction name="init" access="public" returntype="actor" output="true" >
        <cfargument name="actor_id" type="numeric" default="0" />
        <cfargument name="first_name" type="string" default="" />
        <cfargument name="last_name" type="string" default="" />
        <cfargument name="email" type="string" default="" />

        <cfset this.setActor_id(arguments.actor_id) />
        <cfset this.setFirst_name(arguments.first_name) />
        <cfset this.setLast_name(arguments.last_name) />
        <cfset this.setEmail(arguments.email) />

        <cfreturn this />
    </cffunction>

    <cffunction name="setActor_id" access="public" returntype="void" output="false">
        <cfargument name="actor_id" type="numeric" required="true" />

        <cfset variables.instanse.actor_id = arguments.actor_id />

    </cffunction>

    <cffunction name="getActor_id" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.actor_id />
    </cffunction>


    <cffunction name="setFirst_name" access="public" returntype="void" output="false">
        <cfargument name="first_name" type="string" required="true" />

        <cfset variables.instanse.first_name = arguments.first_name />
    </cffunction>

    <cffunction name="getFirst_name" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.first_name />
    </cffunction>


    <cffunction name="setLast_name" access="public" returntype="void" output="false">
        <cfargument name="last_name" type="string" required="true" />

        <cfset variables.instanse.last_name = arguments.last_name />
    </cffunction>

    <cffunction name="getLast_name" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.last_name />
    </cffunction>


    <cffunction name="setEmail" access="public" returntype="void" output="false">
        <cfargument name="email" type="string" required="true" />

        <cfset variables.instanse.email = arguments.email />
    </cffunction>

    <cffunction name="getEmail" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.email />
    </cffunction>

</cfcomponent>