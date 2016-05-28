<cfparam name="attributes.var" type="any">

<cfset myStruct = attributes.var>
<cfset myDump = structNew()>
<cfscript>  
    class = myStruct.getClass();   
    myDump.class.Class = class.toString();
    myDump.class.superClass = class.getSuperclass().toString();
	myPackage = class.getPackage();
	if (isdefined("myPackage"))
    myDump.class.package = class.getPackage().toString();   

    myDump.fields = arrayNew(1);
    fields = class.getFields();   
    for(x = 1; x LTE arrayLen(fields); ++x) {   
    	myDump.fields[x] = fields[x].toString();   
    }   

    myDump.constructors = arrayNew(1);
    constructors = class.getConstructors();   
    for(x = 1; x LTE arrayLen(constructors); ++x) {   
    	myDump.constructors[x] = constructors[x].toString();   
    }   

    myDump.methods = arrayNew(1);
	methods = class.getMethods();              
    for(x = 1; x LTE arrayLen(methods); ++x) {   
    	myDump.methods[x] = methods[x].toString();   
    }   
</cfscript>  
<cf_dump var="#myDump#">


<!---
    //class   
    class = myStruct.getClass();   
    writeOutput("<strong>Class:</strong> " & class & "<br/>");   
       
    //superclass   
    superclass = class.getSuperclass();   
    writeOutput("<strong>Superclass:</strong> " & superclass & "<br/>");   
       
    //package   
    package = class.getPackage();   
    writeOutput("<strong>Package:</strong> " & package & "<br/><br />");   
       
    //fields   
    fields = class.getFields();   
    writeOutput("<strong>Fields</strong>" & "<br/>");   
    for(x = 1; x LTE arrayLen(fields); ++x) {   
        writeOutput(fields[x] & "<br/>");   
    }   
    writeOutput("<br/>");        
       
    //constructors   
    constructors = class.getConstructors();   
    writeOutput("<strong>Constructors</strong>" & "<br/>");   
    constructors = class.getConstructors();   
    for(x = 1; x LTE arrayLen(constructors); ++x) {   
        writeOutput(constructors[x] & "<br/>");   
    }   
    writeOutput("<br/>");</p><p>      //methods   
    methods = class.getMethods();              
    writeOutput("<strong>Methods</strong>" & "<br/>");   
    methods = class.getMethods();              
    for(x = 1; x LTE arrayLen(methods); ++x) {   
        writeOutput(methods[x] & "<br/>");   
    }   
    writeOutput("<br/>");   
--->