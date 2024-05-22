# Test Cases

A test ID is composed of the following:

- The first letter is the category of the test. The J stands for Job Seeker. The C stands for Company.
- The second number corresponds to the type of page the user is in.
- The third number is the number of the test case.

|ID|Category|Description|Expected results|Status|
|---|---|---|---|---|
|J-01-01|First Page|The user click on the "Connexion" button|The user is redirected to the login page|:x:|
|J-01-02|First Page|The user click on the "Inscription" button|The user is redirected to the registration page|:x:|
|J-01-03|First Page|The user click on the "Passer au mode entreprise" button|The user enters the company mode|:x:|
|J-02-01|Sign in|The user enters a valid email|The user is redirected to the next page|:x:|
|J-02-02|Sign in|The user enters an invalid email|An error message appears|:x:|
|J-02-03|Sign in|The user fill all the fields with valid information|The user is redirected to the next page|:x:|
|J-02-04|Sign in|The user types an invalid first name|An error appears below the field|:x:|
|J-02-05|Sign in|The user types an invalid last name|An error message appears below the field|:x:|
|J-02-06|Sign in|The user types an invalid phone number|An error message appears below the field|:x:|
|J-02-07|Sign in|The user lets one or multiple fields empty|An error message appears below the concerned fields|:x:|
|J-02-08|Sign in|All the fields are filled with valid information|The user is redirected to the next page|:x:|
|J-02-09|Sign in|The user types an invalid address|An error message appears below the field|:x:|
|J-02-10|Sign in|The user types an invalid city|An error message appears below the field|:x:|
|J-02-11|Sign in|The user types an invalid postal code|An error message appears below the field|:x:|
|J-02-12|Sign in|The user lets one or multiple fields empty|An error message appears below the concerned fields|:x:|
|J-02-13|Sign in|All the fields are filled with valid information|The user is redirected to the next page|:x:|
|J-03-01|Soft Skills|The user selects no soft skills|An error message appears asking to select at least one|:x:|
|J-03-02|Soft Skills|The user more than 8 soft skills|An error message appears asking to select at most 8|:x:|
|J-03-03|Soft Skills|The user selects between 1 and 8 soft skills|The user is redirected to the next page|:x:|
|J-04-01|Hobbies|The user lets all the field empty|A message appears asking if he is sure to let all the fields empty|:x:|
|J-04-02|Hobbies|The user types a hobby that he already added|An error message appears|:x:|
|J-04-03|Hobbies|The user typed at least one hobby and click on "Suivant"|The user is redirected to the next page|:x:|
|J-05-01|Matching|The user clicks on the "Matching" button|The user is redirected to the matching page|:x:|
|J-05-02|Matching|The user is on a job offer|The name of the company and the soft skills required are displayed|:x:|
|J-05-03|Matching|The user swipes left on a job offer|The job offer is removed from the list|:x:|
|J-05-04|Matching|The user swipes right on a job offer|The job offer is added to the list of liked job offers|:x:|
|J-06-01|Up Bar|The user clicks on the "Log out" button|The user is redirected to the first page|:x:|
|J-06-02|Up Bar|The user clicks on the "Profil" button|The user is redirected to the profile page|:x:|
|J-06-03|Up Bar|The user clicks on the "Matching" button|The user is redirected to the settings page|:x:|
|J-06-04|Up Bar|The user clicks on the "Paramètres" button|The user is redirected to the settings page|:x:|
|J-07-01|Profile|The user clicks on the "Modifier mes informations personnelles" button|The user can modify his information|:x:|
|J-07-02|Profile|The user clicks on the "Modifier mes hobbies" button|The user can modify his hobbies|:x:|
|J-07-03|Profile|The user clicks on the "Voir mes matchs" button|The user has access to all of his matches|:x:|
|J-07-04|Profile|The user clicks on "Supprimer mon compte" button|The profile is deleted and all the info with it|:x:|
