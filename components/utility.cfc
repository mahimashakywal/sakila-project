<cfcomponent displayname="utility">

    <cffunction name="CreateTable" access="public" output="true" returntype="any">

        <cfargument name="columns" type="array" required="true" />
        <cfargument name="qData" type="query" required="true" />

        <table cellpadding="5" cellspacing="0" width="100%" class="text-center mb-4 table-bordered ">
            <thead>
                <tr>
                    <cfloop array="#arguments.columns#" item="local.column" index="local.index">
                        <th class="text-center">#local.column.label#</th>
                    </cfloop>
                </tr>
            </thead>

            <tbody>
                <cfloop query="qData">
                    <tr>
                        <cfloop array="#arguments.columns#" item="local.column" index="local.index">
                            <cfset var classNames = local.column.classes ?: '' />
                            <td class="text-center #classNames#">
                                #createCell( local.column, queryGetRow(qData, qData.currentRow))#
                            </td>
                        </cfloop>
                    </tr>
                </cfloop>
            </tbody>

        </table>

    </cffunction>

    <cffunction name="createCell" access="public" returntype="any" output="false">

        <cfargument name="column" type="struct" required="true">
        <cfargument name="data" type="struct" required="true">

        <cfif arguments.column.keyExists('content')>
            <cfreturn arguments.column.content( arguments.data ) />
        </cfif>

        <cfreturn arguments.data[ arguments.column.fieldName] />

    </cffunction>

</cfcomponent>