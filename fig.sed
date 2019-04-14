/^[^%]*begin{\(figure\|table\)}/ {
	{
	: 1	
		N # - glue the lines together in a loop
		/end{\(figure\|table\)}/ {
# -- ------
# -- Now the whole float (figure/table) is in the buffer
# -- the script acts by cutting the parts (label, caption, body, and
# -- fig/tab) and marking them with %..% signs.
# -- at the last stage the buffor should look like:
# -- eg.:   [some label] %C% [some caption] %B% [fig or tab] %A% [body of the float]
# -- and then it's transformed into a latex call
# -- ------
#			s/\([^\\]\)%[^\n]*\n[[:space:]]*/\1 /
#			s/[[:space:]]*\n[[:space:]]*/ /g
			s/\([^\\]\)%[^\n]*/\1/ # - delete comments
			s/[[:space:]]*\n/\n/g # - delete empty lines  and end-line spaces
#			s/[[:space:]][[:space:]]*/ /g
#			s/^[[:space:]]*//
#			s/[[:space:]]*$//
			s/^.*\\begin{\(\(fig\)ure\|\(tab\)le\)}\(\[[^\]]*\]\|\)/\2\3%A%/ # - delete leading begin
			s/\\end{\(figure\|table\)}.*$// # - delete trailing end
			s/\\centering//g # - delete centering
			s/\\\(begin\|end\){center}//g # - delete centering
			/tabular/ !{ s/[[:space:]]*\n[[:space:]]*/ /g } # in case of figures, no newlines
			s/^\(.*\)\\caption{\(\([^{}]\|{\([^{}]\|{\([^{}]\)*}\)*}\)*\)}/\2%B%\1/  # - copy caption (with nested brackets)
			s/^\(.*\)\\label{\([^{}]*\)}/\2%C%\1/ # - copy label
			s/^\(.*\)%C%\(.*\)%B%\(.*\)%A%\(.*\)$/\\new\3{ \1 }{\4}{\n  \2\n}\n/ # - make call to \fig{label}{body}{caption}
			s/[[:space:]]*\n/\n/g # - deleting empty lines
			wfigs.tmp0
			b # break
		}
		b1 # go to 1
	}
}
