# Moodle SQL Evaluator for SQLite


This project is intended to help teachers grade SQL exercises for exams run on Moodle, when a fully automated approach is not the most appropriate and the professors want to grade manually but with some assistance for automatically running the queries written by students.

Using these scripts you will be able to download the Excel spreadsheet with all your students' answers, provide your own suggestions for the correct SQL query for each exercise in separate `.sql` files, and see if the queries written by the students return the same tuples as you expect.

These scripts will produce a text file per answer that looks more or less like this:

<img src="https://github.com/silvae86/moodle-autocorrect-sqlite/raw/master/docs/img/sample.png" alt="Sample output" width="100%"/>

## Two SQL scripts: one for the students, one for grading

In the courses that I teach, we evaluate our students using two distinct database scripts.

While they both share the same database schema, one is provided to the students during the exam and contains fewer records than a second script with additional entries designed to test additional edge cases. We shall call them `script-students.sql` and `script-correction.sql` in this guide.

## Pre-requisites

- Install [Docker](https://docs.docker.com/get-docker/).

## Instructions

1. Open Terminal
2. Clone the repository or download the ZIP:
	- `git clone https://github.com/silvae86/moodle-autocorrect-sqlite`
	- Download the ZIP file (here in this GitHub page, at the top -> Green Button that says "Clone" -> Download ZIP) and extract it.

3. Open a command line and go to the directory where the files are:
		`cd moodle-autocorrect-sqlite`

4. Prepare the environment as [shown below](https://github.com/silvae86/moodle-autocorrect-sqlite#preparation-of-the-environment).

5. Run the commands that produce the corrections

 1. **In Linux / Mac**
```bash
docker pull joaorosilva/moodle-autocorrect-sqlite:latest
docker run -v "$(pwd)/correction":/data/correction -w /data joaorosilva/moodle-autocorrect-sqlite:latest
```
 2. **In Windows CMD** (Type Win Key+R -> `cmd.exe` -> Enter)
```shell
docker pull joaorosilva/moodle-autocorrect-sqlite:latest
docker run -v "%cd%\correction":/data -w /data joaorosilva/moodle-autocorrect-sqlite:latest
```
 3. **In Windows PowerShell**
```PowerShell
docker pull joaorosilva/moodle-autocorrect-sqlite:latest
docker run -v "${PWD}":/data -w /data joaorosilva/moodle-autocorrect-sqlite:latest
```


6. See the results in the `Results/` folder.
	- There should be one .txt file for each of the questions, more or less like this:

	<img src="https://github.com/silvae86/moodle-autocorrect-sqlite/raw/master/docs/img/results.png" alt="Example of the results" width="250"/>

## Preparation of the environment

1. Download the answers of your students from moodle

	1.1. Access the Exam in Moodle

	1.2. Select the 'Responses' option to access the list of answers given by the students

	<img src="https://github.com/silvae86/moodle-autocorrect-sqlite/raw/master/docs/img/downloading_answers.png" alt="Access all student answers" width="200"/>

	1.2. Sort the answers by the first name of the students (or any other criteria, as the SQL evaluator will produce a list of answers ordered by that same criteria).

	1.3. Select Microsoft Excel as the download format for the answers

	1.4. Click 'Download'. An Excel file will be produced by moodle and start downloading.

	<img src="https://github.com/silvae86/moodle-autocorrect-sqlite/raw/master/docs/img/download_answers.jpg" alt="Ordering and downloading student answers" width="800"/>

2. Change the name of the downloaded file to `student_answers.xlsx` and place it in the `correction` folder.

3. Place the scripts that create the database schema and insert the necessary records in the `correction` folder: `script-students.sql` for the script given to the students and `script-correction.sql` to your correction script.

4. Now we need to place your proposed solutions for the SQL questions in the `correction/proposed_answers` folder.

	4.1. For every question that you want to automatically correct, place a `.sql` file with the same name as the header of the column in the Excel file downloaded from Moodle. 
	- For example, if the `Response 15` column in the Excel file contains SQL answers, you need to create a `correction/proposed_answers/Response 15.sql` file with your proposed solution (in SQL) for that question.

	4.2. The script will detect these `.sql` files and try to correct only those answers where there is a proposed answer.


## Grading

Access the exam in Moodle and go to the little gear at the top right and select "Manual Grading". After choosing the question you want to grade, change the settings like this:

1. Sort by the same criteria you used when you downloaded your Excel spreadsheet with the answers and 
2. Show many answers per page

<img src="https://github.com/silvae86/moodle-autocorrect-sqlite/raw/master/docs/img/manual-grading-settings.png" alt="Manual Grading Settings Example" />
	
Then, open the text file by the side of the manual grading window. Scroll in parallel and start grading!

### Background

I have taught some courses involving databases and SQL (Databases in the Integrated Masters in Informatics Engineering) and Information Systems and Databases (Integrated Masters in Electrical Engineering) and Information Systems Engineering (Integrated Masters in Bioengineering + Masters in Biomedical Engineering).

These scripts saved me a ton of copy-paste. Hope they can save some for you too!
