/*specify the path where you will clone the repository*/
/*Choose either the WORK or your HOME directory*/
/*Option 1: Work */
/*
%let work=%sysfunc(pathname(work)); 
%put &work; 
%let path=&work;
*/
/*Option 2: Home */
/*Get the home directory of the current user*/
%let home=%sysfunc(sysget(HOME));
%put &home; 
%let path=&home;

/*Use libname statement to create covid19 directory*/ 
options dlcreatedir; 
libname covid "&path/covid19"
data _null_;
  rc= gitfn_clone("https://github.com/paulvanmol/covid19.git",
    "&path");
  put rc=;
run;
