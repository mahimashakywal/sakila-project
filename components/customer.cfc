<cfcomponent displayname="customer">

    <cfproperty name="customer_id" type="numeric" default="0" />
    <cfproperty name="first_name" type="string" default="" />
    <cfproperty name="last_name" type="string" default="" />
    <cfproperty name="email" type="string" default="" />
    <cfproperty name="store_id" type="string" default=""/>
    
    <cfset variables.instanse = {} />

    <cffunction name="init" access="public" returntype="customer" output="true" >
        <cfargument name="customer_id" type="numeric" default="0" />
        <cfargument name="first_name" type="string" default="" />
        <cfargument name="last_name" type="string" default="" />
        <cfargument name="email" type="string" default="" />
        <cfargument name="store_id" type="string" default=""/>
    
        <cfset this.setCustomer_id(arguments.customer_id)/>
        <cfset this.setFirstName(arguments.first_name) />
        <cfset this.setLastName(arguments.last_name) />
        <cfset this.setEmail(arguments.email) />
        <cfset this.setStoreId(arguments.store_id) />

        <cfreturn this />

    </cffunction>

    <cffunction name="setCustomer_id" access="public" returntype="void" output="true">
        <cfargument name="customer_id" required="true" />
        
        <cfset variables.instanse.customer_id = arguments.customer_id />

    </cffunction>

    <cffunction name="getCustomer_id" access="public" returntype="string" output="true">
        <cfreturn variables.instanse.customer_id />
    </cffunction>


    <cffunction name="setFirstName" access="public" returntype="void" output="false">
        <cfargument name="first_name" required="true" />

        <cfset variables.instanse.first_name = arguments.first_name />
    </cffunction>

    <cffunction name="getFirstName" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.first_name />
    </cffunction>


    <cffunction name="setLastName" access="public" returntype="void" output="false">
        <cfargument name="last_name" required="true" />

        <cfset variables.instanse.last_name = arguments.last_name />
    </cffunction>

    <cffunction name="getLastName" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.last_name />
    </cffunction>


    <cffunction name="setEmail" access="public" returntype="void" output="false">
        <cfargument name="email"  required="true" />

        <cfset variables.instanse.email = arguments.email />
    </cffunction>

    <cffunction name="getEmail" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.email />
    </cffunction>

    <cffunction name="setStoreId" access="public" returntype="void" output="false">
        <cfargument name="store_id"  required="true" />

        <cfset variables.instanse.store_id = arguments.store_id />

    </cffunction>

    <cffunction name="getStoreId" access="public" returntype="string" output="false">
        <cfreturn variables.instanse.store_id />
    </cffunction>

</cfcomponent>