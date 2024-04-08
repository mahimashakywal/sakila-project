<!DOCTYPE HTML>
<html>
    <head>
        <title>EXERCISE 1</title>
        <style>
            body{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 20px;
                padding-top: 40px;
            }
            div{
                border-radius: 5px;
                height: 50px;
                width: 50px;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    
    <body>
        <cfoutput>
            <cfloop from="1" to="10" index="variables.counter">
                <div <cfif variables.counter MOD 2 EQ 0 > style="background-color: green" </cfif> style="background-color: blue">
                    #variables.counter#
                </div>
            </cfloop>
        </cfoutput>
    </body>
</html>


<!--- <cfif variables.counter MOD 2 EQ 0>
    <div style="background-color: green">
        #variables.counter#
    </div>
<cfelse>
    <div style="background-color: blue">
        #variables.counter#
    </div>
</cfif> --->