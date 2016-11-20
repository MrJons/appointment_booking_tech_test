# Babylon health tech test

[![Build Status](https://travis-ci.org/MrJons/babylon_health_tech_test.svg?branch=master)](https://travis-ci.org/MrJons/babylon_health_tech_test)
[![Coverage Status](https://coveralls.io/repos/github/MrJons/babylon_health_tech_test/badge.svg?branch=master)](https://coveralls.io/github/MrJons/babylon_health_tech_test)

##### To run program
- Navigate to root of program directory.
- run bundle
- uncomment code at bottom of application file
- run applications file with chosen time as below..

  `$ ./availability.rb 12:40`

##### Requirements fulfilled
- [x] Book required time where available
- [x] Book next available where choice not possible
- [x] Appointment time printed on booking
- [x] Patients cannot book appointments outside of hours
- [x] Slots cannot be booked twice.

##### Future concerns
Restructure how information is passed into program. Primarily, refactor out into a 'input' class, reducing future technical debt where other information may be added to request.

-----

# Brief
Your task is to create an app that will allow patients to book appointments with a doctor, using the dataset provided.

## Requirements
You should create a command line app that accepts a single argument, which is the time that the patient
would like to book to see a doctor. Eg:

    $ ./availability.rb 12:40

The app should check which is the next available slot and book it.
It should print the time of the appointment that was booked

## Additional Requirements
Patients cannot book appointments before 8am and after 3pm. Once an availability has been
used up for an appointment it cannot be booked again.

In the dataset there are multiple doctors (id: 1 & 2) and each doctor can only have 1 appointment per slot.
For example, you could potentially book 12:20 once for doctor 1 and again for doctor 2.

## Constraints
* Please use the JSON file provided to load availability into your app.
* Your app should be an executable ruby script (command line).
* Your app should accept a time (eg: 12:40)
* Your app should print the time that was booked (eg: 1:10)
