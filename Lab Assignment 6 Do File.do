// Defining Exposure Variable

gen pai = _paindx3
	recode pai 1 = 1
	recode pai 2 = 0
	recode pai 9 = .
	
label variable pai "Physical Activity Index"
	label define pai 1 "Met Aerobic Recommendations"
	label define pai 0 "Did Not Meet Aerobic Recommendations", add
	label values pai pai
	
tab pai

// Defining Outcome Variable

gen diabetic = diabete4
	recode diabetic 1 = 1
	recode diabetic 2 = 0
	recode diabetic 3 = 0
	recode diabetic 4 = 0
	recode diabetic 7 = .
	recode diabetic 9 = .
	recode diabetic . = .
	
label variable diabetic "Diabetes"
	label define diabetic 1 "Yes"
	label define diabetic 0 "No", add
	label values diabetic diabetic
	
tab diabetic

// Defining Covariates

/// Martial Status

gen maritalStat = marital
	recode maritalStat 1 = 1
	recode maritalStat 2 = 0
	recode maritalStat 3 = 0
	recode maritalStat 4 = 0
	recode maritalStat 5 = 0
	recode maritalStat 6 = 0
	recode maritalStat 9 = .
	recode maritalStat . = .

label variable maritalStat "Marital Status"
	label define maritalStat 1 "Married"
	label define maritalStat 0 "Not Married", add
	label values maritalStat maritalStat
	
tab maritalStat

/// Education Level

gen eduLvl = educa
	recode eduLvl 1 = 1
	recode eduLvl 2 = 2
	recode eduLvl 3 = 2
	recode eduLvl 4 = 3
	recode eduLvl 5 = 3
	recode eduLvl 6 = 4
	recode eduLvl 9 = .
	recode eduLvl . = .
	
label variable eduLvl "Highest Education Level Completed"
	label define eduLvl 1 "Never Attended School or Kindergarten"
	label define eduLvl 2 "Elementary or Middle School", add
	label define eduLvl 3 "High School or GED", add
	label define eduLvl 4 "Undergraduate or Higher", add
	label values eduLvl eduLvl
	
tab eduLvl

/// Income Level

gen income = income3
	recode income 1 = 1
	recode income 2 = 1
	recode income 3 = 1
	recode income 4 = 1
	recode income 5 = 2
	recode income 6 = 2
	recode income 7 = 3
	recode income 8 = 3
	recode income 9 = 4
	recode income 10 = 4
	recode income 11 = 4
	recode income 77 = .
	recode income 99 = .
	recode income . = .
	
label variable income "Annual Income"
	label define income 1 "Less than $25,000"
	label define income 2 "$25,000 to $49,999", add
	label define income 3 "$50,000 to $99,999", add
	label define income 4 "$100,000 and Higher", add
	label values income income

tab income

/// Age

gen ageCat = _ageg5yr
	recode ageCat 1 = 1
	recode ageCat 2 = 1
	recode ageCat 3 = 2
	recode ageCat 4 = 2
	recode ageCat 5 = 3
	recode ageCat 6 = 3
	recode ageCat 7 = 4
	recode ageCat 8 = 4
	recode ageCat 9 = 5
	recode ageCat 10 = 5
	recode ageCat 11 = 6
	recode ageCat 12 = 6
	recode ageCat 13 = 6
	recode ageCat 14 = .
	
label variable ageCat "Age"
	label define ageCat 1 "18 to 29"
	label define ageCat 2 "30 to 39", add
	label define ageCat 3 "40 to 49", add
	label define ageCat 4 "50 to 59", add
	label define ageCat 5 "60 to 69", add
	label define ageCat 6 "70 and Older", add
	label values ageCat ageCat
	
tab ageCat

/// Sex

gen male = sexvar
	recode male 1 = 1
	recode male 2 = 0
	
label variable male "Sex"
	label define male 0 "Female"
	label define male 1 "Male", add
	label values male male
	
tab male

/// Employment Status

gen work = employ1
	recode work 1 = 1
	recode work 2 = 1
	recode work 3 = 0
	recode work 4 = 0
	recode work 5 = 2
	recode work 6 = 2
	recode work 7 = 2
	recode work 8 = 2
	recode work 9 = .
	recode work . = .
	
label variable work "Employment Status"
	label define work 1 "Employed or Self-Emoployed"
	label define work 0 "Not Employed", add
	label define work 2 "Not in Workforce", add
	label values work work
	
tab work

/// Smoking Status

gen smoke = _smoker3
	recode smoke 1 = 1
	recode smoke 2 = 1
	recode smoke 3 = 2
	recode smoke 4 = 0
	recode smoke 9 = .
	
label variable smoke "Smoking Status"
	label define smoke 1 "Current Smoker"
	label define smoke 2 "Former Smoker", add
	label define smoke 0 "Nonsmoker", add
	label values smoke smoke
	
tab smoke

// Analysis

tab ageCat diabetic, row chi
tab maritalStat diabetic, row chi
tab eduLvl diabetic, row chi
tab income diabetic, row chi
tab male diabetic, row chi
tab work diabetic, row chi
tab smoke diabetic, row chi
