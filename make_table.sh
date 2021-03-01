echo "Welcome to pdftab v1.0"



# Directory the script was called from
curr_dir=`pwd`

# Full path to the file 
full_path="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"

echo "Will process file:" $full_path

# Move to the install directory 
cd /usera/wfawcett/scripts/pdftab/rundir

# --interaction=batchmode by default, could add an option to make this verbose 
pdflatex --interaction=batchmode "\def\tablefile{$full_path} \input{../make_table.tex}"
pdflatex --interaction=batchmode "\def\tablefile{$full_path} \input{../make_table.tex}"

pdfcrop make_table.pdf
mv make_table-crop.pdf make_table.pdf
#convert -density 300 make_table.pdf -quality 100 make_table.png


mv make_table.pdf $curr_dir/${1%.tex}.pdf
#mv make_table.png $curr_dir/${1%.tex}.png
