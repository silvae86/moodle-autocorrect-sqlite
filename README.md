# Moodle SQL Evaluator for SQLite


This project is intended to help teachers grade SQL exercises for exams run on Moodle. In the courses that I teach, we evaluate our students using two distinct database scripts. 

While they both share the same database schema, one is provided to the students during the exam and contains fewer records than a second script with additional entries designed to test additional edge cases. We shall call them `script-students.sql` and `script-correction.sql` in this guide.

## Pre-requisites

	- Ubuntu Linux or
	- macOS with [Homebrew](https://brew.sh) installed

## Instructions

### Installation

1. Open Terminal
2. Clone this repository
		`git clone https://github.com/silvae86/moodle-sql-evaluator`
		
3. Go to the directory where the cloned files are
		`cd moodle-sql-evaluator`
		
4. Run the setup in Terminal
	- On macOS
		`chmod setup-mac.sh && ./setup-mac.sh`
	- On Ubuntu Linux
		`chmod setup-ubuntu.sh && ./setup-ubuntu.sh`

### Preparation of the environment

1. Download the answers of your students from moodle
	1.1. Access the Exam in Moodle
	1.2. Select the 'Responses' option to access the list of answers given by the students
	1.2. Sort the answers by the first name of the students (or any other criteria, as the SQL evaluator will produce a list of answers ordered by that same criteria).
	1.3. Select Microsoft Excel as the download format for the answers
	1.4. Click 'Download'. An Excel file will be produced by moodle and start downloading.

2. Change the name of the downloaded file, for example to `student_answers.xlsx` and place it in the `correction` folder.

3. Place the scripts that create the database schema and insert the necessary records in the `correction` folder: for example `script-students.sql` and `script-correction.sql`

4. Now we need to place your proposed solutions for the SQL questions in the `correction/proposed_answers` folder. 

	4.1. For every question that you want to automatically correct, place a `.sql` file with the same name as the header of the column in the Excel file downloaded from Moodle. For example, if the `Response 15` column in the Excel file contains student answers, you need to create a `correction/proposed_answers/Response 15.sql` file with your proposed solution (in SQL) for that question.
	
	4.2. The script will detect these `.sql` files and try to correct only those answers where there is a proposed answer. 
	

### Running the script

The hard part is done. Let's run the script.

1. Open Terminal
2. `cd` to the folder where your files are (same as where you initially cloned this too) 
3. Run script

	`./run.sh`
4. See the results in the `Results/` folder. There should be one .txt file for each of the questions, with this layout:



## Background

I have taught some courses involving databases in SQL (Databases in the Integrated Masters in Informatics Engineering) and Information Systems and Databases (Integrated Masters in Electrical Engineering) and Information Systems Engineering (Integrated Masters in Bioengineering + Masters in Biomedical Engineering).