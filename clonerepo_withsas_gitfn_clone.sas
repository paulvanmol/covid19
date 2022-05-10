data _null_;
  rc= gitfn_clone("https://github.com/paulvanmol/covid19.git",
    "/home/student/covid19");
  put rc=;
run;
