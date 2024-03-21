<cfcomponent displayname="category">

    <cfproperty name="category_id" type="numeric" default="0">
    <cfproperty name="name" type="string" default="" />

    <cfset variables.instanse = {} />

    <cffunction name="init" access="public" returntype="category" output="true" >
        <cfargument name="category_id" type="numeric" default="0" />
        <cfargument name="name" type="string" default="" />
    
        <cfset this.setCategory_id(arguments.category_id) />
        <cfset this.setName(arguments.name) />
        
        <cfreturn this />
    </cffunction>

    <cffunction name="setCategory_id" access="public" returntype="void" output="false">
        <cfargument name="category_id" type="numeric" required="true" />

        <cfset variables.instanse.category_id = arguments.category_id />

    </cffunction>

    <cffunction name="getCategory_id" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.category_id />
    </cffunction>


    <cffunction name="setName" access="public" returntype="void" output="false">
        <cfargument name="name" type="string" required="true" />

        <cfset variables.instanse.name = arguments.name />
    </cffunction>

    <cffunction name="getName" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.name />
    </cffunction>

</cfcomponent>