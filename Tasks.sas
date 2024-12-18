/*Task1: Run clinical trials in 3 sites each site collect 9 subjects
        and assign 3 different treatments (05mg, 10mg, 15mg) 
        according to randomization 1:1:1 ratio......................*/

/*Generate sites and subjects*/
data subjects;
do siteno = 1 to 3;
do subject = 1 to 9;
output;
end;
end;
run;
proc print data=subjects;
run;

/*Generate random varibale*/
data random ;
set subjects;
randomno= ranuni(002);
run;
proc print data= random noobs;
run;

/*Generate ranks using random numbers*/
proc rank data=random out=random_rank
group=3;
var randomno;
ranks rank;
by siteno;
run;
proc print data=random_rank noobs;
run;

/*Customization*/
proc format;
value GT 0='05MG'
         1='10MG'
		 2='15MG';
run;
proc print data=random_rank label;
label rank='Group';
format rank GT.;
run;

/*Cross check*/
proc freq data= random_rank;
tables siteno*rank;
format rank GT.;
run;


/*Task2: Conduct a clinical trial in 4 sites and each site collect 16 subjects
         and assign 3 different treatments in 2:1:1 ration*/

/*Generate subjets and random numbers*/
data subjects1;
do siteno=1 to 4;
do subject=1 to 16;
randomno= ranuni(002);
output;
end;
end;
run;
proc print data=subjects1;
run;

/*Assign the rank for the random numbers*/
proc rank data=subjects1 out=random_ranks group=4;
var randomno;
ranks rank;
by siteno;
run;
proc print data=random_ranks;
run;

/*Customization*/
proc format;
value GR 0,1='COL250MG'
           2='COL500MG'
		   3='COL750MG';
run;
proc print data=random_ranks label;
format rank GR.;
label rank='Groups';
run;

/*Cross check*/
proc freq data=random_ranks;
tables siteno*rank;
format rank GR.;
run;
