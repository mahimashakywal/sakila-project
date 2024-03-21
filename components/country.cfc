<cfcomponent displayname="country">

    <cfproperty name="country_id" type="numeric" default="0">
    <cfproperty name="name" type="string" default="" />

    <cfset variables.instanse = {} />

    <cffunction name="init" access="public" returntype="country" output="true" >
        <cfargument name="country_id" type="numeric" default="0" />
        <cfargument name="country" type="string" default="" />
    
        <cfset this.setCountry_id(arguments.country_id) />
        <cfset this.setCountry(arguments.country) />
        
        <cfreturn this />
    </cffunction>

    <cffunction name="setCountry_id" access="public" returntype="void" output="false">
        <cfargument name="country_id" type="numeric" required="true" />

        <cfset variables.instanse.country_id = arguments.country_id />

    </cffunction>

    <cffunction name="getCountry_id" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.country_id />
    </cffunction>


    <cffunction name="setCountry" access="public" returntype="void" output="false">
        <cfargument name="country" type="string" required="true" />

        <cfset variables.instanse.country = arguments.country />
    </cffunction>

    <cffunction name="getCountry" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.country />
    </cffunction>

</cfcomponent>