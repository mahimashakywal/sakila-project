<cfcomponent displayname="cityGateway" >

    <cffunction name="getCities" output="false" access="public" returntype="query">

        <cfset var qCities = "" />

        <cfquery name="qCities" datasource="sakila">
            select c1.city_id, c1.city, c2.country
            from city c1 inner join country c2 on c2.country_id = c1.country_id
            order by c2.country, c1.city; 
        </cfquery>

        <cfreturn qCities />

    </cffunction>
    
</cfcomponent>