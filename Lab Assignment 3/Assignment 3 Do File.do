// Part 1
/// Question 1

tab cholmed3
/// yes = 1, no = 2, don't know = 7, refused = 9

gen highChol = cholmed3
recode highChol 1 = 1
recode highChol 2 = 0
recode highChol 7 = 2
recode highChol 9 = 3

label variable highChol "Currently Taking Medication for High Cholesterol"
label define highChol 1 "Yes"
label define highChol 0 "No", add
label define highChol 2 "Don't Know", add
label define highChol 3 "Refused to Answer", add
label values highChol highChol

tab highChol

/// Question 2

tab sexvar

gen male = sexvar
recode male 1 = 1
recode male 2 = 0

label variable male "Sex"
label define male 1 "Male"
label define male 0 "Female", add
label values male male

tab male highChol, row

/// sexvar male = 1, female = 2
/// crosstabulate cholmed3 with sexvar

// Question 3

/// 18-64 = 1, 65+ = 2, missing/refused/don't know = 3
/// cleaning var into binary var

codebook _age65yr

gen olderAdult = _age65yr

recode olderAdult 1 = 0
recode olderAdult 2 = 1
recode olderAdult 3 = .

label variable olderAdult "Adults Grouped by Age 65+"
label define olderAdult 1 "65+",
label define olderAdult 0 "<65", add
label values olderAdult olderAdult
tab olderAdult

tab olderAdult highChol, row

// Question 4

/// cleaning var in _AGE5YR

gen ageRange = _ageg5yr

recode ageRange 1 = 1
recode ageRange 2 = 1
recode ageRange 3 = 1
recode ageRange 4 = 2
recode ageRange 5 = 2
recode ageRange 6 = 2
recode ageRange 7 = 3
recode ageRange 8 = 3
recode ageRange 9 = 3
recode ageRange 10 = 4
recode ageRange 11 = 4
recode ageRange 12 = 4
recode ageRange 13 = 4
recode ageRange 14 = .

label variable ageRange "Adults Grouped by Age"
label define ageRange 1 "18 to 34",
label define ageRange 2 "35 to 49", add
label define ageRange 3 "50 to 64", add
label define ageRange 4 "65 or Older", add
label values ageRange ageRange

tab ageRange highChol, row
tab male highChol, row

// Part 2

// 2x2 table

/// recode _smoker3, smoker status
/// current/former smoker = 1, never smoker = 0

gen everSmoked = _smoker3

recode everSmoked 1 = 1
recode everSmoked 2 = 1
recode everSmoked 3 = 1
recode everSmoked 4 = 0
recode everSmoked 9 = 2

label variable everSmoked "Smoking Status"
label define everSmoked 1 "Current or Former Smoker"
label define everSmoked 0 "Never Smoker", add
label define everSmoked 2 "Missing Data", add
label values everSmoked everSmoked

tab everSmoked

/// recoding _asthms1, asthma status
/// currently asthmatic = 1, formerly asthmatic = 2, never asthmatic = 3, missing = 9

gen asthmatic = _asthms1

recode asthmatic 1 = 1
recode asthmatic 2 = 0
recode asthmatic 3 = 0
recode asthmatic 9 = 2

label variable asthmatic "Asthma Status"
label define asthmatic 1 "Actively Asthmatic"
label define asthmatic 0 "Never or Former Asthmatic", add
label define asthmatic 2 "Missing Data", add
label values asthmatic asthmatic

tab asthmatic

/// creating 2x2 table

tab everSmoked asthmatic, row

/// calculating odds ratio using mhodds

//// creating binary value for _smoker3

gen binarySmoker = _smoker3

recode binarySmoker 1 = 1
recode binarySmoker 2 = 1
recode binarySmoker 3 = 1
recode binarySmoker 4 = 0
recode binarySmoker 9 = .

label variable binarySmoker "Smoking Status"
label define binarySmoker 1 "Current or Former Smoker"
label define binarySmoker 0 "Never Smoker", add
label values binarySmoker binarySmoker

tab binarySmoker

//// creating binary value for _asthms1

gen binaryAsthmatic = _asthms1

recode binaryAsthmatic 1 = 1
recode binaryAsthmatic 2 = 0
recode binaryAsthmatic 3 = 0
recode binaryAsthmatic 9 = .

label variable binaryAsthmatic "Asthma Status"
label define binaryAsthmatic 1 "Actively Asthmatic"
label define binaryAsthmatic 0 "Never or Former Asthmatic", add
label values binaryAsthmatic binaryAsthmatic

tab binaryAsthmatic

mhodds binaryAsthmatic binarySmoker, c(2,1)
