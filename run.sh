#!/usr/bin/env bash

# #activate venv
# source env/bin/activate

PYTHON=python
PIP=pip

$PYTHON --version

# (optional) install any requirements of your current app in this venv
$PIP install -r requirements.txt $FLAGS > /dev/null

if [[ $(ls -1 correction/proposed_answers/ | wc -l | tail -c 2) = '0' ]]; then
	echo "No answer files detected at $(pwd)/correction/proposed_answers. Exiting."
else
	for f in correction/proposed_answers/*; do
		echo "Answer file detected: $f..."
		echo "Processing..."

		QUESTION_COLUMN=$(basename "$f" | cut -d. -f1)
		ANSWER_FILE_NAME_NO_EXTENSION=$(basename "$f" | cut -d. -f1)

		$PYTHON batch_sql_corrector.py \
			"$(pwd)/correction/script-students.sql" \
			"$(pwd)/correction/script-correction.sql" \
			"$(pwd)/correction/student_answers.xlsx" \
			"$QUESTION_COLUMN" \
			"$f" > "Results/$ANSWER_FILE_NAME_NO_EXTENSION.txt" &
	done
fi

wait
echo "All done"
