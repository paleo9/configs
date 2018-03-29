# USAGE: sh resize.sh infile.jpg outfile
# don't specify the file type on the output file
# produces 5 .jpg files of the form  "outfile-WIDTHxHEIGHT.jpg" for scalings 1:1 1:2 1:4 1:8 1:16
# also shows how long it took to complete, maybe 15 seconds

time convert $1  \( -clone 0 -resize 50% \) \( -clone 0 -resize 25% \) \( -clone 0 -resize 12.5% \) \( -clone 0 -resize 6.25% \) -set filename:area '%wx%h'  $2-%[filename:area].jpg 
