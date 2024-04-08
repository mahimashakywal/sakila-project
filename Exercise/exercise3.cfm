<cfquery name="variables.qActor" datasource="sakila">
    select *
    from actor
    order by actor_id asc;
</cfquery>

<title>EXERCISE 3</title>

<cfscript>
    res = QueryReduce(variables.qActor,(arr,row) =>{
        arr.append(row);
        return arr;
    },[]);
    writeDump(res);
</cfscript>


<!--- <cfset variables.myArray = [] />

<cfoutput>
    <cfloop from="1" to="#variables.qActor.RecordCount()#" index="variables.count">
        <cfset variables.myArray.append(variables.qActor.getRow(variables.count)) /> 
    </cfloop>
</cfoutput>

<cfdump var="#variables.myArray#" /> --->
