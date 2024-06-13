# Test Cases

A test ID is composed of the following:

- The letter corresponds to the category of the test. The J stands for Job Seeker. The C stands for Company.
- The number following that corresponds to the type of page the user is in. The type of page is defined by the cell category in the following table.
- The last number is the number of the test case.

:x: means that the test did not pass.
:white_check_mark: means that the test passed.

|ID|Category|Description|Expected results|Status|
|---|---|---|---|---|
|J-01-01|First Page|The user clicks on the "Connexion" button|The user is redirected to the login page|:white_check_mark:|
|J-01-02|First Page|The user clicks on the "Inscription" button|The user is redirected to the registration page|:white_check_mark:|
|J-01-03|First Page|The user clicks on the "Passer au mode entreprise" button|The user enters the company mode|:white_check_mark:|
|J-02-01|Sign in|The user enters a valid email|The user is redirected to the next page|:white_check_mark:|
|J-02-02|Sign in|The user enters an invalid email|An error message appears|:x:|
|J-02-03|Sign in|The user fills all the fields with valid information|The user is redirected to the next page|:white_check_mark:|
|J-02-04|Sign in|The user types an invalid first name|An error appears below the field|:x:|
|J-02-05|Sign in|The user types an invalid last name|An error message appears below the field|:x:|
|J-02-06|Sign in|The user types an invalid phone number|An error message appears below the field|:x:|
|J-02-07|Sign in|The user lets one or multiple fields empty|An error message appears below the concerned fields|:white_check_mark:|
|J-02-08|Sign in|All the fields are filled with valid information|The user is redirected to the next page|:white_check_mark:|
|J-02-09|Sign in|The user types an invalid address|An error message appears below the field|:x:|
|J-02-10|Sign in|The user types an invalid city|An error message appears below the field|:x:|
|J-02-11|Sign in|The user types an invalid postal code|An error message appears below the field|:x:|
|J-02-12|Sign in|The user lets one or multiple fields empty|An error message appears below the concerned fields|:white_check_mark:|
|J-02-13|Sign in|All the fields are filled with valid information|The user is redirected to the next page|:white_check_mark:|
|J-03-01|Log in|The user types the right email and password|The user is redirected to the home page|:white_check_mark:|
|J-03-02|Log in|The user types an invalid email|An error message appears|:x:|
|J-03-03|Log in|The password and email don't match|An error message appears|:x:|
|J-04-01|Soft Skills|The user selects no soft skills|An error message appears asking to select at least one|:white_check_mark:|
|J-04-02|Soft Skills|The user selects more than 8 soft skills|An error message appears asking to select at most 8|:white_check_mark:|
|J-04-03|Soft Skills|The user selects between 1 and 8 soft skills|The user is redirected to the next page|:white_check_mark:|
|J-05-01|Hobbies|The user lets all the field empty|A message appears asking if he is sure to let all the fields empty|:white_check_mark:|
|J-05-02|Hobbies|The user types a hobby that he already added|An error message appears|:x:|
|J-05-03|Hobbies|The user typed at least one hobby and click on "Suivant"|The user is redirected to the next page|:white_check_mark:|
|J-06-01|Matching|The user clicks on the "Matching" button|The user is redirected to the matching page|:white_check_mark:|
|J-06-02|Matching|The user is on a job offer|The name of the company and the soft skills required are displayed|:white_check_mark:|
|J-06-03|Matching|The user swipes left on a job offer|The job offer is removed from the list|:x:|
|J-06-04|Matching|The user swipes right on a job offer|The job offer is added to the list of liked job offers|:x:|
|J-07-01|Up Bar|The user clicks on the "Log out" button|The user is redirected to the first page|:white_check_mark:|
|J-07-02|Up Bar|The user clicks on the "Profil" button|The user is redirected to the profile page|:white_check_mark:|
|J-07-03|Up Bar|The user clicks on the "Matching" button|The user is redirected to the settings page|:white_check_mark:|
|J-07-04|Up Bar|The user clicks on the "Paramètres" button|The user is redirected to the settings page|:x:|
|J-08-01|Profile|The user clicks on the "Modifier mes informations personnelles" button|The user can modify his information|:white_check_mark:|
|J-08-02|Profile|The user clicks on the "Modifier mes hobbies" button|The user can modify his hobbies|:white_check_mark:|
|J-08-03|Profile|The user clicks on the "Voir mes matchs" button|The user has access to all of his matches|:x:|
|J-08-04|Profile|The user clicks on "Supprimer mon compte" button|The profile is deleted and all the info with it|:x:|
||||||
|C-01-01|First Page|The user clicks on the "Connexion" button|The user is redirected to the login page|:x:|
|C-01-02|First Page|The user clicks on the "Inscription" button|The user is redirected to the registration page|:white_check_mark:|
|C-01-03|First Page|The user clicks on the "Passer au mode chercheur d'emploi" button|The user enters the job seeker mode|:white_check_mark:|
|C-02-01|Sign in|The user enters a valid email|The user is redirected to the next page|:x:|
|C-02-02|Sign in|The user enters an invalid email|An error message appears|:x:|
|C-02-03|Sign in|The user types an incorrect name|An error message appears below the field|:x:|
|C-02-04|Sign in|The user types an incorrect phone number|An error message appears below the field|:x:|
|C-02-05|Sign in|The user types an incorrect address|An error message appears below the field|:x:|
|C-02-06|Sign in|The user types an incorrect SIRET number|An error message appears below the field|:x:|
|C-02-07|Sign in|The user types an incorrect activity field|An error message appears below the field|:x:|
|C-02-09|Sign in|The user lets one or multiple fields empty|An error message appears below the concerned fields|:x:|
|C-02-10|Sign in|All the fields are filled with valid information|The user is redirected to the next page|:x:|
|C-02-11|Sign in|The user types an incorrect date of creation|An error message appears below the field|:x:|
|C-02-12|Sign in|The user types an incorrect number of employees|An error message appears below the field|:x:|
|C-02-13|Sign in|The user types incorrect searched positions|An error message appears below the field|:x:|
|C-02-14|Sign in|The user lets one or multiple required fields empty|An error message appears below the concerned fields|:x:|
|C-02-15|Sign in|All the required fields are filled with valid information|The user is redirected to the next page|:white_check_mark:|
|C-03-01|Log in|The user types the right email and password|The user is redirected to the home page|:x:|
|C-03-02|Log in|The user types an invalid email|An error message appears|:x:|
|C-03-03|Log in|The password and email don't match|An error message appears|:x:|
|C-04-01|Profile|The user clicks on the "Modifier mes informations" button|The user can modify his information|:x:|
|C-04-02|Profile|The user clicks on the "Modifier mes offres d'emploi" button|The user can modify his job offers|:white_check_mark:|
|C-04-03|Profile|The user clicks on the "Voir mes matchs" button|The user has access to all of his matches|:x:|
|C-04-04|Profile|The user clicks on "Supprimer mon compte" button|The profile is deleted and all the info with it|:x:|
|C-05-01|Job Offers|The user clicks on the "Ajouter une offre d'emploi" button|The user is redirected to the job offer creation page|:white_check_mark:|
|C-05-02|Job Offers|The user clicks on one of is already created offers|The user is redirected to selected job offers|:x:|
|C-06-01|Soft Skills|The user selects no soft skills|An error message appears asking to select at least one|:white_check_mark:|
|C-06-02|Soft Skills|The user selects more than 8 soft skills|An error message appears asking to select at most 8|:white_check_mark:|
|C-06-03|Soft Skills|The user selects between 1 and 8 soft skills|The user is redirected to the next page|:white_check_mark:|
|C-07-01|Up Bar|The user clicks on the "Log out" button|The user is redirected to the first page|:x:|
|C-07-02|Up Bar|The user clicks on the "Profil" button|The user is redirected to the profile page|:x:|
|C-07-03|Up Bar|The user clicks on the "Matching" button|The user is redirected to the settings page|:x:|
|C-07-04|Up Bar|The user clicks on the "Paramètres" button|The user is redirected to the settings page|:x:|
|C-08-01|Matching|The user is on a job seeker profile|The common soft skills and the hobbies are displayed|:x:|
|C-08-02|Matching|The user swipes left on a job seeker profile|The job seeker profile is removed from the list|:x:|
|C-08-03|Matching|The user swipes right on a job seeker profile|The job seeker profile is added to the list of liked job seeker profiles|:x:|
