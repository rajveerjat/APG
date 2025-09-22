

***Figure 4***

use intermed_input

gen II_r_per_worker=II_E_r_per_worker+ II_S_r_per_worker+II_M_r_per_worker

twoway (scatter II_r_per_worker unorg_emp_percent) (lfit II_r_per_worker unorg_emp_percent),xtitle("Proportion of Employment that is Informal") ytitle("Intermediate Input Use per Worker ") 


***Table-7***

pwcorr II_E_r_per_worker unorg_emp_percent, sig
pwcorr II_M_r_per_worker unorg_emp_percent, sig 
pwcorr II_S_r_per_worker unorg_emp_percent, sig 
pwcorr II_r_per_worker unorg_emp_percent, sig 








***Figure-5, 6 and A4****


cd "C:\Users\rajve\Downloads"
use Informal_emp_correlates

*Figure 5: The District Level Distribution of the Share of Informal Employment in Non-Farm Employment, 1999/00 and 2011/12

hist informal_emp_share, xtitle("Share of District Non-Farm Employment that is Informal")

*Figure 6: Predictors of the District Level Share of Informal Employment in Non-Farm Employment

*informal_emp_share - District Share of Informal Employment in Non-Farm Employment
*census_dummy - Dummy for 2011
*aglprop2 - ratio of agricultural workers to all agricultural labor force (cultivators + agricultural labor - all magnitudes relating to main workers in census)
* avg_eduyears10 = average years of education divided by 10
*urbanprop = proportion of total population that is urbanpopprop
*pcbank3 = total number of banks - commercial and cooperative - divided by population expressed in thousands
*scprop = scheduled caste population as proportion of total population
*stprop = scheduled tribe population as proportion of total population

regress informal_emp_share census_dummy aglprop2 avg_eduyears10 urbanpopprop  pcbank3 scprop stprop

*coefplos
coefplot, ///
    vertical ///
    drop(_cons) ///
    yline(0, lpattern(dash)) ///
    ciopts(recast(rcap) color(gs10)) ///
    msymbol(O) mcolor(blue) ///
    xlabel(, angle(45) labsize(small)) ///
    ylabel(, grid) ///
    title("Regression Coefficients") ///
    rename(census_dummy = "2011 Census Dummy" ///
		   avg_eduyears10 = "Years of Education (10 year units)" ///
           scprop = "Scheduled Castes Pop. Share" ///
           stprop = "Scheduled Tribe Pop. Share" ///
           aglprop2 = "Landless Labour Share" ///
           pcbank3 = "Banking Access (per 1k pop)" ///
           urbanpopprop = "Urban Pop. Share")
		   
*Figure A4:  With state fixed effects

xtset state_11

xtreg informal_emp_share census_dummy aglprop2 avg_eduyears10 urbanpopprop  pcbank3 scprop stprop, fe 

*coefplot
coefplot, ///
    vertical ///
    drop(_cons) ///
    yline(0, lpattern(dash)) ///
    ciopts(recast(rcap) color(gs10)) ///
    msymbol(O) mcolor(blue) ///
    xlabel(, angle(45) labsize(small)) ///
    ylabel(, grid) ///
    title("Regression Coefficients") ///
    rename(census_dummy = "2011 Census Dummy" ///
		   avg_eduyears10 = "Years of Education (10 year units)" ///
           scprop = "Scheduled Castes Pop. Share" ///
           stprop = "Scheduled Tribe Pop. Share" ///
           aglprop2 = "Landless Labour Share" ///
           pcbank3 = "Banking Access (per 1k pop)" ///
           urbanpopprop = "Urban Pop. Share")


		   
		  