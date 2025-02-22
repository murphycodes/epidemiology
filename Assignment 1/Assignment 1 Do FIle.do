// task 1
/// codebook for both mental health and physical health status
codebook menthlth
codebook poorhlth



// task 2
/// recatagorize variable and cleaning up data
generate mentalHealthBadDay = menthlth
sum mentalHealthBadDay



/// recode and catagroize number of days into intervals
recode menthlth (88 = 0) (1/7.9999 = 1) (8/14.9999 = 2) (15/21.9999 = 3) (22/30 = 4) (77 = 5) (99 = 5)
tab menthlth
//// 0 = none; 1 = 1-7 days; 2 = 8-14 days; 3 = 15-21 days; 4 = >22 days; 5 = not sure or declined to answer

//// adding labels
label variable menthlth "Number of Days Mental Health Not Good"
label define menthlth 0 "None"
label define menthlth 1 "1 to 7 Days", add
label define menthlth 2 "8 to 14 Days", add
label define menthlth 3 "15 to 21 Days", add
label define menthlth 4 "More Than 22 Days", add
label define menthlth 5 "Don't Know/Refused", add
label values menthlth menthlth // this corrlates labels to categorical values

tab menthlth



/// task 4
sum sexvar
label variable sexvar "Sex of Respondent"
label define sexvar 1 "Male"
label define sexvar 2 "Female", add
label values sexvar sexvar

tab sexvar



