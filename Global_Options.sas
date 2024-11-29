/*This is the sample data taken from SASHELP library(Temparary library)*/
Proc print data=sashelp.class;
run;

/*Global Options:-*/
/*Global statements are used anywhere in a sas program and
  stay in effect until changed or cancled or until the SAS session ends*/

/*TITLE*/
/*Using single title*/
Title "Sample title for the class dataset";
 Proc print data=sashelp.class;
run;
Title; /*To stop title for next exciguted program use title; */

/*Using multiples tiles or write single title in multiple lines*/
Title1 "Sample title for the class dataset";
Title2 "Excigution of 2nd title";
Proc print data=sashelp.class;
run;
title;

/*FOOTNOTE*/
/*Using single Footnote*/
footnote "Sample footnote for the class dataset";
Proc print data=sashelp.class;
run;
footnote; /*To stop footnote for next exciguted program use Footnote; */

/*Using multiples footnote*/
Footnote1 "Sample footnote for the class dataset";
Footnote2 "Excigution of 2nd Footnote";
Proc print data=sashelp.class;
run;
Footnote;


/*Options*/
options nocenter nonumber nodate obs=20 ls=200 ps=600 missing="" validvarname=Upcase;
proc print data=sashelp.heart;
run;
