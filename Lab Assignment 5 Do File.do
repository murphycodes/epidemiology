// Question 1

/// Disease (asthma)

gen asthma = _asthms1
	recode asthma 1 = 1
	recode asthma 2 = 0
	recode asthma 3 = 0
	recode asthma 9 = .
	
label variable asthma "Asthma Status"
	label define asthma 1 "Currently Asthmatic",
	label define asthma 0 "Never or Former Asthmatic", add
	label values asthma asthma
	
/// Exposure (smoking)

gen smoker = _smoker3
	recode smoker 1 = 1
	recode smoker 2 = 1
	recode smoker 3 = 0
	recode smoker 4 = 0
	recode smoker 9 = .

label variable smoker "Smoking Status"
	label define smoker 1 "Current Smoker",
	label define smoker 0 "Former or Never Smoker", add
	label values smoker smoker

// Create 2x2 table	and calculate OR

tab smoker asthma, row
mhodds smoker asthma

// Question 2

gen male = sexvar
	recode male 1 = 1
	recode male 2 = 0
	
label variable male "Sex"
	label define male 0 "Female",
	label define male 1 "Male", add
	label values male male
	
tab male

mhodds smoker asthma if male == 0
mhodds smoker asthma if male == 1

//// Or use:

mhodds smoker asthma, by(male)

// Question 5

/// Disease (heart attack)

gen myoInfrac = cvdinfr4
	recode myoInfrac 1 = 1
	recode myoInfrac 2 = 0
	recode myoInfrac 7 = .
	recode myoInfrac 9 = .
	recode myoInfrac . = .
	
label variable myoInfrac "Ever Had a Heart Attack"
	label define myoInfrac 0 "No",
	label define myoInfrac 1 "Yes", add
	label values myoInfrac myoInfrac

/// Exposure already defined as smoker

tab smoker myoInfrac, row
mhodds smoker myoInfrac

// Question 6

/// Stratify age

gen older = _age65yr
	recode older 1 = 0
	recode older 2 = 1
	recode older 3 = .
	
label variable older "Two-level Age Category"
	label define older 0 "18 to 64",
	label define older 1 "65+", add
	label values older older

mhodds smoker myoInfrac, by(older)
