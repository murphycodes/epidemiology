* Question 1 *

tab cholmed3
* yes = 1, no = 2, don't know = 7, refused = 9

gen cholMedCat = cholmed3
recode cholMedCat (1 = 1) (2 = 0) (7 = 2) (9 = 3)
label variable cholMedCat "Currently Taking Medication for High Cholesterol"
label define cholMedCat 1 "Yes",
label define cholMedCat 0 "No", add
label define cholMedCat 2 "Don't Know", add
label define cholMedCat 3 "Refused to Answer", add
tab cholMedCat

* Question 2 *

tab cholmed3 sexvar
* sexvar male = 1, female = 2
* crosstabulate cholmed3 with sexvar

* Question 3 *
