/^[^%]*begin{figure}/ {
	{
	: 1	
		N
		/end{figure}/ {
			s/\([^\\]\)%[^\n]*\n[[:space:]]*/\1 /
			s/[[:space:]]*\n[[:space:]]*/ /g
			s/[[:space:]][[:space:]]*/ /g
			s/^[[:space:]]*//
			s/[[:space:]]*$//
			s/^\\begin{figure}\(\[[^\]]*\]\|\)//
			s/\\end{figure}$//
			s/\\centering//
			s/^\(.*\)\\caption{\(\([^{}]\|{\([^{}]\|{\([^{}]\)*}\)*}\)*\)}/\2%%%\1/
			s/^\(.*\)\\label{\([^{}]*\)}.*/\2!!!\1/
			s/^\(.*\)!!!\(.*\)%%%\(.*\)$/\\newfig{ \1 }{\3}{\n  \2\n}\n/
			
			wfigs.tmp0
			b # break
		}
		b1 # go to 1
	}
}
