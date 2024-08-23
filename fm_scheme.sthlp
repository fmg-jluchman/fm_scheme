{smcl}
{* *! version 0.0.0 August 23, 2024 J. N. Luchman}{...}
{cmd:help fm_scheme}

{title:Title}

{pstd}
{bf:fm_scheme} {hline 2} The Fors Marsh graph scheme prefix command {p_end}


{title:Syntax}

{p 8 16 2}
{cmd:fm_theme} [, {it:options}]: {it:gphcmd}

{synoptset 35 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt saving(filename)}}file to which to save the graph produded{p_end}
{synopt :{opt reset_font(fontname)}}font to which to reset the font{p_end}
{synopt :{opt reset_scheme(schemename)}}scheme to which to reset the scheme{p_end}
{synoptline}

{title:Table of Contents}

{space 4}{help fm_theme##desc: 1. Description}
{space 4}{help fm_theme##opts: 2. Options}
{space 4}{help fm_theme##examp: 3. Examples}
{space 4}{help fm_theme##consid: 4. Key Considerations}


{marker desc}{...}
{title:1. Description}

{pstd}
Fors Marsh's brand guidelines use fonts, 
{help colorstyle:color}, 
{help linepatternstyle:linestyles}, and 
{help symbolstyle:symbols} 
as distinctive visual markers of the {bf:Seriously Human} Fors Marsh brand 
in graphics depicting data analysis results. 

{pstd}
Stata schemes do not accommodate both graphics and fonts and, to apply both, 
the graph scheme was implemented as a prefix command. Stata graphs and 
graphics features that currently do not have a specific implementation in
Fors Marsh scheme will be rendered with the implementation of 
{help scheme s2mono}.

{pstd}
The {cmd:fm_theme} command has methods most line-, bar-, and dot-based 
graphics.

{dlgtab:Line graphs}

{pstd}
Line-based graphics include standard twoway 
{help graph twoway line:line graphs}, {help marginsplot:marginsplot}s, 
and {help kdensity}.

{phang}
All line-based graphics are black and white. When multiple trends are 
depicted in the same graph, the trends are distinguished using line patterns. 
Up to five different line patterns are supported in a single graph.

{dlgtab:Bar graphs}

{pstd}
Bar-based graphics include {help graph bar:bar graphs} and 
{help histogram:histograms}.

{phang}
Bar-based graphics are distinguished by combinations of colors and 
outlines when legend-based factors are used such as {opt over()} in 
{cmd:graph bar}. Up to five different color and outline pattern combinations are 
supported in a single graph.

{phang}
Histograms are uniform in color given they describe a single distribution.

{dlgtab:Dot graphs}

{pstd}
Dot-based graphics include {help graph twoway dot:dot graphs} and
{help scatter:scatterplot}s.

{phang}
Dot-based graphics are distinguished by combinations of colors and 
symbols when legend-based factors are used such as {opt over()} in 
{cmd:graph dot}. Up to five different color and symbol combinations are 
supported in a single graph.

{marker opts}{...}
{title:2. Options}

{phang}
{opt saving(filename)} saves the graph produced to a specific location in 
the desired format. When a valid {help graph export} format is not detected, 
the graph is saved as a .gph using {help graph save}. When a valid format 
is detected, the graph is saved using {cmd:graph export} with a fixed size of 
3"x2".

{pmore}
When the detected format is one of .eps, .ps, .pdf, or .svg, the 
{cmd:graph set {it:format} fontface} command corresponding to that format is 
also used and the entry in {opt reset_font(fontname)} or is reset to 
"default".

{phang}
{opt reset_font(fontname)} resets the font using {help graph set} to a specific 
fontface for producing Stata graphs. This is useful when the user does not 
want to continue to use {it: Berlingske Sans Medium} as the font that populates 
in subsequent graphs as {cmd:graph set} changes the font for the remainder of 
the user's Stata session.

{pmore}When the user does not specify a fontface in {opt reset_font()} the font 
is reset to Stata factory defaults.

{phang}
{opt reset_scheme(schemename)} resets the graph scheme using {help set scheme} 
to a specific scheme for producing Stata graphs. This is useful when the user 
does not want to continue to use the Fors Marsh scheme as the font 
that populates in subsequent graphs as {cmd:set scheme} changes the scheme for 
the remainder of the user's Stata session.

{pmore}When the user does not specify a scheme in {opt reset_scheme()} 
the scheme is reset to Stata factory defaults.

{marker examp}{...}
{title:3. Examples}

{pstd}
Example 1: Margins Plot-based Line Graph{p_end}
{pstd}
{stata webuse nlsw88}{p_end}
{pstd}
{stata mean wage if inrange(occupation, 1, 5), over(age occupation)}{p_end}
{pstd}
{stata `"fm_theme: marginsplot, noci xdim(age) xlabel(#4) plotdim(occupation) recast(line) ytitle("Wage in 1988")"'}{p_end}

{pstd}
Example 2: Margins Plot-based Dot Plot{p_end}
{pstd}
{stata `"fm_theme: marginsplot, noci xdim(age) xlabel(#4) plotdim(occupation) recast(scatter) ytitle("Wage in 1988")"'}{p_end}

{pstd}
Example 3: Bar Chart{p_end}
{pstd}
{stata `"fm_theme: graph bar (mean) wage if inrange(occupation, 1, 5), over(occupation) asyvars ytitle("Wage in 1988")"'}

{marker consid}{...}
{title:4. Key Considerations}

{pstd}
There are a number of strong suggestions for how to use the Fors Marsh scheme
when generating graphs. If you want to use any of these graph features or 
change defaults, first consult the Creative Craft Center. 

{phang}
These suggestions are binned together in conceptual categories below. 

{dlgtab:Don't use by()} 

{pstd}
Do not use {opt by(varlist, ...)} in graph commands that accept it as an 
option.

{pstd}
The use of {opt by(varlist, ...)} affects the proportionality of the graphs 
and can affect 508 compliance in unexpected ways.

{pstd}
As opposed to generating graphs using {opt by(varlist, ...)}, 
create separate graphs using {cmd:if} statements and combine them as separate 
graphics in the final document in a way that can facilitate comparing them.

{pstd}
We then also do not recommend the use of the {opt bydimension()} option 
with {cmd:marginsplot}.

{dlgtab:Don't add more distingushers}

{pstd}
Do not add colors, symbols, or other distingishers to the lines, bars, or dots. 
This includes labels on data points in the graphic.

{pstd}
The design of each graph has been customized to be branded, 508 compliant, 
easy to read for clients and stakeholders, and easy to use for Stata users. 
Changing visual design aspects, adding text to the graph region, and other
elements of the graph may make the graph fail to be branded, 508 compliant, 
or easy to read.

{dlgtab:Don't add titles or captions}

{pstd}
Do not add and actively suppress titles, subtitles, captions, and other 
notes that are added to graphs. Any such title or note could be added to the 
document in which the graphic is to be included and is probably a lot easier 
to edit in the document than as embedded in the graph.

{pstd}
Axis titles and ledgend entries do not apply to this recommendation and 
clear, concise labels for distinguishers and axes can be useful for readers.


