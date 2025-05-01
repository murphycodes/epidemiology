// Lab Assignment 8 - Sensitivity and Specificity

// Importing Data

use "/Users/murphy/Library/CloudStorage/OneDrive-UniversityofTennessee/Spring 2025/PUBH 542 - Epidemiology II/Datasets/BRFSS2023.dta"

// Recoding Variable

/// ADDEPEV3, ever told you had a depressive disorder

gen depressed = addepev3
	recode depressed 1 = 1
	recode depressed 2 = 0
	recode depressed 7 = .
	recode depressed 9 = .
	recode depressed . = .
	
label variable depressed "Ever Told Had a Depressive Disorder"
	label define depressed 1 "Yes"
	label define depressed 0 "No", add
	label values depressed depressed
	
/// MENTHLTH, days when preceived mental health is bad

gen badMentalHealth = menthlth
	recode badMentalHealth (1/7 = 0)
	recode badMentalHealth (8/30 = 1)
	recode badMentalHealth 88 = 0
	recode badMentalHealth 77 = .
	recode badMentalHealth 99 = .
	recode badMentalHealth . = .
	
label variable badMentalHealth "Self-Assessed Poor Mental Health"
	label define badMentalHealth 0 "No"
	label define badMentalHealth 1 "Yes", add
	label values badMentalHealth badMentalHealth
	
/// POORHLTH, poor physical or mental health

gen badHealth = poorhlth
	recode badHealth (1/7 = 0)
	recode badHealth (8/30 = 1)
	recode badHealth 88 = 0
	recode badHealth 77 = .
	recode badHealth 99 = .
	recode badHealth . = .
	
label variable badHealth "Days of Poor Physical or Mental Health"
	label define badHealth 0 "7 Days or Less"
	label define badHealth 1 "8 Days or More", add
	label values badHealth badHealth

/// Question 2: Calculate percent agreement between depressed and badMentalHealth

kap depressed badMentalHealth, tab


