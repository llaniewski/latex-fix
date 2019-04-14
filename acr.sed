{
	:1
	s/\b\([[:upper:]][[:upper:]][[:upper:]]*\)\b/ %A% \1 %B% /
	/ %A% / !b
	s/.* %A% //
	h
	s/ %B% .*//p
	g
	s/.* %B% //
	b1
}
