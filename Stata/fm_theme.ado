*! fm_theme 0.0.0 Joseph N. Luchman mth/day/year

version 18

program define fm_theme, sclass

	local cmdline : copy local 0
	mata: _parse_colon("hascolon", "rhscmd")	
	macro dir
	if !`hascolon' {
		* error!
	}
	if !strlen("`rhscmd'") {
		* error!
	}
	di "`0'"
	if "`1'" == ":" parse_fm, cmd(`rhscmd')
	else parse_fm `0' cmd(`rhscmd')
	
end

version 18

program define parse_fm, sclass
	
	syntax [anything] [, gph(string)] cmd(string)

	display "`gph'"
	
	if strlen("`gph'") graph set `gph' fontface "Berlingske Sans Medium"
	set scheme fm

	`cmd'
	
	if strlen("`gph'") graph set `gph' fontface default

end

/*
version 0.0.0