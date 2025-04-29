{smcl}
{* *! version 0.0.0 April 25, 2025 J. N. Luchman}{...}
{cmd:help fmlite_scheme}

{title:Title}

{pstd}
{bf:fmlite_scheme} {hline 2} A flexible, informal Fors Marsh graph 
scheme command {p_end}


{title:Syntax}

{p 8 16 2}
{cmd:fmlite_scheme} [(macroname1 = macrocontent1) (macroname2 = macrocontent2) 
...]

{title:Table of Contents}

{space 4}{help fm_scheme##desc: 1. Description}
{space 4}{help fm_scheme##usage: 2. Usage}
{space 4}{help fm_scheme##examp: 3. Examples}
{space 4}{help fm_scheme##consid: 4. Key Considerations}


{marker desc}{...}
{title:1. Description}

{pstd}
Many analysts might be looking for a way to incorporate a Fors Marsh style for 
less formal deliverables that do not need to be 508 compliant and need to be 
easier to work with in markdown documentation where graph sizing can vary.

{pstd}
The focus of {cmd:fmlite_sheme} is to provide an easy mechanism for analysts 
to apply some of the most important elements of the Fors Marsh visual 
signature to graphics without many of the constraints imposed by 
{cmd:fm_scheme}.

{pstd}
{cmd:fmlite_scheme} is not recommended for formal deliverables without review 
from the Creative Craft Center but can, and should, be applied to informal 
graphics like markdowns that may, or may not, be submitted to clients 
as documentation.

{marker usage}{...}
{title:2. Usage}

{pstd}
{cmd:fmlite_scheme} sets the user's environment using {cmd:set scheme} and 
{cmd:graph set window fontface}. Both of these changes pesist throughout your 
Stata session and will apply to any graphs produced in the same session after 
{cmd:fmlite_scheme} is called. This ensures that all fonts and background 
appearence factors apply key aspects of Fors Marsh branding.

{pstd}
The {it: (macroname1 = macrocontent1) (macroname2 = macrocontent2) ...} 
syntax allows the user to define global macros that will apply the Fors Marsh 
recommended title case font (i.e., {it:Berlingske Sans Poster}) in a way 
that Stata can use in the context of any {cmd:graph} command. 
This syntax creates a global macro which will be named using 
the {it:macroname} entry. The text content of the macro will be obtained from 
the {it:macrocontent} entry. The {it:macroname} and {it:macrocontent} 
must be separated by an equal sign/"=" and must be enclosed 
in parentheses/"()". Multiple macros can be created at once.

{pstd}
Once created, we recommend using the global macro surrounded by compound 
double quotes (i.e., `""'). For instance, the syntax {it: (title = Title!)}
creates a global macro called "title" that when invoked returns the word 
"Title!". If the user wanted to use this global macro in a Stata graph as the 
title, they would apply {cmd:title(`"$title"')}. The user does not need to 
enclose the content of {it:macrocontent} in double quotes unless they want 
those double quotes displayed in the title. Note that default titles for 
graphics will not be in title case and any title that needs to be in title case 
has to be created using this syntax.

{pstd}
{cmd:fmlite_scheme} also defines eight global macros representing the RBG codes 
for the Fors Marsh brand colors that are identified using their names in the 
brand guide with spaces replaced by underscores. Those global macro names 
include:

{pmore}
- Fors_Marsh_Orange

{pmore}
- Pastel_Pink

{pmore}
- Aquamarine

{pmore}
- Blue

{pmore}
- Deep_Orange

{pmore}
- Tangerine

{pmore}
- Bright_Green

{pmore}
- Violet

{pstd}
{cmd:fmlite_scheme} is based on {help scheme stmono1} and most thematic elements 
are derived from this scheme. Note that {cmd:fmlite_scheme} only changes 
fontfaces in the viewer window which may not translate into saved results for 
PostScript/PS, Encapsulated PostScript/EPS, Scalable Vector Graphic/SVG, or 
Portable Document Format/PDF.

{marker examp}{...}
{title:3. Examples}

{pstd}
Example 1: Margins Plot-based Line Graph{p_end}
{pstd}
{stata webuse nlsw88}{p_end}
{pstd}
{stata fmlite_scheme (title = Estimated Margins)}{p_end}
{pstd}
{stata mean wage, over(age smsa south)}{p_end}
{pstd}
{stata `"marginsplot, noci xdim(age) xlabel(#4) plotdim(smsa south) recast(line) plotopts(lcolor("$Fors_Marsh_Orange")) ytitle("Wage in 1988") title(`"$title"')"'}{p_end}

{pstd}
Example 2: Scatter Plot{p_end}
{pstd}
{stata `"scatter wage ttl_exp, by(smsa) mcolor("$Blue")"'}{p_end}

{pstd}
Example 3: Bar Chart{p_end}
{pstd}
{stata `"graph bar (mean) wage, over(smsa) over(south) asyvars bar(1, fcolor("$Pastel_Pink")) bar(2, fcolor("$Aquamarine"))"' }

{pstd}
Example 3: Fitted Line Graph{p_end}
{pstd}
{stata `"graph twoway scatter wage age, mcolor("$Bright_Green") jitter(10) || lfit wage age, lcolor(black)"'}

{marker consid}{...}
{title:4. Key Considerations}

{pstd}
As compared to the recommendations for {cmd:fm_scheme}, {cmd:fmlite_scheme} does
not have any key considerations and is thus far more flexible. You do not need 
to use a built-in saving option to save graphs with the "lite" scheme. You can 
use {opt by} with the "lite" theme. You can also use as many distinguishers 
as you would like with the "lite" theme. In addition, you can add titles and 
captions to the graphics as needed with the "lite" theme.

