// Question 1

/// recoding bphigh6

tab bphigh6
codebook bphigh6

gen highPressure = bphigh6

recode highPressure 1 = 1
recode highPressure 2 = 1
recode highPressure 3 = 0
recode highPressure 4 = 0
recode highPressure 7 = .
recode highPressure 9 = .
recode highPressure . = .

label variable highPressure "History of High BP"
label define highPressure 1 "Yes",
label define highPressure 0 "No", add
label values highPressure highPressure

tab highPressure
prop highPressure //// calculate 95% CI

// Question 2

/// recoding _phys14d, physical health status

codebook _phys14d

gen badPhysHealth = _phys14d

recode badPhysHealth 1 = 1
recode badPhysHealth 2 = 2
recode badPhysHealth 3 = 3
recode badPhysHealth 9 = .

label variable badPhysHealth "Days of Bad Physical Health"
label define badPhysHealth 1 "0 Day",
label define badPhysHealth 2 "1-13 Days", add
label define badPhysHealth 3 "14+ Days", add
label values badPhysHealth badPhysHealth

tab badPhysHealth

/// 2x2 table

tab highPressure badPhysHealth, row

// Question 3

gen highPressurePreg = bphigh6 //// high BP with pregnancy classify into no

recode highPressurePreg 1 = 1
recode highPressurePreg 2 = 0
recode highPressurePreg 3 = 0
recode highPressurePreg 4 = 0
recode highPressurePreg 7 = .
recode highPressurePreg 9 = .
recode highPressurePreg . = .

label variable highPressurePreg "History of High BP"
label define highPressurePreg 1 "Yes",
label define highPressurePreg 0 "No", add
label values highPressurePreg highPressurePreg

tab highPressurePreg
prop highPressurePreg

// Question 4

tab highPressurePreg badPhysHealth, row
