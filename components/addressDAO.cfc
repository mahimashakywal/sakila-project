<cfcomponent displayname="addressDAO" >

    <cffunction name="read" access="public" returntype="address" output="true" >
        <cfargument name="address_id" type="numeric" required="true" />

        <cfset var qAddress = "" />
        <cfquery name="qAddress" datasource="sakila">
            select *
            from address
            where address_id = <cfqueryparam value="#arguments.address_id#" cfsqltype="cf_sql_integer" />
        </cfquery>
        <cfif qAddress.recordCount>
            <cfreturn new address().init(argumentCollection = qAddress.getRow(1))/>
        <cfelse>
            <cfreturn new address().init()/>
        </cfif>

    </cffunction>       


    <cffunction name="insert" access="public" returntype="address" output="true">
        <cfargument name="address" type="address" required="true" />

        <cfquery name="local.qAddress" datasource="sakila">
            insert into address (address, address2, district, city_id, postal_code, phone)
            values
            (
                <cfqueryparam value="#arguments.address.getAddress()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getAddress2()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getDistrict()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getCity_id()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getPostal_code()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getPhone()#" cfsqltype="cf_sql_varchar" />
            );      

            select last_insert_id() id;
        </cfquery>x 

        <cfset arguments.address.setAddress_id(qAddress.id) />

        <cfreturn arguments.address />
    </cffunction>


    <cffunction name="update" access="public"  returntype="address" output="false">

        <cfargument name="address" type="address" required="true" />

        <cfquery datasource="sakila">
            UPDATE address
            SET address = <cfqueryparam value="#arguments.address.getAddress()#" cfsqltype="cf_sql_varchar" />,
            address2 = <cfqueryparam value="#arguments.address.getAddress2()#" cfsqltype="cf_sql_varchar" />,
            district = <cfqueryparam value="#arguments.address.getDistrict()#" cfsqltype="cf_sql_varchar" />,
            city_id = <cfqueryparam value="#arguments.address.getCity_id()#" cfsqltype="cf_sql_integer" />,
            postal_code = <cfqueryparam value="#arguments.address.getPostal_code()#" cfsqltype="cf_sql_varchar" />,
            phone = <cfqueryparam value="#arguments.address.getPhone()#" cfsqltype="cf_sql_varchar" />
            WHERE address_id = <cfqueryparam value="#arguments.address.getAddress_id()#" cfsqltype="cf_sql_integer" />
        </cfquery> 

        <cfreturn arguments.address />
    </cffunction>
</cfcomponent>