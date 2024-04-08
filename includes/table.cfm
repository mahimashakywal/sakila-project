<cfoutput>
    <table cellpadding="5" cellspacing="0" width="100%" class="text-center mb-4 table-bordered ">
        <thead>
            <tr>
                <cfloop array="#attributes.columns#" item="variables.column" index="variables.index">
                    <th class="text-center">#variables.column.label#</th>
                </cfloop>
            </tr>
        </thead>

        <tbody>
            <cfloop query="attributes.qData">
                <tr>
                    <cfloop array="#attributes.columns#" item="variables.column" index="variables.index">
                        <cfset variables.classNames = variables.column.classes ?: '' />
                        <td class="text-center #classNames#">
                            #createCell( variables.column, queryGetRow(attributes.qData, attributes.qData.currentRow))#
                        </td>
                    </cfloop>
                </tr>
            </cfloop>
        </tbody>

    </table>
</cfoutput>

<cffunction name="createCell" access="public" returntype="any" output="false">

    <cfargument name="column" type="struct" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfif arguments.column.keyExists('content')>
        <cfreturn arguments.column.content(arguments.data ) />
    </cfif>

    <cfreturn arguments.data[arguments.column.fieldName] />

</cffunction>