<!DOCTYPE html>
<html>
    <head>
        <title>Example</title>
    </head>

    <body>
        <!--- <cfset variables.para = "<p>Hello xyz,</p>" />
        <cfset variables.para = variables.para & "<p>I am just doing my work.</p>" />
        <cfset variables.para = variables.para  & "<p>Thanks and regards,</p>" />
        <cfset variables.para = variables.para & "<p>zyx.</p>" />
        <cfoutput>
            #variables.para#
        </cfoutput> --->
    </body>
</html>

<cfset variables.name="mahima" />

<cfoutput>
<cfsavecontent variable="variables.para">
    <p>Hello xyz,</p>
    <p>I am just doing my work.</p>
    <p>Thanks and regards,</p>
    <p>#variables.name#</p>
</cfsavecontent>

    #variables.para#
</cfoutput>

<cfscript>
    variables.list = "susi,sam,LAS,test";
	writeDump(listLen(variables.list,",", true));//4
	writeDump(listLen("susi,,LAS,,",",", true)); //with empty values // 5
	writeDump(listLen("susi,,LAS,."));//3
</cfscript>

<!--- <!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <link rel="stylesheet" href="style-ticket-booking.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<cfoutput>
<body>

    <form action="example-action.cfm"  method="post" id="editFrm" name="editFrm"  class="container">

        <div class="w-25 border border-dark bg-light mx-auto mt-5 mb-5 p-5 rounded ">  
                
            <div class="w-50">      
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="" />
            </div>

            <div class="w-50">      
                <label for="gender">Gender:</label><br>
                <input type="radio" name="gender" id="male" value="male">
                <label for="male">Male</label><br>
                <input type="radio" name="gender" id="female" value="female">
                <label for="female">Female</label>    
            </div>

            <div class="w-50">
                <label for="color" >Color:</label>
                <select id="color" name="color" multiple>
                    <option value="blue">Blue</option>
                    <option value="pink">Pink</option>
                    <option value="yellow">Yellow</option>
                    <option value="red">Red</option>
                    <option value="black">Black</option>
                </select>
            </div>

            <div class="w-50">
                <label for="fruits" >Fruits:</label><br/>
                <input type="checkbox" id="pineapple" name="fruits" value="pineapple"/>
                <label for="pineapple">Pineapple</label><br/>

                <input type="checkbox" id="watermelon" name="fruits" value="watermelon"/>
                <label for="watermelon">Watermelon</label><br/>

                <input type="checkbox" id="mango" name="fruits" value="mango"/>
                <label for="mango">Mango</label><br/>
            </div>

            <div class="text-center pt-4">
                <button class="btn btn-dark w-50" type="submit">Submit</button>
            </div >
        </div>  

    </form>

</body>
</cfoutput>

</html> --->

