/*****************************************************************************/
/*  Start a session named mySession using the existing CAS server connection */
/*  while allowing override of caslib, timeout (in seconds), and locale     */
/*  defaults.                                                                */
/*****************************************************************************/

cas mySession sessopts=(caslib=casuser timeout=1800 locale="en_US");

/*****************************************************************************/
/*  Create a default CAS session and create SAS librefs for existing caslibs */
/*  so that they are visible in the SAS Studio Libraries tree.               */
/*****************************************************************************/

 
caslib _all_ assign;


/*****************************************************************************/
/*  Load SAS data set from a Base engine library (library.tableName) into    */
/*  the specified caslib ("myCaslib") and save as "targetTableName".         */
/*****************************************************************************/

proc casutil;
    droptable casdata="covid19be_cases_agesex" incaslib="public" quiet; 
	load data=covid.cases_agesex outcaslib="public"
	casout="covid19be_cases_agesex" promote;
run;
proc casutil;
    droptable casdata="covid19be_hosp" incaslib="public" quiet; 
	load data=covid.hosp outcaslib="public"
	casout="covid19be_hosp" promote;
run;

proc casutil;
    droptable casdata="covid19be_mort" incaslib="public" quiet; 
	load data=covid.mort outcaslib="public"
	casout="covid19be_mort" promote;
run;
proc casutil;
    droptable casdata="covid19be_tests" incaslib="public" quiet; 
	load data=covid.tests outcaslib="public"
	casout="covid19be_tests" promote;
run;
proc casutil;
    droptable casdata="covid19be_cases_muni" incaslib="public" quiet; 
	load data=covid.cases_muni outcaslib="public"
	casout="covid19be_cases_muni" promote;
run;
proc casutil;
    droptable casdata="covid19be_cases_muni_cum" incaslib="public" quiet; 
	load data=covid.cases_muni_cum outcaslib="public"
	casout="covid19be_cases_muni_cum" promote;
run;
proc casutil;
    droptable casdata="covid19be_vacc" incaslib="public" quiet; 
	load data=covid.vacc outcaslib="public"
	casout="covid19be_vacc" promote;
run;

/* Creates a permanent copy of an in-memory table ("table-name") from "sourceCaslib".      */
/* The in-memory table is saved to the data source that is associated with the target      */
/* caslib ("targetCaslib") using the specified name ("file-name").                         */
/*                                                                                         */
/* To find out the caslib associated with an CAS engine libref, right click on the libref  */
/* from "Libraries" and select "Properties". Then look for the entry named "Server Session */
/* CASLIB".                                                                                */
proc casutil;
    save casdata="covid19be_cases_muni_cum" incaslib="public" outcaslib="public"
	     casout="covid19be_cases_muni_cum.sashdat" replace;
quit;
proc casutil;
    save casdata="covid19be_cases_muni" incaslib="public" outcaslib="public"
	     casout="covid19be_cases_muni.sashdat" replace;
quit;

proc casutil;
    save casdata="covid19be_cases_agesex" incaslib="public" outcaslib="public"
	     casout="covid19be_cases_agesex.sashdat" replace;
quit;
proc casutil;
    save casdata="covid19be_hosp" incaslib="public" outcaslib="public"
	     casout="covid19be_hosp.sashdat" replace;
quit;
proc casutil;
    save casdata="covid19be_mort" incaslib="public" outcaslib="public"
	     casout="covid19be_mort.sashdat" replace;
quit;

proc casutil;
    save casdata="covid19be_vacc" incaslib="public" outcaslib="public"
	     casout="covid19be_vacc.sashdat" replace;
quit;
