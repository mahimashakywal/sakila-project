<cfcomponent displayName="filmGateway" output="false" >

    <cffunction name="list" access="public" returntype="query">

        <cfargument name="page" type="numeric" default="1">
        <cfargument name="maxRows" type="numeric" default="10" />

        <cfset local.currentRecords = (arguments.page - 1) * arguments.maxRows />

        <cfquery name="local.qFilm" datasource="sakila">
            select *
            from film
            order by film_id desc
            limit #local.currentRecords# , #arguments.maxRows#;
        </cfquery>

        <cfreturn local.qFilm/>

    </cffunction>

    <cffunction name="get" access="public" returntype="query">

        <cfargument name="id" type="numeric" required="true" />

        <cfquery name="local.qFilm" datasource="sakila">
            select *
            from film
            where film_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn local.qFilm />

    </cffunction>

    <cffunction name="insert" access="public">

            <cfargument name="title" required="true" />
            <cfargument name="description" required="true" />
            <cfargument name="release_year" required="true" />
            <cfargument name="rental_duration" required="true" />
            <cfargument name="rental_rate" required="true" />
            <cfargument name="length" required="true" />
            <cfargument name="replacement_cost" required="true" />
            <cfargument name="rating" required="true" />
            <cfargument name="special_features" required="true" />

            <cfquery name="local.qFilm" datasource="sakila">
            insert into film (title, description, release_year, rental_rate, length, replacement_cost, rating, special_features)
            values
            (
                <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.release_year#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.rental_duration#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.rental_rate#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.length#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.replacement_cost#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.rating#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.special_features#" cfsqltype="cf_sql_varchar" />

            );    
            </cfquery> 

    </cffunction>

    <cffunction name="update" access="public" >
        
        <cfargument name="film_id" required="true" />
        <cfargument name="title" required="false" />
        <cfargument name="description" required="false" />
        <cfargument name="release_year" required="false" />
        <cfargument name="rental_duration" required="false" />
        <cfargument name="rental_rate" required="false" />
        <cfargument name="length" required="false" />
        <cfargument name="replacement_cost" required="false" />
        <cfargument name="rating" required="false" />
        <cfargument name="special_features" required="false" />

        <cfset var qFilm = get(id = arguments.film_id) />

        <cfif qFilm.recordCount EQ 0>
            <cfthrow message="Invalid id"/>
        </cfif>
        
        <cfset var film = queryGetRow( qFilm, 1 ) />
        <cfset film.append( arguments, true ) />

        <cfquery name="local.updateRecord" datasource="sakila">
            UPDATE film
            SET title = <cfqueryparam value="#film.title#" cfsqltype="cf_sql_varchar" />,
            description = <cfqueryparam value="#film.description#" cfsqltype="cf_sql_varchar" />,
            release_year = <cfqueryparam value="#film.release_year#" cfsqltype="cf_sql_varchar" />,
            rental_duration = <cfqueryparam value="#film.rental_duration#" cfsqltype="cf_sql_integer" />,
            rental_rate = <cfqueryparam value="#film.rental_rate#" cfsqltype="cf_sql_varchar" />,
            length = <cfqueryparam value="#film.length#" cfsqltype="cf_sql_varchar" />,
            replacement_cost = <cfqueryparam value="#film.replacement_cost#" cfsqltype="cf_sql_decimal" />,
            rating = <cfqueryparam value="#film.rating#" cfsqltype="cf_sql_varchar" />,
            special_features = <cfqueryparam value="#film.special_features#" cfsqltype="cf_sql_varchar" />
            WHERE film_id = <cfqueryparam value="#film.film_id#" cfsqltype="cf_sql_integer" />
        </cfquery> 

    </cffunction>

</cfcomponent>