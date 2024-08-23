*! fm_scheme 0.0.0 Joseph N. Luchman 8/23/2024

version 18

program define fm_scheme, sclass

	local cmdline : copy local 0
	mata: _parse_colon("hascolon", "rhscmd")	
	macro dir
	if !`hascolon' {
		* error!
	}
	if !strlen("`rhscmd'") {
		* error!
	}
	di `"`0'"'
	if "`1'" == ":" parse_fm, cmd(`rhscmd')
	else parse_fm `0' cmd(`rhscmd')
	
end

version 18

program define parse_fm, sclass
	
	syntax [anything], [saving(string) reset_font(string) reset_scheme(string)] cmd(string)
	
	graph set window fontface "Berlingske Sans Medium"
	set scheme fm
	
	if strlen("`saving'") { // parse this to allow for options
		if regexm("`saving'", "\.(svg|ps|pd|eps)$") {
			local gph_type = regexcapture(regexm("`saving'", "\.(svg|ps|pd|eps)$"))
		}
		graph set `gph_type' fontface "Berlingske Sans Medium"
	}
	
	`cmd'

	//graph save  < -- if suffix is missing or .gph
	if strlen("`saving'") graph export "`saving'"
	
	if !strlen("`reset_font'") local reset_font "default"
	
	if !strlen("`reset_scheme'") local reset_scheme "stcolor"
	
	graph set window fontface "`reset_font'"
	if strlen("`gph_type'") graph set `gph_type' fontface "`reset_font'"
	set scheme `reset_scheme'

end

/*
 fm_scheme version 0.0.0 - August 23, 2024
 ---