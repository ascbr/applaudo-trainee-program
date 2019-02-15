## PROGRAM TO READ A CSV FILE AND VALIDATE A LIST OF DATES

Program's components.

1. A Class to manage the events by their properties (title, date, original line number).
2. A function to display in console and print to a file, a graphic made with ascii characters.
3. A block of code to read the lines from the source csv file, evaluate the dates, create two arrays with valid and invalid events to later print both arrays in two csv files.

Functionality

The program will ask for the path and name of a file, example: */home/user/Documents/events.csv*, but in the case that the file is in the same program's folder, the path is not required just the file's name, example: *events.csv*.

Results

- The program will display the line number of the original file, when an invalid date is found in the source file.
- A graphic showing the number of valid and invalid dates found in the source file.
- The program will create two new files, 'valids.csv' with the valid dates that were found, and 'invalids.csv' with the invalid dates read form the original file, this new files will be created in the same program's folder.
