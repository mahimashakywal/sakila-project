<cfquery name="variables.qData" datasource="sakila" returntype="query">
    select *
    from actor;
</cfquery>

<cfdump var="#variables.qData#" />

<br/>

<cfquery name="variables.datas" datasource="sakila" returntype="array">
    select *
    from actor;
</cfquery>

<cfdump var="#variables.datas#" />

<br/>

<cfquery name="variables.data" datasource="sakila" returntype="struct" columnkey="actor_id" >
    select *
    from actor;
</cfquery>

<cfdump var="#variables.data#" />