%let path=/home/paulvan_mol1/my_content;
options dlcreatedir; 
libname covid "&path/covid19"; 

filename out "&path/covid19/COVID19BE.xlsx";
proc http
 url='https://epistat.sciensano.be/Data/COVID19BE.xlsx'
 method="get" out=out;
 *debug level=3;
run;

libname xlscov xlsx "&path/covid19/COVID19BE.xlsx"; 
proc contents data=xlscov._all_; 
run;

data covid.cases_agesex; 
set xlscov.'CASES_AGESEX'n;
*daten=input(date,yymmdd10.);
*format daten date9.;
run;

proc summary data=covid.cases_agesex nway; 
class date; 
var cases; 
output out=casesbydate sum=cases; 
run; 
 
data covid.casesbydate7davg;
set casesbydate; 
cases1=lag1(cases);
cases2=lag2(cases); 
cases3=lag3(cases); 
cases4=lag4(cases);
cases5=lag5(cases);
cases6=lag6(cases);
case7dayavg=mean(cases,cases1,cases2,cases3,cases4,cases5,cases6);
run; 

data covid.cases_muni; 
set xlscov.'CASES_MUNI'n;
run;
data covid.cases_muni_cum; 
set xlscov.'CASES_MUNI_CUM'n;
run;
data covid.hosp; 
set xlscov.'HOSP'n;
run;
data covid.MORT; 
set xlscov.'MORT'n;
run;
data covid.TESTS; 
set xlscov.'TESTS'n;
run;
