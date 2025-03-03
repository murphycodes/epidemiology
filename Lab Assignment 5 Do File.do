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

// Create 2x2 table	

tab smoker asthma, row
