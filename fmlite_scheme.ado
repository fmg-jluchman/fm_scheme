*! fmlite_scheme 0.0.0 Joseph N. Luchman 04/25/2025
version 18
program define fmlite_scheme, sclass
syntax [anything]
	if (strlen("`anything'") > 0) mata: make_global_titles(`"`anything'"')
	global Fors_Marsh_Orange 	"255 162  25"
	global Pastel_Pink 			"254 204 221"
    global Aquamarine 			"107 225 202"
    global Blue		            "124 220 255"
    global Deep_Orange			"204  86  38"
    global Tangerine			"255 121  31"
    global Bright_Green			"127 233  72"
    global Violet				"131  83 255"
	graph set window fontface "Berlingske Sans Medium"
	set scheme fmlite
end
version 18
mata:
mata set matastrict on
void make_global_titles(string scalar anything) {
	transmorphic t
	string scalar vgu, name, junk, label
	numeric scalar txt
	t = tokeninit(" ", " ", "()")
	tokenset(t, anything)
	vgu = tokengetall(t)
	vgu = substr(vgu, 2, strlen(vgu):-2)
	for (txt = 1; txt <= length(vgu); txt++) {
		t = tokeninit(" ", "=")
		tokenset(t, vgu[txt])
		name = tokenget(t)
		junk = tokenget(t)
		label = tokenrest(t)
		st_global(name, "{fontface " + char(34) + "Berlingske Sans Poster" + char(34) + ": " + label + "}")		
	}
}
end
/*
 fmlite_scheme version 0.0.0 - April 25, 2025
 ---