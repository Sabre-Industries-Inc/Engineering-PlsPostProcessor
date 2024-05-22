TYPE='Schema Customizations' VERSION='4.3' UNITS='SI' SOURCE='PLS-POLE Version 19.01' USER='Sabre Communications' FILENAME='c:\users\mrogers\appdata\roaming\pls\pls-pole.sma'
72 48 500 459 1 0 445 209 94 0 2
CSchemaHolder
6 'Tubular X-Arm Connectivity' 6 1 1 0 0 0 0 0

0 'X-Arm\nLabel\n\n' 'X-Arm\nLabel\n\n' '%6s' '%8s' '' '' '' '' '' 0
1 'X-Arm\nProperty\nSet\n' 'X-Arm\nProperty\nSet\n' '%9s' '%21s' '' '' '' '' '' 0
2 'Azimuth\n\n\n%m' 'Azimuth\n\n\n%m' '%8.5lg' '%8.5lg' '' '' '' 'Azimuth is measured relative to transverse axis and is positive clockwise when viewed from above' 'Azimuth is measured relative to transverse axis and is positive clockwise when viewed from above' 0
3 'Slope\n\n\n%m' 'Slope\n\n\n%m' '%6.5lg' '%8.5lg' '' '' '' '' '' 0
4 'Attach.\nLabels\n\n' 'Attach.\nLabels\n\n' '%8s' '%10s' '' '' '' '' '' 0
5 'Connects\n\n\n' 'Connects\n\n\n' '%15s' '%10s' '' '' '' '' '' 0
CSchemaHolder
4 'Tubular Davit Arm Connectivity' 1 1 1 0 0 0 0 0

0 'Davit\nLabel\n' 'Davit\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Attach\nLabel\n' 'Attach\nLabel\n' '%7s' '%16s' '' '' '' '' '' 0
2 'Davit\nProperty\nSet' 'Davit\nProperty\nSet' '%9s' '%21s' '' '' '' '' '' 0
3 'Azimuth\n\n%m' 'Azimuth\n\n%m' '%8.5lg' '%8.5lg' '' '' '' 'Azimuth is measured relative to transverse axis and is positive clockwise when viewed from above' 'Azimuth is measured relative to transverse axis and is positive clockwise when viewed from above' 0
CSchemaHolder
7 'Post Insulator Connectivity' 3 1 1 0 0 0 0 0

0 'Post\nLabel\n' 'Post\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
1 'Structure\nAttach\n' 'Structure\nAttach\n' '%10s' '%16s' '' '' '' '' '' 0
2 'Tip\nLabel\n' 'Tip\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
3 'Property\nSet\n' 'Property\nSet\n' '%9s' '%39s' '' '' '' '' '' 0
4 'Azimuth\n\n\n%m' 'Azimuth\n\n\n%m' '%8lg' '%8lg' '' '' '' 'Azimuth is measured relative to transverse axis and is positive clockwise when viewed from above' 'Azimuth is measured relative to transverse axis and is positive clockwise when viewed from above' 0
5 'Brace\nAttach\n' 'Brace\nAttach\n' '%7s' '%16s' '' '' '' 'If this is a braced post, select the brace attachment joint here' 'If this is a braced post, select the brace attachment joint here' 0
6 'Min. Required\nVertical Load\n(uplift)\n%m' 'Min. Required\nVertical Load\n(uplift)\n%m' '%14s' '%14s' '' '' '' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 0
CSchemaHolder
13 'Steel Pole Connectivity' 4 1 1 0 0 0 0 0

0 'Pole\nLabel' 'Pole\nLabel' '%8s' '%8s' '' '' '' 'Enter a name to identify this pole' 'Enter a name to identify this pole' 0
1 'Tip\nJoint' 'Tip\nJoint' '%6s' '%16s' '' '' '' 'Enter either the origin and end joints of this pole or the x,y,z coords of its base and its x,y inclination angles' 'Enter either the origin and end joints of this pole or the x,y,z coords of its base and its x,y inclination angles' 0
2 'Base\nJoint' 'Base\nJoint' '%6s' '%16s' '' '' '' 'Enter either the origin and end joints of this pole or the x,y,z coords of its base and its x,y inclination angles' 'Enter either the origin and end joints of this pole or the x,y,z coords of its base and its x,y inclination angles' 0
3 'X of\nBase\n%m' 'X of\nBase\n%m' '%5lg' '%10lg' '' '' '' 'Enter X coordinate of base if did not locate pole by origin and end joints' 'Enter X coordinate of base if did not locate pole by origin and end joints' 0
4 'Y of\nBase\n%m' 'Y of\nBase\n%m' '%5lg' '%10lg' '' '' '' 'Enter Y coordinate of base if did not locate pole by origin and end joints' 'Enter Y coordinate of base if did not locate pole by origin and end joints' 0
5 'Z of\nBase\n%m' 'Z of\nBase\n%m' '%5lg' '%10lg' '' '' '' 'Enter Z coordinate of base (ground level, normally 0.0) if did not locate pole by origin and end joints' 'Enter Z coordinate of base (ground level, normally 0.0) if did not locate pole by origin and end joints' 0
6 'Inclin.\nAbout X\n%m' 'Inclin.\nAbout X\n%m' '%8lg' '%10lg' '' '' '' 'Enter inclination about X axis if did not locate pole by origin and end joints' 'Enter inclination about X axis if did not locate pole by origin and end joints' 0
7 'Inclin.\nAbout Y\n%m' 'Inclin.\nAbout Y\n%m' '%8lg' '%10lg' '' '' '' 'Enter inclination about Y axis if did not locate pole by origin and end joints' 'Enter inclination about Y axis if did not locate pole by origin and end joints' 0
8 'Property\nSet' 'Property\nSet' '%9s' '%21s' '' '' '' 'Select the property set this pole should use (property sets defined under the components menu)' 'Select the property set this pole should use (property sets defined under the components menu)' 0
9 'Attach.\nLabels' 'Attach.\nLabels' '%10s' '%10s' '' '' '' '' '' 0
10 'Base\nConnect' 'Base\nConnect' '%9s' '%9s' '' '' '' '' '' 0
11 'Embed %%\nOverride' 'Embed %%\nOverride' '%9.2lf' '%9.3lf' '' '' '' 'For a directly embedded pole enter the percent of the pole to embed: the constant embedment will be added to this (this overrides the embedment length specified in components)' 'For a directly embedded pole enter the percent of the pole to embed: the constant embedment will be added to this (this overrides the embedment length specified in components)' 0
12 'Embed C.\nOverride\n%m' 'Embed C.\nOverride\n%m' '%9lg' '%10lg' '' '' '' 'For a directly embedded pole enter the length of the pole to embed: the percentage embedded will be added to this (this overrides the embedment length specified in components)' 'For a directly embedded pole enter the length of the pole to embed: the percentage embedded will be added to this (this overrides the embedment length specified in components)' 0
CSchemaHolder
19 'Steel Pole Properties' 14 1 1 0 0 0 0 0

0 'Steel Pole\nProperty\nLabel' 'Steel Pole\nProperty\nLabel' '%11s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Length\n\n\n%m' 'Length\n\n\n%m' '%9.5lf' '%9.2lf' '' '' '' 'Length is calculated automatically based on the number and length of tubes (see the Tubes column to the right)' 'Length is calculated automatically based on the number and length of tubes (see the Tubes column to the right)' 0
3 'Default\nEmbedded\nLength\n%m' 'Default\nEmbedded\nLength\n%m' '%9.4lg' '%12lg' '' '' '' 'Enter the default length below ground: this can be overridden in general data.' 'Enter the default length below ground: this can be overridden in general data.' 0
4 'Base\nPlate\n\n' 'Base\nPlate\n\n' '%6s' '%6s' '' '' '' '' '' 0
5 'Shape\n\n\n' 'Shape\n\n\n' '%8s' '%8s' '' '' '' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 0
6 'Tip\nDiameter\n\n%m' 'Tip\nDiameter\n\n%m' '%10.6lg' '%12lg' '' '' '' 'Outside diameter at tip (measured flat to flat except for 18 sided).  Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Outside diameter at tip (measured flat to flat except for 18-sided).  Note: You only need to enter two of tip diameter, base diameter, and taper. The third will be calculated' 0
7 'Base\nDiameter\n\n%m' 'Base\nDiameter\n\n%m' '%10.6lg' '%12lg' '' '' '' 'Outside diameter at base (measured flat to flat except for 18 sided).  Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Outside diameter at base (measured flat to flat except for 18-sided).  Note: You only need to enter two of tip diameter, base diameter, and taper. The third will be calculated' 0
8 'Taper\n\n\n%m' 'Taper\n\n\n%m' '%8.6lg' '%12lg' '' '' '' 'Tube taper.  Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Tube taper.  Note: You only need to enter two of tip diameter, base diameter, and taper. The third will be calculated' 0
9 'Default\nDrag\nCoef.\n' 'Default\nDrag\nCoef.\n' '%8.4lg' '%12lg' '' '' '' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using TIA/EIA 222 in which case you must enter 0 to have it calculated automatically)' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using TIA/EIA 222 in which case you must enter 0 to have it calculated automatically)' 0
10 'Tubes\n\n\n' 'Tubes\n\n\n' '%9s' '%9s' '' '' '' '' '' 0
11 'Modulus of\nElasticity\nOverride\n%m' 'Modulus of\nElasticity\nOverride\n%m' '%11.6lg' '%12lg' '' '' '' 'Enter a value here to override the default elasticity for steel if you are using a different material ' 'Enter a value here to override the default elasticity for steel if you are using a different material ' 0
12 'Weight\nDensity\nOverride\n%m' 'Weight\nDensity\nOverride\n%m' '%10.6lg' '%12lg' '' '' '' 'Enter a value here to override the default weight density for steel if you are using a different material' 'Enter a value here to override the default weight density for steel if you are using a different material' 0
13 'Shape\nAt\nBase\n' 'Shape\nAt\nBase\n' '%8s' '%8s' '' '' '' 'Optional shape to use at the base of the pole if your pole has two different shapes' 'Optional shape to use at the base of the pole if your pole has two different shapes' 0
14 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%9s' '%19s' '' '' '' 'If calculated need distance from tip and ultimate transverse and longitudinal loads at that point' 'If calculated need distance from tip and ultimate transverse and longitudinal loads at that point' 0
15 'Distance\nFrom\nTip\n%m' 'Distance\nFrom\nTip\n%m' '%9.3lf' '%9.3lf' '' '' '' 'Enter the distance from the tip where the ultimate loads are specified.' 'Enter the distance from the tip where the ultimate loads are specified.' 0
16 'Ultimate\nTrans.\nLoad\n%m' 'Ultimate\nTrans.\nLoad\n%m' '%9.4lf' '%9.4lf' '' '' '' '' '' 0
17 'Ultimate\nLong.\nLoad\n%m' 'Ultimate\nLong.\nLoad\n%m' '%9.4lf' '%9.4lf' '' '' '' '' '' 0
18 'Texture' 'Texture' '%8s' '%17s' '' '' '' '' '' 0
CSchemaHolder
15 'Mast Properties' 3 1 1 0 0 0 0 0

0 'Mast\nProperty\nLabel' 'Mast\nProperty\nLabel' '%9s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber\n' 'Stock\nNumber\n' '%7s' '%21s' '' '' '' '' '' 0
2 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.4lg' '%10.8lg' '' '' '' '' '' 0
3 'Effective\nWidth\n\n%m' 'Effective\nWidth\n\n%m' '%10.4lg' '%10.8lg' '' '' '' '' '' 0
4 'Gross\nArea\n\n%m' 'Gross\nArea\n\n%m' '%6.4lg' '%10.8lg' '' '' '' '' '' 0
5 'Moment\nof\nInertia Ix\n%m' 'Moment\nof\nInertia Ix\n%m' '%11.4lg' '%10.8lg' '' '' '' '' '' 0
6 'Torsional\nConstant\n\n%m' 'Torsional\nConstant\n\n%m' '%10.4lg' '%10.8lg' '' '' '' '' '' 0
7 'Shear\nArea\nX\n%m' 'Shear\nArea\nX\n%m' '%6.4lg' '%10.8lg' '' '' '' '' '' 0
8 'Weight\nDensity\n\n%m' 'Weight\nDensity\n\n%m' '%10.4lg' '%10.8lg' '' '' '' '' '' 0
9 'Wind\nWidth\n\n%m' 'Wind\nWidth\n\n%m' '%5.4lg' '%10.8lg' '' '' '' '' '' 0
10 'Drag\nCoef.' 'Drag\nCoef.' '%6.4lg' '%10.8lg' '' '' '' '' '' 0
11 'Comp.\nCapacity\n\n%m' 'Comp.\nCapacity\n\n%m' '%9.4lg' '%10.8lg' '' '' '' '' '' 0
12 'Shear\nCapacity\n\n%m' 'Shear\nCapacity\n\n%m' '%9.4lg' '%10.8lg' '' '' '' '' '' 0
13 'Bending\nCapacity\nComp.\n%m' 'Bending\nCapacity\nComp.\n%m' '%9.4lg' '%10.8lg' '' '' '' '' '' 0
14 'Bending\nCapacity\nTension\n%m' 'Bending\nCapacity\nTension\n%m' '%9.4lg' '%10.8lg' '' '' '' '' '' 0
CSchemaHolder
14 'Wood Pole Properties' 10 1 1 0 0 0 0 0

0 'Wood Pole\nProperty\nLabel' 'Wood Pole\nProperty\nLabel' '%10s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Pole\nSpecies\n' 'Pole\nSpecies\n' '%8s' '%21s' '' '' '' '' '' 0
3 'Pole\nClass' 'Pole\nClass' '%8s' '%8s' '' '' '' '' '' 0
4 'Length\n\n\n%m' 'Length\n\n\n%m' '%7.2lf' '%9.4lf' '' '' '' 'Enter the total length of the pole' 'Enter the total length of the pole' 0
5 'Tip\nCircum.\n\n%m' 'Tip\nCircum.\n\n%m' '%8.4lg' '%12lg' '' '' '' 'Outside Circumference at tip. If pole specified by circumferences you cannot enter diameters' 'Outside Circumference at tip. If pole specified by circumferences you cannot enter diameters' 0
6 'Circum.\nAt Dist.\nFrom Butt\n%m' 'Circum.\nAt Dist.\nFrom Butt\n%m' '%10.4lg' '%12lg' '' '' '' 'Outside Circumference at specified distance from butt. If pole specified by circumferences you cannot enter diameters' 'Outside Circumference at specified distance from butt. If pole specified by circumferences you cannot enter diameters' 0
7 'Tip\nDiameter\n\n%m' 'Tip\nDiameter\n\n%m' '%9.4lg' '%12lg' '' '' '' 'Outside diameter at tip. If pole specified by diameters you cannot enter circumferences' 'Outside diameter at tip. If pole specified by diameters you cannot enter circumferences' 0
8 'Base\nDiameter\n\n%m' 'Base\nDiameter\n\n%m' '%9.4lg' '%12lg' '' '' '' 'Outside diameter at butt. If pole specified by diameters you cannot enter circumferences' 'Outside diameter at butt. If pole specified by diameters you cannot enter circumferences' 0
9 'Default\nEmbedded\nLength\n%m' 'Default\nEmbedded\nLength\n%m' '%9.4lg' '%12lg' '' '' '' 'Enter the default length below ground: this can be overridden in general data.' 'Enter the default length below ground: this can be overridden in general data.' 0
10 'Default\nDrag\nCoef.\n' 'Default\nDrag\nCoef.\n' '%8.4lg' '%12lg' '' '' '' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using TIA/EIA 222 in which case you must enter 0 to have it calculated automatically)' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using TIA/EIA 222 in which case you must enter 0 to have it calculated automatically)' 0
11 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%19s' '%19s' '' '' '' 'If calculated need distance from tip and ultimate load at that point' 'If calculated need distance from tip and ultimate load at that point' 0
12 'Distance\nFrom\nTip\n%m' 'Distance\nFrom\nTip\n%m' '%9.3lf' '%9.3lf' '' '' '' 'Enter the distance from the tip where the ultimate loads are specified.' 'Enter the distance from the tip where the ultimate loads are specified.' 0
13 'Ultimate\nLoad\n\n%m' 'Ultimate\nLoad\n\n%m' '%9.4lf' '%9.4lf' '' '' '' '' '' 0
CSchemaHolder
24 'Concrete Pole Properties' 9 1 1 0 0 0 0 0

0 'Concrete Pole\nProperty\nLabel' 'Concrete Pole\nProperty\nLabel' '%14s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Class\n' 'Class\n' '%8s' '%8s' '' '' '' '' '' 0
3 'Length\n\n\n%m' 'Length\n\n\n%m' '%7.2lf' '%12lg' '' '' '' 'Enter length of the pole' 'Enter length of the pole' 0
4 'Default\nEmbedded\nLength\n%m' 'Default\nEmbedded\nLength\n%m' '%9.4lg' '%12lg' '' '' '' 'Enter the default length below ground: this can be overridden in general data.' 'Enter the default length below ground: this can be overridden in general data.' 0
5 'Shape\n\n\n' 'Shape\n\n\n' '%7s' '%7s' '' '' '' '' '' 0
6 'Tip\nDiameter\nOr Width\n%m' 'Tip\nDiameter\nOr Width\n%m' '%9.4lg' '%12lg' '' '' '' 'Outside diameter (width for rectangular shape) at tip. Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Outside diameter (width for rectangular shape) at tip. Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 0
7 'Base\nDiameter\nOr Width\n%m' 'Base\nDiameter\nOr Width\n%m' '%9.4lg' '%12lg' '' '' '' 'Outside diameter (width for rectangular shape) at base. Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Outside diameter (width for rectangular shape) at base. Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 0
8 'Outside\nTaper\n\n%m' 'Outside\nTaper\n\n%m' '%8.4lg' '%12lg' '' '' '' 'Pole taper. Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Pole taper. Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 0
9 'Tip\nDepth\n\n%m' 'Tip\nDepth\n\n%m' '%6.4lg' '%12lg' '' '' '' 'Outside depth at tip.  This is optional: if not entered then the program will use tip diameter' 'Outside depth at tip.  This is optional: if not entered then the program will use tip diameter' 0
10 'Base\nDepth\n\n%m' 'Base\nDepth\n\n%m' '%6.4lg' '%12lg' '' '' '' 'Outside depth at base.  This is optional: if not entered then the program will use base diameter' 'Outside depth at base.  This is optional: if not entered then the program will use base diameter' 0
11 'Tip\nThickness\n\n%m' 'Tip\nThickness\n\n%m' '%10.4lg' '%12lg' '' '' '' 'Enter 0.0 for thickness if pole is solid' 'Enter 0.0 for thickness if pole is solid' 0
12 'Base\nThickness\n\n%m' 'Base\nThickness\n\n%m' '%10.4lg' '%12lg' '' '' '' 'Enter 0.0 for thickness if pole is solid' 'Enter 0.0 for thickness if pole is solid' 0
13 'Default\nDrag\nCoef.\n' 'Default\nDrag\nCoef.\n' '%8.4lg' '%12lg' '' '' '' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using TIA/EIA 222 in which case you must enter 0 to have it calculated automatically)' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using TIA/EIA 222 in which case you must enter 0 to have it calculated automatically)' 0
14 'Equivalent\nElasticity\nUnCracked\n%m' 'Equivalent\nElasticity\nUnCracked\n%m' '%11.4lg' '%12lg' '' '' '' '' '' 0
15 'Equivalent\nElasticity\nCracked\n%m' 'Equivalent\nElasticity\nCracked\n%m' '%11.4lg' '%12lg' '' '' '' '' '' 0
16 'Density\n\n\n%m' 'Density\n\n\n%m' '%11.4lg' '%12lg' '' '' '' '' '' 0
17 'Strength\nDefinition\n\n' 'Strength\nDefinition\n\n' '%19s' '%19s' '' '' '' 'Strength type to use if Moment Capacity Diagram you only need to fill in the Moment Capacity Diagram in the last column otherwise fill in the next four columns' 'Strength type to use if Moment Capacity Diagram you only need to fill in the Moment Capacity Diagram in the last column otherwise fill in the next four columns' 0
18 'Load\nDistance\nBelow Top\n%m' 'Load\nDistance\nBelow Top\n%m' '%10.4lg' '%12lg' '' '' '' 'Distance below pole top of load defining pole capacity' 'Distance below pole top of load defining pole capacity' 0
19 'Max. Zero\nTension\nLoad\n%m' 'Max. Zero\nTension\nLoad\n%m' '%10.4lg' '%12lg' '' '' '' 'Maximum load before tension stress appears in pole' 'Maximum load before tension stress appears in pole' 0
20 'Max. First\nCrack\nLoad\n%m' 'Max. First\nCrack\nLoad\n%m' '%11.4lg' '%12lg' '' '' '' 'Maximum load before first crack occurs in pole' 'Maximum load before first crack occurs in pole' 0
21 'Max.\nUltimate\nTran. Load\n%m' 'Max.\nUltimate\nTran. Load\n%m' '%11.4lg' '%12lg' '' '' '' 'Maximum transverse load before pole fails' 'Maximum transverse load before pole fails' 0
22 'Max.\nUltimate\nLong. Load\n%m' 'Max.\nUltimate\nLong. Load\n%m' '%11.4lg' '%12lg' '' '' '' 'Maximum longitudinal load before pole fails' 'Maximum longitudinal load before pole fails' 0
23 'Moment\nCapacity\nDiagram\n' 'Moment\nCapacity\nDiagram\n' '%9s' '%18s' '' '' '' '' '' 0
CSchemaHolder
6 'Vang Connectivity' 7 1 1 0 0 0 0 0

0 'Vang\nLabel\n' 'Vang\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
1 'Attach\nLabel\n' 'Attach\nLabel\n' '%8s' '%16s' '' '' '' '' '' 0
2 'Tip\nLabel\n' 'Tip\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
3 'Azimuth\n\n%m' 'Azimuth\n\n%m' '%8.5lg' '%8.5lg' '' '' '' 'Enter the azimuth relative to the transverse axis for vertical elements or relative to down for horizontal elements.' 'Enter the azimuth relative to the transverse axis for vertical elements or relative to down for horizontal elements.' 0
4 'Length\n\n%m' 'Length\n\n%m' '%8.5lg' '%8.5lg' '' '' '' 'Enter the length from the element center that you want the vang to stick out' 'Enter the length from the element center that you want the vang to stick out' 0
5 'Measured\nRelative To\n' 'Measured\nRelative To\n' '%12s' '%12s' '' '' '' 'Select FACE if length is measured from the face of the element, select CENTER if it is measured from the center of the element.' 'Select FACE if length is measured from the face of the element, select CENTER if it is measured from the center of the element.' 0
CSchemaHolder
10 'Cable Properties' 6 1 1 0 0 0 0 0

0 'Label' 'Label' '%6s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%21s' '%21s' '' '' '' '' '' 0
2 'Area\n\n\n%m' 'Area\n\n\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
3 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.4lg' '%10lg' '' '' '' '' '' 0
4 'Diameter\n\n\n%m' 'Diameter\n\n\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
5 'Unit\nWeight\n\n%m' 'Unit\nWeight\n\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
6 'Drag\nCoef.\n\n' 'Drag\nCoef.\n\n' '%6.4lg' '%10lg' '' '' '' '' '' 0
7 'Thermal\nExpansion\nCoeff.\n%m' 'Thermal\nExpansion\nCoeff.\n%m' '%11.4lg' '%10lg' '' '' '' '' '' 0
8 'Ultimate\nTension\n\n%m' 'Ultimate\nTension\n\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
9 'Allowable\n%% of\nUltimate' 'Allowable\n%% of\nUltimate' '%10.4lg' '%10lg' '' '' '' 'This column is only present for legacy reasons.  We recommend you enter 100% and use the Strength Factor for Guys and Cables in Loads/Vector Loads instead.' 'This column is only present for legacy reasons.  We recommend you enter 100% and use the Strength Factor for Guys and Cables in Loads/Vector Loads instead.' 0
CSchemaHolder
21 'Brace Properties' 6 1 1 0 0 0 0 0

0 'Brace\nProperty\nLabel' 'Brace\nProperty\nLabel' '%9s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Cross\nSection\nArea\n%m' 'Cross\nSection\nArea\n%m' '%8.4lg' '%10.6lg' '' '' '' '' '' 0
3 'Length\n\n\n%m' 'Length\n\n\n%m' '%7.4lg' '%10.6lg' '' '' '' 'If length is not entered, the calculated strength check must be used' 'If length is not entered, the calculated strength check must be used' 0
4 'Depth\n\n\n%m' 'Depth\n\n\n%m' '%6.4lg' '%10.6lg' '' '' '' '' '' 0
5 'Width\n\n\n%m' 'Width\n\n\n%m' '%6.4lg' '%10.6lg' '' '' '' 'Width is optional and is only used for display - if not entered program assumes width equals cross section area divided by depth' 'Width is optional and is only used for display - if not entered program assumes width equals cross section area divided by depth' 0
6 'Weight\n\n\n%m' 'Weight\n\n\n%m' '%7.4lg' '%10.6lg' '' '' '' 'Weight should only be entered if length has been' 'Weight should only be entered if length has been' 0
7 'Unit Wt.\n(If Length\nUnknown)\n%m' 'Unit Wt.\n(If Length\nUnknown)\n%m' '%10.4lg' '%10.6lg' '' '' '' 'Enter unit weight when do not know length of brace' 'Enter unit weight when do not know length of brace' 0
8 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.6lg' '%10.6lg' '' '' '' '' '' 0
9 'Drag\nCoef.\n\n' 'Drag\nCoef.\n\n' '%6.4lg' '%10.6lg' '' '' '' '' '' 0
10 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%11s' '%12s' '' '' '' 'If calculated need net area, allowable stress, X and Z moments of inertia and X and Z unbraced length ratios.  If nominal need tension and compression capacities' 'If calculated need net area, allowable stress, X and Z moments of inertia and X and Z unbraced length ratios.  If nominal need tension and compression capacities' 0
11 'Use\nSteel\nS.F.\n' 'Use\nSteel\nS.F.\n' '%6s' '%6s' '' '' '' 'If yes, will select strength factor from `SF for Steel...` instead of `SF for Braces` column in Loads/Vector Loads and Loads/Wire Loads' 'If yes, will select strength factor from `SF for Steel...` instead of `SF for Braces` column in Loads/Vector Loads and Loads/Wire Loads' 0
12 'Tension\nCapacity\n\n%m' 'Tension\nCapacity\n\n%m' '%9.5lg' '%10.6lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
13 'Compres.\nCapacity\n\n%m' 'Compres.\nCapacity\n\n%m' '%9.5lg' '%10.6lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
14 'Net\nArea\n\n%m' 'Net\nArea\n\n%m' '%7.4lg' '%10.6lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
15 'Design\nNormal\nStress\n%m' 'Design\nNormal\nStress\n%m' '%7.4lg' '%10.6lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
16 'X-Moment\nOf\nInertia\n%m' 'X-Moment\nOf\nInertia\n%m' '%9.4lg' '%10.6lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
17 'Z-Moment\nOf\nInertia\n%m' 'Z-Moment\nOf\nInertia\n%m' '%9.4lg' '%10.6lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
18 'Unbraced\nLength\nRatio-X\n' 'Unbraced\nLength\nRatio-X\n' '%9.4lg' '%10.6lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
19 'Unbraced\nLength\nRatio-Z\n' 'Unbraced\nLength\nRatio-Z\n' '%9.4lg' '%10.6lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
20 'Texture\n\n\n' 'Texture\n\n\n' '%8s' '%17s' '' '' '' '' '' 0
CSchemaHolder
21 'Davit Properties' 6 1 1 0 0 0 0 0

0 'Davit\nProperty\nLabel' 'Davit\nProperty\nLabel' '%9s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Cross\nSection\nArea\n%m' 'Cross\nSection\nArea\n%m' '%9.4lg' '%12.10lg' '' '' '' '' '' 0
3 'X\nInertia\n\n%m' 'X\nInertia\n\n%m' '%8.4lg' '%12.10lg' '' '' '' '' '' 0
4 'Z\nInertia\n\n%m' 'Z\nInertia\n\n%m' '%8.4lg' '%12.10lg' '' '' '' '' '' 0
5 'Weight\n\n\n%m' 'Weight\n\n\n%m' '%7.4lg' '%12.10lg' '' '' '' '' '' 0
6 'Depth\n\n\n%m' 'Depth\n\n\n%m' '%6.4lg' '%12.10lg' '' '' '' '' '' 0
7 'Width\n\n\n%m' 'Width\n\n\n%m' '%6.4lg' '%12.10lg' '' '' '' 'Width is used for display and bolt hole area deductions - if not entered program assumes width equals cross section area divided by depth' 'Width is used for display and bolt hole area deductions - if not entered program assumes width equals cross section area divided by depth' 0
8 'Drag\nCoef.\n\n' 'Drag\nCoef.\n\n' '%6.4lg' '%12.10lg' '' '' '' '' '' 0
9 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.6lg' '%12.10lg' '' '' '' '' '' 0
10 'Geometry\n\n\n' 'Geometry\n\n\n' '%9s' '%9s' '' '' '' '' '' 0
11 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%11s' '%19s' '' '' '' 'If calculated need design normal stress and X and Z section moduli.  If nominal need tension, compression, vertical and longitudinal capacities' 'If calculated need design normal stress and X and Z section moduli.  If nominal need tension, compression, vertical and longitudinal capacities' 0
12 'Use\nSteel\nS.F.\n' 'Use\nSteel\nS.F.\n' '%6s' '%6s' '' '' '' 'If yes, will select strength factor from `SF for Steel...` instead of `SF for Non Tubular Arms` column in Loads/Vector Loads and Loads/Wire Loads' 'If yes, will select strength factor from `SF for Steel...` instead of `SF for Non Tubular Arms` column in Loads/Vector Loads and Loads/Wire Loads' 0
13 'Vertical\nCapacity\n\n%m' 'Vertical\nCapacity\n\n%m' '%9.5lg' '%12.10lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
14 'Tension\nCapacity\n\n%m' 'Tension\nCapacity\n\n%m' '%9.5lg' '%12.10lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
15 'Compres.\nCapacity\n\n%m' 'Compres.\nCapacity\n\n%m' '%9.5lg' '%12.10lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
16 'Long.\nCapacity\n\n%m' 'Long.\nCapacity\n\n%m' '%9.5lg' '%12.10lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
17 'Design\nNormal\nStress\n%m' 'Design\nNormal\nStress\n%m' '%7.4lg' '%12.10lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
18 'X\nSection\nModulus\n%m' 'X\nSection\nModulus\n%m' '%8.4lg' '%12.10lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
19 'Z\nSection\nModulus\n%m' 'Z\nSection\nModulus\n%m' '%8.4lg' '%12.10lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
20 'Texture\n\n\n' 'Texture\n\n\n' '%8s' '%17s' '' '' '' '' '' 0
CSchemaHolder
19 'Tubular Davit Properties' 9 1 1 0 0 0 0 0

0 'Davit\nProperty\nLabel' 'Davit\nProperty\nLabel' '%9s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Steel\nShape\n\n' 'Steel\nShape\n\n' '%7s' '%7s' '' '' '' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 0
3 'Thickness\n\n\n%m' 'Thickness\n\n\n%m' '%10.4lg' '%12.8lg' '' '' '' '' '' 0
4 'Base\nDiameter\nor Depth\n%m' 'Base\nDiameter\nor Depth\n%m' '%9.4lg' '%12.8lg' '' '' '' 'Outside diameter at base (measured flat to flat).  Enter only two of tip diameter, base diameter and taper.  The third will be calculated.' 'Outside diameter at base (measured flat to flat).  Enter only two of tip diameter, base diameter and taper.  The third will be calculated.' 0
5 'Tip\nDiameter\nor Depth\n%m' 'Tip\nDiameter\nor Depth\n%m' '%9.4lg' '%12.8lg' '' '' '' 'Outside diameter at tip (measured flat to flat).  Enter only two of tip diameter, base diameter and taper.  The third will be calculated.' 'Outside diameter at tip (measured flat to flat).  Enter only two of tip diameter, base diameter and taper.  The third will be calculated.' 0
6 'Taper\n\n\n%m' 'Taper\n\n\n%m' '%8.4lg' '%12.8lg' '' '' '' 'Pole taper.  Enter only two of tip diameter, base diameter and taper.  The third will be calculated.' 'Pole taper.  Enter only two of tip diameter, base diameter and taper.  The third will be calculated.' 0
7 'Drag\nCoef.\n\n' 'Drag\nCoef.\n\n' '%6.4lg' '%12.8lg' '' '' '' '' '' 0
8 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.6lg' '%12.8lg' '' '' '' '' '' 0
9 'Geometry\n\n\n' 'Geometry\n\n\n' '%9s' '%9s' '' '' '' '' '' 0
10 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%11s' '%19s' '' '' '' 'If calculated need yield stress, if nominal need values for Vert. Trans. and Long. capacities' 'If calculated need yield stress, if nominal need values for Vert. Trans. and Long. capacities' 0
11 'Vertical\nCapacity\n\n%m' 'Vertical\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
12 'Tension\nCapacity\n\n%m' 'Tension\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
13 'Compres.\nCapacity\n\n%m' 'Compres.\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
14 'Long.\nCapacity\n\n%m' 'Long.\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
15 'Yield\nStress\n\n%m' 'Yield\nStress\n\n%m' '%7.4lg' '%12.8lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
16 'Weight\nDensity\nOverride\n%m' 'Weight\nDensity\nOverride\n%m' '%10.6lg' '%12.8lg' '' '' '' 'Enter a value here to override the default weight density for steel if you are using a different material' 'Enter a value here to override the default weight density for steel if you are using a different material' 0
17 'Steel\nShape\nAt End\n' 'Steel\nShape\nAt End\n' '%7s' '%7s' '' '' '' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 0
18 'Texture\n\n\n' 'Texture\n\n\n' '%8s' '%17s' '' '' '' '' '' 0
CSchemaHolder
10 'Equipment Library' 10 1 1 0 0 0 0 0

0 'Equipment\nProperty Label' 'Equipment\nProperty Label' '%15s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Weight\n\n%m' 'Weight\n\n%m' '%7.1lf' '%12.6lg' '' '' '' '' '' 0
3 'Wind\nArea\n%m' 'Wind\nArea\n%m' '%7.2lf' '%12.6lg' '' '' '' '' '' 0
4 'Ice\nArea\n%m' 'Ice\nArea\n%m' '%7.2lf' '%12.6lg' '' '' '' 'Enter the area exposed to ice for ice load cases (used for calculation of ice vertical load)' 'Enter the area exposed to ice for ice load cases (used for calculation of ice vertical load)' 0
5 'Shape or\nEIA Antenna Type' 'Shape or\nEIA Antenna Type' '%17s' '%28s' '' '' '' 'Select Circle or Square for a discrete appurtenance or an antenna type for loads calculations as per 222-F Annex B or 222-G Annex C - MaxCA overrides the wind incidence angle with the one that produces Max CA' 'Select Circle or Square for a discrete appurtenance or an antenna type for loads calculations as per 222-F Annex B or 222-G Annex C - MaxCA overrides the wind incidence angle with the one that produces Max CA' 0
6 'Drag\nCoef.' 'Drag\nCoef.' '%6.2lf' '%12.6lg' '' '' '' 'Enter the shape factor for this piece of equipment (will be used to multiply the wind area' 'Enter the shape factor for this piece of equipment (will be used to multiply the wind area' 0
7 'Diameter\n\n%m' 'Diameter\n\n%m' '%9.2lf' '%12.6lg' '' '' '' 'Enter the diameter of the equipment cross section (used for drawing and computing the perimeter for additional wind area due to ice)' 'Enter the diameter of the equipment cross section (used for drawing and computing the perimeter for additional wind area due to ice)' 0
8 'Height\n\n%m' 'Height\n\n%m' '%7.2lf' '%12.6lg' '' '' '' 'Enter the height of the equipment (can be used to compute the perimeter for additional wind area due to ice)' 'Enter the height of the equipment (can be used to compute the perimeter for additional wind area due to ice)' 0
9 'Vertical\nOffset\n%m' 'Vertical\nOffset\n%m' '%9.2lf' '%12.6lg' '' '' '' 'Enter the distance from middle the equipment should be attached at (+ moves up, - moves down): this is only used for drawing' 'Enter the distance from middle the equipment should be attached at (+ moves up, - moves down): this is only used for drawing' 0
CSchemaHolder
28 'X-Arm Properties' 13 1 1 0 0 0 0 0

0 'Cross Arm\nProperty\nLabel' 'Cross Arm\nProperty\nLabel' '%10s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Cross\nSection\nArea\n%m' 'Cross\nSection\nArea\n%m' '%8.4lg' '%12.8lg' '' '' '' '' '' 0
3 'X\nInertia\n\n%m' 'X\nInertia\n\n%m' '%8.4lg' '%12.8lg' '' '' '' '' '' 0
4 'Z\nInertia\n\n%m' 'Z\nInertia\n\n%m' '%8.4lg' '%12.8lg' '' '' '' '' '' 0
5 'Weight\n\n\n%m' 'Weight\n\n\n%m' '%7.4lg' '%12.8lg' '' '' '' '' '' 0
6 'Depth\n\n\n%m' 'Depth\n\n\n%m' '%6.4lg' '%12.8lg' '' '' '' '' '' 0
7 'Width\n\n\n%m' 'Width\n\n\n%m' '%6.4lg' '%12.8lg' '' '' '' 'Width is used for display and bolt hole area deductions - if not entered program assumes width equals cross section area divided by depth' 'Width is used for display and bolt hole area deductions - if not entered program assumes width equals cross section area divided by depth' 0
8 'Length\n\n\n%m' 'Length\n\n\n%m' '%7.4lg' '%12.5lg' '' '' '' '' '' 0
9 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.6lg' '%12.8lg' '' '' '' '' '' 0
10 'Drag\nCoef.\n\n' 'Drag\nCoef.\n\n' '%6.4lg' '%12.8lg' '' '' '' '' '' 0
11 'Geometry\n\n\n' 'Geometry\n\n\n' '%9s' '%9s' '' '' '' '' '' 0
12 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%11s' '%19s' '' '' '' 'If calculated need design normal stress and X and Z section moduli.  If nominal need vertical, transverse and longitudinal capacities' 'If calculated need design normal stress and X and Z section moduli.  If nominal need vertical, transverse and longitudinal capacities' 0
13 'Use\nSteel\nS.F.\n' 'Use\nSteel\nS.F.\n' '%6s' '%6s' '' '' '' 'If yes, will select strength factor from `SF for Steel...` instead of `SF for Non Tubular Arms` column in Loads/Vector Loads and Loads/Wire Loads' 'If yes, will select strength factor from `SF for Steel...` instead of `SF for Non Tubular Arms` column in Loads/Vector Loads and Loads/Wire Loads' 0
14 'Vertical\nCapacity\n\n%m' 'Vertical\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
15 'Trans.\nCapacity\n\n%m' 'Trans.\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
16 'Long.\nCapacity\n\n%m' 'Long.\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
17 'Design\nNormal\nStress\n%m' 'Design\nNormal\nStress\n%m' '%7.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
18 'X\nSection\nModulus\n%m' 'X\nSection\nModulus\n%m' '%8.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
19 'Z\nSection\nModulus\n%m' 'Z\nSection\nModulus\n%m' '%8.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
20 'Texture\n\n\n' 'Texture\n\n\n' '%8s' '%17s' '' '' '' '' '' 0
21 'Long\nLeg\n\n%m' 'Long\nLeg\n\n%m' '%6.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
22 'Short\nLeg\n\n%m' 'Short\nLeg\n\n%m' '%6.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
23 'Thick.\n\n\n%m' 'Thick.\n\n\n%m' '%7.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
24 'BetaW\n\n\n%m' 'BetaW\n\n\n%m' '%6.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
25 'Radius of Gyration\nX\n\n%m' 'Radius of Gyration\nX\n\n%m' '%7.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
26 'Radius of Gyration\nY\n\n%m' 'Radius of Gyration\nY\n\n%m' '%7.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
27 'Radius of Gyration\nZ\n\n%m' 'Radius of Gyration\nZ\n\n%m' '%7.4lg' '%12.5lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
CSchemaHolder
16 'Tubular X-Arm Properties' 9 1 1 0 0 0 0 0

0 'Cross Arm\nProperty\nLabel' 'Cross Arm\nProperty\nLabel' '%10s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Steel\nShape\n\n' 'Steel\nShape\n\n' '%7s' '%7s' '' '' '' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 'Steel shapes are specified as a number of sides and F for Flat in transverse plane or T for Tip in transverse plane' 0
3 'Thickness\n\n\n%m' 'Thickness\n\n\n%m' '%10.4lg' '%12.8lg' '' '' '' '' '' 0
4 'Diameter\nor Depth\n\n%m' 'Diameter\nor Depth\n\n%m' '%9.4lg' '%12.8lg' '' '' '' '' '' 0
5 'Length\n\n\n%m' 'Length\n\n\n%m' '%7.5lg' '%12.8lg' '' '' '' '' '' 0
6 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.6lg' '%12.8lg' '' '' '' '' '' 0
7 'Drag\nCoef.\n\n' 'Drag\nCoef.\n\n' '%6.4lg' '%12.8lg' '' '' '' '' '' 0
8 'Geometry\n\n\n' 'Geometry\n\n\n' '%9s' '%9s' '' '' '' '' '' 0
9 'Strength\nCheck\nType\n' 'Strength\nCheck\nType\n' '%11s' '%19s' '' '' '' 'If calculated need yield stress, if nominal need values for Vert. Trans. and Long. capacities' 'If calculated need yield stress, if nominal need values for Vert. Trans. and Long. capacities' 0
10 'Vertical\nCapacity\n\n%m' 'Vertical\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
11 'Trans.\nCapacity\n\n%m' 'Trans.\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
12 'Long.\nCapacity\n\n%m' 'Long.\nCapacity\n\n%m' '%9.5lg' '%12.8lg' '' '' '' 'Needed for nominal strength check' 'Needed for nominal strength check' 0
13 'Steel\nYield\nStress\n%m' 'Steel\nYield\nStress\n%m' '%7.4lg' '%12.8lg' '' '' '' 'Needed for calculated strength check' 'Needed for calculated strength check' 0
14 'Weight\nDensity\nOverride\n%m' 'Weight\nDensity\nOverride\n%m' '%10.6lg' '%12.8lg' '' '' '' 'Enter a value here to override the default weight density for steel if you are using a different material' 'Enter a value here to override the default weight density for steel if you are using a different material' 0
15 'Texture\n\n\n' 'Texture\n\n\n' '%8s' '%17s' '' '' '' '' '' 0
CSchemaHolder
10 'Equilibrium Joint Positions and Rotations' 5 1 1 0 0 0 0 0

0 'Joint\nLabel' 'Joint\nLabel' '%6s' '%16s' '' '' '' '' '' 0
1 'X-Displ\n%m' 'X-Displ\n%m' '%8.4lg' '%10.4lg' '' '' '' '' '' 0
2 'Y-Displ\n%m' 'Y-Displ\n%m' '%8.4lg' '%10.4lg' '' '' '' '' '' 0
3 'Z-Displ\n%m' 'Z-Displ\n%m' '%8.4lg' '%10.4lg' '' '' '' '' '' 0
4 'X-Rot\n%m' 'X-Rot\n%m' '%6.04lf' '%10.4lg' '' '' '' '' '' 0
5 'Y-Rot\n%m' 'Y-Rot\n%m' '%6.04lf' '%10.4lg' '' '' '' '' '' 0
6 'Z-Rot\n%m' 'Z-Rot\n%m' '%6.04lf' '%10.4lg' '' '' '' '' '' 0
7 'X-Pos\n%m' 'X-Pos\n%m' '%6.4lg' '%10.4lg' '' '' '' '' '' 0
8 'Y-Pos\n%m' 'Y-Pos\n%m' '%6.4lg' '%10.4lg' '' '' '' '' '' 0
9 'Z-Pos\n%m' 'Z-Pos\n%m' '%6.4lg' '%10.4lg' '' '' '' '' '' 0
CSchemaHolder
16 'Steel Tubes Properties' 20 1 1 0 0 0 0 0

0 'Pole\nProperty' 'Pole\nProperty' '%9s' '%9s' '' '' '' '' '' 0
1 'Tube\nNo.' 'Tube\nNo.' '%5d' '%5d' '' '' '' '' '' 0
2 'Length\n\n%m' 'Length\n\n%m' '%9.5lg' '%12.6lg' '' '' '' 'Length of this tube' 'Length of this tube' 0
3 'Thickness\n\n%m' 'Thickness\n\n%m' '%10.6lg' '%12.6lg' '' '' '' 'Wall thickness of this tube' 'Wall thickness of this tube' 0
4 'Lap\nLength\n%m' 'Lap\nLength\n%m' '%7.4lf' '%12.6lg' '' '' '' 'Enter 0 if butt welded or the actual overlap.  No overlap should be entered for the bottom tube' 'Enter 0 if butt welded or the actual overlap.  No overlap should be entered for the bottom tube' 0
5 'Lap\nFactor' 'Lap\nFactor' '%7.3lf' '%12.6lg' '' '' '' 'Enter 0 if butt welded or the overlap as a multiple of the inner diameter (typically 1.5).  No overlap should be entered for the bottom tube' 'Enter 0 if butt welded or the overlap as a multiple of the inner diameter (typically 1.5).  No overlap should be entered for the bottom tube' 0
6 'Lap Gap or\nButt Offset\n%m' 'Lap Gap or\nButt Offset\n%m' '%12.5lf' '%12.6lg' '' '' '' 'For spliced tubes enter a tolerance for galvanizing thickness or slop here that will reduce the diameter of the inner tube (this is a radial quantity), for Butt Welded poles enter offset from inner diameter of bottom tube' 'For spliced tubes enter a tolerance for galvanizing thickness or slop here that will reduce the diameter of the inner tube (this is a radial quantity), for Butt Welded poles enter offset from inner diameter of bottom tube' 0
7 'Yield\nStress\n%m' 'Yield\nStress\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
8 'Moment Cap.\nOverride\n%m' 'Moment Cap.\nOverride\n%m' '%12.3lf' '%12.3lf' '' '' '' 'Input a moment capacity if you want to override the code calculated one for this tube (only applicable if Strength Check Type is Calculated)' 'Input a moment capacity if you want to override the code calculated one for this tube (only applicable if Strength Check Type is Calculated)' 0
9 'Tube\nWeight\n%m' 'Tube\nWeight\n%m' '%7.0lf' '%8.0lf' '' '' '' '' '' 0
10 'Center of\nGravity\n%m' 'Center of\nGravity\n%m' '%10.2lf' '%10.2lf' '' '' '' '' '' 0
11 'Calculated\nTaper\n%m' 'Calculated\nTaper\n%m' '%11.5lf' '%11.5lf' '' '' '' 'Tube taper.  Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 'Tube taper.  Note: You only need to enter two of tip diameter, base diameter and taper the third will be calculated' 0
12 'Tube Top\nDiameter\n%m' 'Tube Top\nDiameter\n%m' '%10.6lf' '%9.2lf' '' '' '' '' '' 0
13 'Tube Bot.\nDiameter\n%m' 'Tube Bot.\nDiameter\n%m' '%10.6lf' '%10.2lf' '' '' '' '' '' 0
14 '1.5x Diam.\nLap Length\n%m' '1.5x Diam.\nLap Length\n%m' '%11.3lf' '%11.3lf' '' '' '' '' '' 0
15 'Actual\nOverlap\n%m' 'Actual\nOverlap\n%m' '%8.3lf' '%8.3lf' '' '' '' '' '' 0
CSchemaHolder
3 'Relative Attachment Labels for' 10 1 1 0 0 0 0 0

0 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
1 'Distance From\nOrigin/Top Joint\n%m' 'Distance From\nOrigin/Top Joint\n%m' '%18.2lf' '%18.8lg' '' '' '' '' '' 0
2 'Global Z\nof Attach\n%m' 'Global Z\nof Attach\n%m' '%18.2lf' '%18.8lg' '' '' '' 'Enter either the global z of where the joint should be located on the pole or the distance in the previous column' 'Enter either the global z of where the joint should be located on the pole or the distance in the previous column' 0
CSchemaHolder
14 'Pole Steel Properties' 15 1 1 0 0 0 0 0

0 'Element\nLabel\n' 'Element\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Joint\nPosition\n' 'Joint\nPosition\n' '%9s' '%20s' '' '' '' '' '' 0
3 'Rel.\nDist.\n%m' 'Rel.\nDist.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
4 'Outer\nDiam.\n%m' 'Outer\nDiam.\n%m' '%6.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Area\n\n%m' 'Area\n\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'T-Moment\nInertia\n%m' 'T-Moment\nInertia\n%m' '%9.2lf' '%10.4lg' '' '' '' '' '' 0
7 'L-Moment\nInertia\n%m' 'L-Moment\nInertia\n%m' '%9.2lf' '%10.4lg' '' '' '' '' '' 0
8 'D/t\n\n' 'D/t\n\n' '%4.2lf' '%6.2lf' '' '' '' '' '' 0
9 'W/t\nMax.\n' 'W/t\nMax.\n' '%5.1lf' '%6.2lf' '' '' '' '' '' 0
10 'Fy\n\n%m' 'Fy\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
11 'Fa\nMin.\n%m' 'Fa\nMin.\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
12 'T-Moment\nCapacity\n%m' 'T-Moment\nCapacity\n%m' '%9.2lf' '%6.2lf' '' '' '' '' '' 0
13 'L-Moment\nCapacity\n%m' 'L-Moment\nCapacity\n%m' '%9.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
3 'Intermediate Joints' 3 1 1 0 0 0 0 0

0 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%8s' '' '' '' '' '' 0
1 'Horz.\nOffset\n%m' 'Horz.\nOffset\n%m' '%7.5lg' '%10.5lg' '' '' '' '' '' 0
2 'Vert.\nOffset\n%m' 'Vert.\nOffset\n%m' '%7.5lg' '%10.5lg' '' '' '' '' '' 0
CSchemaHolder
14 'Tubular Davit Arm Steel Properties' 15 1 1 0 0 0 0 0

0 'Element\nLabel\n' 'Element\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Joint\nPosition\n' 'Joint\nPosition\n' '%9s' '%12s' '' '' '' '' '' 0
3 'Rel.\nDist.\n%m' 'Rel.\nDist.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
4 'Outer\nDiam.\n%m' 'Outer\nDiam.\n%m' '%6.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Area\n\n%m' 'Area\n\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'V-Moment\nInertia\n%m' 'V-Moment\nInertia\n%m' '%9.2lf' '%10.4lg' '' '' '' '' '' 0
7 'H-Moment\nInertia\n%m' 'H-Moment\nInertia\n%m' '%9.2lf' '%10.4lg' '' '' '' '' '' 0
8 'D/t\n\n' 'D/t\n\n' '%4.2lf' '%6.2lf' '' '' '' '' '' 0
9 'W/t\nMax.\n' 'W/t\nMax.\n' '%5.1lf' '%6.2lf' '' '' '' '' '' 0
10 'Fy\n\n%m' 'Fy\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
11 'Fa\nMin.\n%m' 'Fa\nMin.\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
12 'V-Moment\nCapacity\n%m' 'V-Moment\nCapacity\n%m' '%9.2lf' '%6.2lf' '' '' '' '' '' 0
13 'H-Moment\nCapacity\n%m' 'H-Moment\nCapacity\n%m' '%9.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
11 'Strain Properties' 7 1 1 0 0 0 0 0

0 'Label' 'Label' '%6s' '%39s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%39s' '' '' '' '' '' 0
2 'Length\n\n%m' 'Length\n\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
3 'Weight\n\n%m' 'Weight\n\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
4 'Wind\nArea\n%m' 'Wind\nArea\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
5 'Tension\nCapacity\n%m' 'Tension\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
6 'Energized\nLength\n%m' 'Energized\nLength\n%m' '%10.5lg' '%10.5lg' '' '' '' 'Energized length along the insulator - only used in PLS-CADD with the structure clearances command' 'Energized length along the insulator - only used in PLS-CADD with the structure clearances command' 0
7 'Energized\nDiameter\n%m' 'Energized\nDiameter\n%m' '%10.5lg' '%10.5lg' '' '' '' 'Energized radius around the length above - only used in PLS-CADD with the structure clearances command' 'Energized radius around the length above - only used in PLS-CADD with the structure clearances command' 0
8 'Hardware\nCapacity\n%m' 'Hardware\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
9 'Notes' 'Notes' '%6s' '%6s' '' '' '' '' '' 0
10 'Draw' 'Draw' '%5s' '%9s' '' '' '' '' '' 0
CSchemaHolder
6 'Strain Insulator Connectivity' 6 1 1 0 0 0 0 0

0 'Strain\nLabel\n' 'Strain\nLabel\n' '%7s' '%16s' '' '' '' '' '' 0
1 'Structure\nAttach\n' 'Structure\nAttach\n' '%10s' '%16s' '' '' '' '' '' 0
2 'Tip\nLabel\n' 'Tip\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
3 'Property\nSet\n' 'Property\nSet\n' '%9s' '%39s' '' '' '' '' '' 0
4 'Azimuth\n\n\n%m' 'Azimuth\n\n\n%m' '%8lg' '%8lg' '' '' '' 'This is used solely to determine the undeformed position of the strain insulator.' 'This is used solely to determine the undeformed position of the strain insulator.' 0
5 'Min. Required\nVertical Load\n(uplift)\n%m' 'Min. Required\nVertical Load\n(uplift)\n%m' '%14s' '%14s' '' '' '' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 0
CSchemaHolder
15 'Post Properties' 9 1 1 0 0 0 0 0

0 'Label\n\n' 'Label\n\n' '%6s' '%39s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%39s' '' '' '' '' '' 0
2 'Has\nBrace\n' 'Has\nBrace\n' '%6s' '%6s' '' '' '' '' '' 0
3 'Horz.\nProjection\n%m' 'Horz.\nProjection\n%m' '%11.4lg' '%10lg' '' '' '' '' '' 0
4 'Vert.\nProjection\n%m' 'Vert.\nProjection\n%m' '%11.4lg' '%10lg' '' '' '' 'For posts a positive vertical projection will move the tip down' 'For posts a positive vertical projection will move the tip down' 0
5 'Weight\n\n%m' 'Weight\n\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
6 'Interaction\nCapacity\n' 'Interaction\nCapacity\n' '%12s' '%12s' '' '' '' '' '' 0
7 'Cantilever\nCapacity\n%m' 'Cantilever\nCapacity\n%m' '%11.4lg' '%10lg' '' '' '' 'Enter cantilever capacity (capacity perpendicular to post regardless of orientation) or 0 to skip this check.' 'Enter cantilever capacity (capacity perpendicular to post regardless of orientation) or 0 to skip this check.' 0
8 'Tension\nCapacity\n%m' 'Tension\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' 'Enter axial tension capacity or 0 to skip this check.' 'Enter axial tension capacity or 0 to skip this check.' 0
9 'Comp.\nCapacity\n%m' 'Comp.\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' 'Enter axial compression capacity or 0 to skip this check.' 'Enter axial compression capacity or 0 to skip this check.' 0
10 'Long.\nStiffness\n%m' 'Long.\nStiffness\n%m' '%10.6lg' '%10lg' '' '' '' 'If you have stiffness values from a manufacturers catalog, enter them here; otherwise leave blank and it will default to 10000 lbs/ft' 'If you have stiffness values from a manufacturers catalog, enter them here; otherwise leave blank and it will default to 10000 lbs/ft' 0
11 'Vert.\nStiffness\n%m' 'Vert.\nStiffness\n%m' '%10.6lg' '%10lg' '' '' '' 'If you have stiffness values from a manufacturers catalog, enter them here; otherwise leave blank and it will default to 10000 lbs/ft (100 lbs/ft if braced)' 'If you have stiffness values from a manufacturers catalog, enter them here; otherwise leave blank and it will default to 10000 lbs/ft (100 lbs/ft if braced)' 0
12 'Hardware\nCapacity\n%m' 'Hardware\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
13 'Notes' 'Notes' '%6s' '%6s' '' '' '' '' '' 0
14 'Draw' 'Draw' '%5s' '%9s' '' '' '' '' '' 0
CSchemaHolder
3 'Interaction Capacity' 4 1 1 0 0 0 0 0

0 'Longitudinal\nCapacity\n%m' 'Longitudinal\nCapacity\n%m' '%14.1lf' '%14.4lf' '' '' '' 'Longitudinal is in the horizontal plane and perpendicular to the element' 'Longitudinal is in the horizontal plane and perpendicular to the element' 0
1 'Transverse\nCapacity\n%m' 'Transverse\nCapacity\n%m' '%12.1lf' '%12.4lf' '' '' '' 'Transverse is in the horizontal plane and in the direction of the element with positive tension and negative compression' 'Transverse is in the horizontal plane and in the direction of the element with positive tension and negative compression' 0
2 'Vertical\nCapacity\n%m' 'Vertical\nCapacity\n%m' '%10.1lf' '%10.4lf' '' '' '' 'Vertical corresponds to global Z with uplift being negative (down is positive)' 'Vertical corresponds to global Z with uplift being negative (down is positive)' 0
CSchemaHolder
8 'PLS-CADD Link Cable Sets' 4 1 1 0 0 0 0 0

0 'Insulator\nLabel\n' 'Insulator\nLabel\n' '%10s' '%16s' '' '' '' '' '' 0
1 'Conductor\nAttach\nLabel' 'Conductor\nAttach\nLabel' '%10s' '%16s' '' '' '' '' '' 0
2 'Insulator\nType\n' 'Insulator\nType\n' '%11s' '%11s' '' '' '' '' '' 0
3 'Set\nNumber\n' 'Set\nNumber\n' '%7d' '%6d' '' '' '' 'Enter the set number for this insulator.  This number is what you will string to in PLS-CADD' 'Enter the set number for this insulator.  This number is what you will string to in PLS-CADD' 0
4 'Phase\nNumber\n' 'Phase\nNumber\n' '%7d' '%7d' '' '' '' 'Enter the phase number for this insulator (valid numbers are 1,2 or 3)' 'Enter the phase number for this insulator (valid numbers are 1,2 or 3)' 0
5 'Set\nDescription\n' 'Set\nDescription\n' '%12s' '%20s' '' '' '' 'Enter a description for this set, you will see this description when stringing in PLS-CADD.  You only need to do this for the first phase' 'Enter a description for this set, you will see this description when stringing in PLS-CADD.  You only need to do this for the first phase' 0
6 'Dead\nEnd\n' 'Dead\nEnd\n' '%5s' '%4s' '' '' '' 'Select "Yes" if this set can terminate a tension section (if a tension imbalance can exist at this set).  All phases in a set must have the same value: either "No" or "Yes"' 'Select "Yes" if this set can terminate a tension section (if a tension imbalance can exist at this set).  All phases in a set must have the same value: either "No" or "Yes"' 0
7 'Framing\nSource\n' 'Framing\nSource\n' '%8s' '%8s' '' '' '' '' '' 0
CSchemaHolder
4 'Material List' 1 1 1 0 0 0 0 0

0 'Stock\nNumber' 'Stock\nNumber' '%7s' '%7s' '' '' '' '' '' 0
1 'Item\nDescription' 'Item\nDescription' '%12s' '%12s' '' '' '' '' '' 0
2 'Quantity' 'Quantity' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
3 'Unit\nof\nMeasure' 'Unit\nof\nMeasure' '%8s' '%8s' '' '' '' '' '' 0
CSchemaHolder
25 'Vector Load Cases' 113 1 1 0 0 0 0 0

0 'Load Case\nDescription' 'Load Case\nDescription' '%12s' '%21s' '' '' '' '' '' 0
1 'Dead\nLoad\nFactor' 'Dead\nLoad\nFactor' '%7.4lf' '%10lg' '' '' '' 'Dead load factor does not apply to cables, guys, or t-only 2-part insulators' 'Dead load factor does not apply to cables, guys, or t-only 2-part insulators' 0
2 'Wind\nArea\nFactor' 'Wind\nArea\nFactor' '%7.4lf' '%7lg' '' '' '' 'Wind load factor is applied to the input pressure' 'Wind load factor is applied to the input pressure' 0
3 'SF for\nSteel Poles\nTubular Arms\nand Towers' 'SF for\nSteel Poles\nTubular Arms\nand Towers' '%13.5lf' '%13lg' '' '' '' 'Strength factor to be used for steel poles, tubular steel arms, lattice towers and FRP poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for steel poles, tubular steel arms, lattice towers and FRP poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
4 'SF for\nWood\nPoles' 'SF for\nWood\nPoles' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for wood poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for wood poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
5 'SF for\nConc.\nUlt.' 'SF for\nConc.\nUlt.' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for ultimate concrete poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for ultimate concrete poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
6 'SF for\nConc.\nFirst\nCrack' 'SF for\nConc.\nFirst\nCrack' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for cracked concrete poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for cracked concrete poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
7 'SF for\nConc.\nZero\nTens.' 'SF for\nConc.\nZero\nTens.' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for zero tension concrete poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for zero tension concrete poles: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
8 'SF for\nGuys\nand\nCables' 'SF for\nGuys\nand\nCables' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for guys: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for guys: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
9 'SF for\nNon\nTubular\nArms' 'SF for\nNon\nTubular\nArms' '%8.4lf' '%8lg' '' '' '' 'Strength factor to be used for arms: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for arms: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
10 'SF for\nBraces' 'SF for\nBraces' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for braces: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for braces: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
11 'SF for\nInsuls.' 'SF for\nInsuls.' '%8.4lf' '%8lg' '' '' '' 'Strength factor to be used for insulators: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for insulators: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
12 'SF for\nHardware' 'SF for\nHardware' '%9.4lf' '%8lg' '' '' '' 'Strength factor to be used for insulator hardware: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for insulator hardware: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
13 'SF For\nFound.' 'SF For\nFound.' '%7.4lf' '%8lg' '' '' '' 'Strength factor to be used for foundation capacity: 0 will prevent this component from being checked, 0.5 will halve its strength' 'Strength factor to be used for foundation capacity: 0 will prevent this component from being checked, 0.5 will halve its strength' 0
-1 'SF For\nClimbing' 'SF For\nClimbing' '%9.4lf' '%8lg' '' '' '' 'Strength factor to be used for climbing checks: 0 will prevent climbing from being checked for this load case' 'Strength factor to be used for climbing checks: 0 will prevent climbing from being checked for this load case' 0
14 'Point\nLoads' 'Point\nLoads' '%9s' '%8s' '' '' '' 'Click here to enter concentrated loads' 'Click here to enter concentrated loads' 0
15 'Wind/Ice\nModel\n' 'Wind/Ice\nModel\n' '%14s' '%25s' '' '' '' 'Select Standard for traditional drag-area wind loading' 'Select Standard for traditional drag-area wind loading' 0
16 'Trans.\nWind\nPressure\n%m' 'Trans.\nWind\nPressure\n%m' '%9.4lg' '%11.4lg' '' '' '' '' '' 0
17 'Longit.\nWind\nPressure\n%m' 'Longit.\nWind\nPressure\n%m' '%9.4lg' '%11.4lg' '' '' '' '' '' 0
18 'Ice\nThick.\n\n%m' 'Ice\nThick.\n\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
19 'Ice\nDensity\n\n%m' 'Ice\nDensity\n\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
20 'Temperature\n\n\n%m' 'Temperature\n\n\n%m' '%12.1lf' '%12.1lf' '' '' '' 'Temperature used for adjusting the properties of Fiber Reinforced Polymer pole elements' 'Temperature used for adjusting the properties of Fiber Reinforced Polymer pole elements' 0
21 'Pole\nDeflection\nCheck' 'Pole\nDeflection\nCheck' '%11s' '%17s' '' '' '' 'Enter the pole deflection check to use' 'Enter the pole deflection check to use' 0
22 'Pole\nDeflection\nLimit\n%% or %m' 'Pole\nDeflection\nLimit\n%% or %m' '%11.6lg' '%11.6lg' '' '' '' '' '' 0
-1 'Joint\nDispl.' 'Joint\nDispl.' '%8s' '%21s' '' '' '' 'Joint displacements are a research tool and should only be used by a qualified user.' 'Joint displacements are a research tool and should only be used by a qualified user.' 0
CSchemaHolder
5 'Point Loads' 4 1 1 0 0 0 0 0

0 'Joint\nLabel' 'Joint\nLabel' '%6s' '%16s' '' '' '' '' '' 0
1 'Vertical\nLoad\n%m' 'Vertical\nLoad\n%m' '%9lg' '%10g' '' '' '' 'Vertical is along the Z axis (positive is down, negative is uplift)' 'Vertical is along the Z axis (positive is down, negative is uplift)' 0
2 'Transverse\nLoad\n%m' 'Transverse\nLoad\n%m' '%11lg' '%10g' '' '' '' 'Transverse is along the Y axis (positive to the right as you face the structure)' 'Transverse is along the Y axis (positive to the right as you face the structure)' 0
3 'Longitudinal\nLoad\n%m' 'Longitudinal\nLoad\n%m' '%13lg' '%10g' '' '' '' 'Longitudinal is along the X axis (positive coming out of the screen)' 'Longitudinal is along the X axis (positive coming out of the screen)' 0
4 'Load\nComment' 'Load\nComment' '%8s' '%16s' '' '' '' '' '' 0
CSchemaHolder
17 'Detailed Pole Loading Data' 6 1 1 0 0 0 0 0

0 'Pole\nLabel\n' 'Pole\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
1 'Top\nJoint\n' 'Top\nJoint\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Bottom\nJoint\n' 'Bottom\nJoint\n' '%7s' '%16s' '' '' '' '' '' 0
3 'Section\nTop\nZ\n%m' 'Section\nTop\nZ\n%m' '%8.2lf' '%12lg' '' '' '' '' '' 0
4 'Section\nBottom\nZ\n%m' 'Section\nBottom\nZ\n%m' '%8.2lf' '%12lg' '' '' '' '' '' 0
5 'Section\nAverage\nElevation\n%m' 'Section\nAverage\nElevation\n%m' '%10.2lf' '%12lg' '' '' '' '' '' 0
6 'Outer\nDiameter\n\n%m' 'Outer\nDiameter\n\n%m' '%9.3lf' '%12lg' '' '' '' '' '' 0
7 'Reynolds\nNumber' 'Reynolds\nNumber' '%9.3lg' '%12lg' '' '' '' '' '' 0
8 'Drag\nCoef.' 'Drag\nCoef.' '%6.3lf' '%12lg' '' '' '' '' '' 0
9 'Adjusted\nWind\nPressure\n%m' 'Adjusted\nWind\nPressure\n%m' '%9.2lf' '%12lg' '' '' '' '' '' 0
10 'Adjusted\nIce\nThickness\n%m' 'Adjusted\nIce\nThickness\n%m' '%10.2lf' '%12lg' '' '' '' '' '' 0
11 'Pole\nVert.\nLoad\n%m' 'Pole\nVert.\nLoad\n%m' '%7.2lf' '%12lg' '' '' '' '' '' 0
12 'Pole\nWind\nLoad\n%m' 'Pole\nWind\nLoad\n%m' '%6.2lf' '%12lg' '' '' '' '' '' 0
13 'Pole Ice\nVertical\nLoad\n%m' 'Pole Ice\nVertical\nLoad\n%m' '%9.2lf' '%12lg' '' '' '' '' '' 0
14 'Pole Ice\nWind\nLoad\n%m' 'Pole Ice\nWind\nLoad\n%m' '%9.2lf' '%12lg' '' '' '' '' '' 0
15 'Tran.\nWind\nLoad\n%m' 'Tran.\nWind\nLoad\n%m' '%6.2lf' '%12lg' '' '' '' '' '' 0
16 'Long.\nWind\nLoad\n%m' 'Long.\nWind\nLoad\n%m' '%6.2lf' '%12lg' '' '' '' '' '' 0
CSchemaHolder
19 'Joint Support Reactions' 14 1 1 0 0 0 0 0

0 'Joint\nLabel' 'Joint\nLabel' '%6s' '%16s' '' '' '' '' '' 0
1 'X\nForce\n%m' 'X\nForce\n%m' '%6.2lf' '%10lg' '' '' '' '' '' 0
2 'X\nUsage\n%%' 'X\nUsage\n%%' '%6.1lf' '%6.1lf' '' '' '' '' '' 0
3 'Y\nForce\n%m' 'Y\nForce\n%m' '%6.2lf' '%10lg' '' '' '' '' '' 0
4 'Y\nUsage\n%%' 'Y\nUsage\n%%' '%6.1lf' '%6.1lf' '' '' '' '' '' 0
5 'H-Shear\nUsage\n%%' 'H-Shear\nUsage\n%%' '%8.1lf' '%8.1lf' '' '' '' '' '' 0
6 'Z\nForce\n%m' 'Z\nForce\n%m' '%7.2lf' '%10lg' '' '' '' '' '' 0
7 'Comp.\nUsage\n%%' 'Comp.\nUsage\n%%' '%6.1lf' '%9.1lf' '' '' '' '' '' 0
8 'Uplift\nUsage\n%%' 'Uplift\nUsage\n%%' '%7.1lf' '%9.1lf' '' '' '' '' '' 0
9 'Result.\nForce\n%m' 'Result.\nForce\n%m' '%8.2lf' '%11lg' '' '' '' '' '' 0
10 'Result.\nUsage\n%%' 'Result.\nUsage\n%%' '%8.1lf' '%10.1lf' '' '' '' '' '' 0
11 'X\nMoment\n%m' 'X\nMoment\n%m' '%7.2lf' '%10lg' '' '' '' '' '' 0
12 'X-M.\nUsage\n%%' 'X-M.\nUsage\n%%' '%6.1lf' '%7.1lf' '' '' '' '' '' 0
13 'Y\nMoment\n%m' 'Y\nMoment\n%m' '%7.1lf' '%10lg' '' '' '' '' '' 0
14 'Y-M.\nUsage\n%%' 'Y-M.\nUsage\n%%' '%6.1lf' '%7.1lf' '' '' '' '' '' 0
15 'H-Bend-M\nUsage\n%%' 'H-Bend-M\nUsage\n%%' '%9.1lf' '%9.1lf' '' '' '' '' '' 0
16 'Z\nMoment\n%m' 'Z\nMoment\n%m' '%7.2lf' '%10lg' '' '' '' '' '' 0
17 'Z-M.\nUsage\n%%' 'Z-M.\nUsage\n%%' '%6.1lf' '%7.1lf' '' '' '' '' '' 0
18 'Max.\nUsage\n%%' 'Max.\nUsage\n%%' '%6.1lf' '%7.1lf' '' '' '' '' '' 0
CSchemaHolder
20 'Detailed Steel Pole Usages' 14 1 1 0 0 0 0 0

0 'Element\nLabel\n' 'Element\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Joint\nPosition\n' 'Joint\nPosition\n' '%9s' '%8s' '' '' '' '' '' 0
3 'Rel.\nDist.\n%m' 'Rel.\nDist.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
4 'Trans.\nDefl.\n%m' 'Trans.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Long.\nDefl.\n%m' 'Long.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'Vert.\nDefl.\n%m' 'Vert.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
7 'Trans. Mom.\n(Local Mx)\n%m' 'Trans. Mom.\n(Local Mx)\n%m' '%12.2lf' '%12.2lf' '' '' '' '' '' 0
8 'Long. Mom.\n(Local My)\n%m' 'Long. Mom.\n(Local My)\n%m' '%12.2lf' '%12.2lf' '' '' '' '' '' 0
9 'Tors.\nMom.\n%m' 'Tors.\nMom.\n%m' '%6.1lf' '%6.2lf' '' '' '' '' '' 0
10 'Axial\nForce\n%m' 'Axial\nForce\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
11 'Tran.\nShear\n%m' 'Tran.\nShear\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
12 'Long.\nShear\n%m' 'Long.\nShear\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
13 'P/A\n\n%m' 'P/A\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
14 'M/S.\n\n%m' 'M/S.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
15 'V/Q.\n\n%m' 'V/Q.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
16 'T/R.\n\n%m' 'T/R.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
17 'Res.\n\n%m' 'Res.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
18 'Max.\nUsage\n%%' 'Max.\nUsage\n%%' '%6.1lf' '%6.2lf' '' '' '' '' '' 0
19 'At\nPt.\n' 'At\nPt.\n' '%4d' '%4d' '' '' '' '' '' 0
CSchemaHolder
20 'Detailed Tubular Davit Arm Usages' 14 1 1 0 0 0 0 0

0 'Element\nLabel\n' 'Element\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Joint\nPosition\n' 'Joint\nPosition\n' '%9s' '%8s' '' '' '' '' '' 0
3 'Rel.\nDist.\n%m' 'Rel.\nDist.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
4 'Trans.\nDefl.\n%m' 'Trans.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Long.\nDefl.\n%m' 'Long.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'Vert.\nDefl.\n%m' 'Vert.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
7 'Vert.\nMom.\n%m' 'Vert.\nMom.\n%m' '%12.2lf' '%12.2lf' '' '' '' '' '' 0
8 'Horz.\nMom.\n%m' 'Horz.\nMom.\n%m' '%12.2lf' '%12.2lf' '' '' '' '' '' 0
9 'Tors.\nMom.\n%m' 'Tors.\nMom.\n%m' '%6.1lf' '%6.2lf' '' '' '' '' '' 0
10 'Axial\nForce\n%m' 'Axial\nForce\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
11 'Vert.\nShear\n%m' 'Vert.\nShear\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
12 'Horz.\nShear\n%m' 'Horz.\nShear\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
13 'P/A\n\n%m' 'P/A\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
14 'M/S.\n\n%m' 'M/S.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
15 'V/Q.\n\n%m' 'V/Q.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
16 'T/R.\n\n%m' 'T/R.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
17 'Res.\n\n%m' 'Res.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
18 'Max.\nUsage\n%%' 'Max.\nUsage\n%%' '%6.1lf' '%6.2lf' '' '' '' '' '' 0
19 'At\nPt.\n' 'At\nPt.\n' '%4d' '%4d' '' '' '' '' '' 0
CSchemaHolder
9 'Summary of Strain Capacities and Usages' 4 1 1 0 0 0 0 0

0 'Strain\nLabel\n' 'Strain\nLabel\n' '%7s' '%16s' '' '' '' '' '' 0
1 'Tension\n\n\n%m' 'Tension\n\n\n%m' '%9.3lf' '%9.3lf' '' '' '' '' '' 0
2 'Input\nTension\nCapacity\n%m' 'Input\nTension\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
3 'Factored\nTension\nCapacity\n%m' 'Factored\nTension\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
4 'Tension\nUsage\n\n%%' 'Tension\nUsage\n\n%%' '%8.2lf' '%8.2lf' '' '' '' '' '' 0
5 'Input\nHardware\nCapacity\n%m' 'Input\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
6 'Factored\nHardware\nCapacity\n%m' 'Factored\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
7 'Hardware\nUsage\n\n%%' 'Hardware\nUsage\n\n%%' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
8 'Max.\nUsage\n\n%%' 'Max.\nUsage\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
20 'Summary of Post Capacities and Usages' 12 1 1 0 0 0 0 0

0 'Post\nLabel' 'Post\nLabel' '%6s' '%16s' '' '' '' '' '' 0
1 'Vertical\nForce\n\n%m' 'Vertical\nForce\n\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
2 'Tran.\nForce\n\n%m' 'Tran.\nForce\n\n%m' '%6.2lf' '%8.2lf' '' '' '' '' '' 0
3 'Long.\nForce\n\n%m' 'Long.\nForce\n\n%m' '%6.2lf' '%8.2lf' '' '' '' '' '' 0
4 'Cant.\nForce\n\n%m' 'Cant.\nForce\n\n%m' '%6.2lf' '%8.2lf' '' '' '' '' '' 0
5 'Axial\nForce\n\n%m' 'Axial\nForce\n\n%m' '%6.2lf' '%8.2lf' '' '' '' '' '' 0
6 'Vert.\nDown\nCapacity\n%m' 'Vert.\nDown\nCapacity\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
7 'Vert.\nUp\nCapacity\n%m' 'Vert.\nUp\nCapacity\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
8 'Trans.\nNeg.\nCapacity\n%m' 'Trans.\nNeg.\nCapacity\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
9 'Trans.\nPos.\nCapacity\n%m' 'Trans.\nPos.\nCapacity\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
10 'Long.\nCapacity\n\n%m' 'Long.\nCapacity\n\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
11 'Cant.\nCapacity\n\n%m' 'Cant.\nCapacity\n\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
12 'Comp.\nCapacity\n\n%m' 'Comp.\nCapacity\n\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
13 'Tens.\nCapacity\n\n%m' 'Tens.\nCapacity\n\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
14 'Insul.\nS.F.' 'Insul.\nS.F.' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
15 'Usage\n\n\n%%' 'Usage\n\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
16 'Input\nHardware\nCapacity\n%m' 'Input\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
17 'Factored\nHardware\nCapacity\n%m' 'Factored\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
18 'Hardware\nUsage\n\n%%' 'Hardware\nUsage\n\n%%' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
19 'Max.\nUsage\n\n%%' 'Max.\nUsage\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
6 'Summary of Steel Pole Usages' 3 1 1 0 0 0 0 0

0 'Steel Pole\nLabel' 'Steel Pole\nLabel' '%11s' '%16s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
3 'Height\nAGL %m' 'Height\nAGL %m' '%9.1lf' '9.1lf' '' '' '' '' '' 0
4 'Segment\nNumber' 'Segment\nNumber' '%8d' '%8d' '' '' '' '' '' 0
5 'Weight\n%m' 'Weight\n%m' '%7.1lf' '%9.1lf' '' '' '' '' '' 0
CSchemaHolder
6 'Summary of Tubular Davit Usages' 3 1 1 0 0 0 0 0

0 'Tubular Davit\nLabel' 'Tubular Davit\nLabel' '%14s' '%16s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
3 'Height\nAGL %m' 'Height\nAGL %m' '%9.1lf' '9.1lf' '' '' '' '' '' 0
4 'Segment\nNumber' 'Segment\nNumber' '%8d' '%8d' '' '' '' '' '' 0
5 'Weight\n%m' 'Weight\n%m' '%7.1lf' '%9.1lf' '' '' '' '' '' 0
CSchemaHolder
4 'Summary of Maximum Usages by Load Case' 2 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Element\nLabel' 'Element\nLabel' '%8s' '%16s' '' '' '' '' '' 0
3 'Element\nType' 'Element\nType' '%8s' '%19s' '' '' '' '' '' 0
CSchemaHolder
5 'Summary of Steel Pole Usages by Load Case' 2 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Steel Pole\nLabel' 'Steel Pole\nLabel' '%11s' '%16s' '' '' '' '' '' 0
3 'Height\nAGL %m' 'Height\nAGL %m' '%9.1lf' '9.1lf' '' '' '' '' '' 0
4 'Segment\nNumber' 'Segment\nNumber' '%8d' '%8d' '' '' '' '' '' 0
CSchemaHolder
5 'Summary of Tubular Davit Usages by Load Case' 2 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Tubular Davit\nLabel' 'Tubular Davit\nLabel' '%14s' '%16s' '' '' '' '' '' 0
3 'Height\nAGL %m' 'Height\nAGL %m' '%9.1lf' '9.1lf' '' '' '' '' '' 0
4 'Segment\nNumber' 'Segment\nNumber' '%8d' '%8d' '' '' '' '' '' 0
CSchemaHolder
5 'Summary of Insulator Usages' 2 1 1 0 0 0 0 0

0 'Insulator\nLabel' 'Insulator\nLabel' '%10s' '%16s' '' '' '' '' '' 0
1 'Insulator\nType' 'Insulator\nType' '%10s' '%12s' '' '' '' '' '' 0
2 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
3 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
4 'Weight\n%m' 'Weight\n%m' '%7.1lf' '%9.1lf' '' '' '' '' '' 0
CSchemaHolder
9 'Summary of Tip Deflections For All Load Cases' 5 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%20s' '' '' '' '' '' 0
1 'Joint\nLabel' 'Joint\nLabel' '%6s' '%16s' '' '' '' '' '' 0
2 'Long.\nDefl.\n%m' 'Long.\nDefl.\n%m' '%6.2lf' '%10.2lf' '' '' '' '' '' 0
3 'Tran.\nDefl.\n%m' 'Tran.\nDefl.\n%m' '%6.2lf' '%10.2lf' '' '' '' '' '' 0
4 'Vert.\nDefl.\n%m' 'Vert.\nDefl.\n%m' '%6.2lf' '%10.2lf' '' '' '' '' '' 0
5 'Resultant\nDefl.\n%m' 'Resultant\nDefl.\n%m' '%10.2lf' '%10.2lf' '' '' '' '' '' 0
6 'Long.\nRot.\n%m' 'Long.\nRot.\n%m' '%6.2lf' '%10.2lf' '' '' '' '' '' 0
7 'Tran.\nRot.\n%m' 'Tran.\nRot.\n%m' '%6.2lf' '%10.2lf' '' '' '' '' '' 0
8 'Twist\n\n%m' 'Twist\n\n%m' '%6.2lf' '%10.2lf' '' '' '' '' '' 0
CSchemaHolder
11 'Pole Deflection Usages For All Load Cases' 4 1 1 0 0 0 0 0

0 'Pole\nLabel\n' 'Pole\nLabel\n' '%6s' '%9s' '' '' '' '' '' 0
1 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
2 'Deflection\nCheck' 'Deflection\nCheck' '%11s' '%14s' '' '' '' '' '' 0
3 'Deflection\nLimit\n%%' 'Deflection\nLimit\n%%' '%11.2lf' '%11.2lf' '' '' '' '' '' 0
4 'Height\n\n%m' 'Height\n\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Length\n\n%m' 'Length\n\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'Tip\nDiameter\n%m' 'Tip\nDiameter\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
7 'Allowable\nDeflection\n%m' 'Allowable\nDeflection\n%m' '%11.2lf' '%11.2lf' '' '' '' '' '' 0
8 'Actual\nDeflection\n%m' 'Actual\nDeflection\n%m' '%11.2lf' '%11.2lf' '' '' '' '' '' 0
9 'Deflection From\nVertical Axis\n%m' 'Deflection From\nVertical Axis\n%m' '%16.2lf' '%16.2lf' '' '' '' '' '' 0
10 'Usage\n\n%%' 'Usage\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
8 'Loads At Insulator Attachments For All Load Cases' 4 1 1 0 0 0 0 0

0 'Load\nCase' 'Load\nCase' '%5s' '%23s' '' '' '' '' '' 0
1 'Insulator\nLabel' 'Insulator\nLabel' '%10s' '%16s' '' '' '' '' '' 0
2 'Insulator\nType' 'Insulator\nType' '%10s' '%12s' '' '' '' '' '' 0
3 'Structure\nAttach\nLabel' 'Structure\nAttach\nLabel' '%10s' '%16s' '' '' '' '' '' 0
4 'Structure\nAttach\nLoad X\n%m' 'Structure\nAttach\nLoad X\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
5 'Structure\nAttach\nLoad Y\n%m' 'Structure\nAttach\nLoad Y\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
6 'Structure\nAttach\nLoad Z\n%m' 'Structure\nAttach\nLoad Z\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
7 'Structure\nAttach\nLoad Res.\n%m' 'Structure\nAttach\nLoad Res.\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
CSchemaHolder
7 'Overturning Moments For User Input Concentrated Loads' 5 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%10s' '' '' '' '' '' 0
1 'Total\nTran.\nLoad\n%m' 'Total\nTran.\nLoad\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
2 'Total\nLong.\nLoad\n%m' 'Total\nLong.\nLoad\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
3 'Total\nVert.\nLoad\n%m' 'Total\nVert.\nLoad\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
4 'Transverse\nOverturning\nMoment\n%m' 'Transverse\nOverturning\nMoment\n%m' '%12.3lf' '%12.3lf' '' '' '' '' '' 0
5 'Longitudinal\nOverturning\nMoment\n%m' 'Longitudinal\nOverturning\nMoment\n%m' '%13.3lf' '%13.3lf' '' '' '' '' '' 0
6 'Torsional\nMoment\n\n%m' 'Torsional\nMoment\n\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
CSchemaHolder
7 'Foundation Design Forces For All Load Cases' 28 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%20s' '' '' '' '' '' 0
1 'Foundation\nDescription' 'Foundation\nDescription' '%12s' '%16s' '' '' '' '' '' 0
2 'Axial\nForce\n%m' 'Axial\nForce\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
3 'Shear\nForce\n%m' 'Shear\nForce\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
4 'Resultant\nForce\n%m' 'Resultant\nForce\n%m' '%10.2lf' '%9.2lf' '' '' '' '' '' 0
5 'Bending\nMoment\n%m' 'Bending\nMoment\n%m' '%8.2lf' '%9.2lf' '' '' '' '' '' 0
6 'Foundation\nUsage\n%%' 'Foundation\nUsage\n%%' '%11.2lf' '%7.2lf' '' '' '' '' '' 0
CSchemaHolder
11 'Summary of Joint Support Reactions For All Load Cases' 28 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%20s' '' '' '' '' '' 0
1 'Joint\nLabel' 'Joint\nLabel' '%6s' '%16s' '' '' '' '' '' 0
2 'Long.\nForce\n%m' 'Long.\nForce\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
3 'Tran.\nForce\n%m' 'Tran.\nForce\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
4 'Vert.\nForce\n%m' 'Vert.\nForce\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
5 'Shear\nForce\n%m' 'Shear\nForce\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
6 'Tran.\nMoment\n%m' 'Tran.\nMoment\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
7 'Long.\nMoment\n%m' 'Long.\nMoment\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
8 'Bending\nMoment\n%m' 'Bending\nMoment\n%m' '%8.2lf' '%9.2lf' '' '' '' '' '' 0
9 'Vert.\nMoment\n%m' 'Vert.\nMoment\n%m' '%7.2lf' '%9.2lf' '' '' '' '' '' 0
10 'Found.\nUsage\n%%' 'Found.\nUsage\n%%' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
CSchemaHolder
6 'Tubes Summary' 1 1 1 0 0 0 0 0

0 'Pole\nLabel\n' 'Pole\nLabel\n' '%6s' '%9s' '' '' '' '' '' 0
1 'Tube\nNum.' 'Tube\nNum.' '%6d' '%6d' '' '' '' '' '' 0
2 'Weight\n\n%m' 'Weight\n\n%m' '%8.0lf' '%8.0lf' '' '' '' '' '' 0
3 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
4 'Maximum\nUsage\n%%' 'Maximum\nUsage\n%%' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
5 'Resultant\nMoment\n%m' 'Resultant\nMoment\n%m' '%11.2lf' '%11.2lf' '' '' '' '' '' 0
CSchemaHolder
5 'Clamp Properties' 1 1 1 0 0 0 0 0

0 'Label' 'Label' '%6s' '%39s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%39s' '' '' '' '' '' 0
2 'Holding\nCapacity\n%m' 'Holding\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
3 'Hardware\nCapacity\n%m' 'Hardware\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
4 'Notes' 'Notes' '%6s' '%6s' '' '' '' '' '' 0
CSchemaHolder
4 'Clamp Insulator Connectivity' 3 1 1 0 0 0 0 0

0 'Clamp\nLabel\n\n' 'Clamp\nLabel\n\n' '%6s' '%16s' '' '' '' '' '' 0
1 'Structure\nAnd Tip\nAttach\n' 'Structure\nAnd Tip\nAttach\n' '%10s' '%16s' '' '' '' '' '' 0
2 'Property\nSet\n\n' 'Property\nSet\n\n' '%9s' '%39s' '' '' '' '' '' 0
3 'Min. Required\nVertical Load\n(uplift)\n%m' 'Min. Required\nVertical Load\n(uplift)\n%m' '%14s' '%14s' '' '' '' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 0
CSchemaHolder
9 'Summary of Clamp Capacities and Usages' 4 1 1 0 0 0 0 0

0 'Clamp\nLabel\n' 'Clamp\nLabel\n' '%7s' '%16s' '' '' '' '' '' 0
1 'Force\n\n\n%m' 'Force\n\n\n%m' '%6.3lf' '%8.3lf' '' '' '' '' '' 0
2 'Input\nHolding\nCapacity\n%m' 'Input\nHolding\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
3 'Factored\nHolding\nCapacity\n%m' 'Factored\nHolding\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
4 'Holding\nUsage\n\n%%' 'Holding\nUsage\n\n%%' '%8.2lf' '%8.2lf' '' '' '' '' '' 0
5 'Input\nHardware\nCapacity\n%m' 'Input\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
6 'Factored\nHardware\nCapacity\n%m' 'Factored\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
7 'Hardware\nUsage\n\n%%' 'Hardware\nUsage\n\n%%' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
8 'Max.\nUsage\n\n%%' 'Max.\nUsage\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
7 'Loading Tree' 1 1 1 0 0 0 0 0

0 'Load Case' 'Load Case' '%10s' '%10s' '' '' '' '' '' 0
1 'Joint\nLabel' 'Joint\nLabel' '%6s' '%6s' '' '' '' '' '' 0
2 'Vertical\nLoad\n%m' 'Vertical\nLoad\n%m' '%9.0lf' '%9.0lf' '' '' '' '' '' 0
3 'Transverse\nLoad\n%m' 'Transverse\nLoad\n%m' '%11.0lf' '%11.0lf' '' '' '' '' '' 0
4 'Longitudinal\nLoad\n%m' 'Longitudinal\nLoad\n%m' '%13.0lf' '%13.0lf' '' '' '' '' '' 0
5 'Transverse\nWind\n%m' 'Transverse\nWind\n%m' '%11.0lf' '%11.0lf' '' '' '' '' '' 0
6 'Longitudinal\nWind\n%m' 'Longitudinal\nWind\n%m' '%13.0lf' '%13.0lf' '' '' '' '' '' 0
CSchemaHolder
15 'Laminated Wood Pole Properties' 11 1 1 0 0 0 0 0

0 'Laminated Pole\nProperty\nLabel' 'Laminated Pole\nProperty\nLabel' '%15s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Pole\nType' 'Pole\nType' '%18s' '%18s' '' '' '' '' '' 0
3 'Length\n\n\n%m' 'Length\n\n\n%m' '%7.2lf' '%12lg' '' '' '' 'Enter length of the pole' 'Enter length of the pole' 0
4 'Default\nEmbedded\nLength\n%m' 'Default\nEmbedded\nLength\n%m' '%9.4lg' '%12lg' '' '' '' 'Enter the default length below ground: this can be overridden in general data.' 'Enter the default length below ground: this can be overridden in general data.' 0
5 'Taper\nStop Dist.\nFrom Butt\n%m' 'Taper\nStop Dist.\nFrom Butt\n%m' '%11.2lf' '%12lg' '' '' '' 'Enter the distance from the butt where the taper stops' 'Enter the distance from the butt where the taper stops' 0
6 'Trans.\nTip\nDim.\n%m' 'Trans.\nTip\nDim.\n%m' '%9.4lg' '%12lg' '' '' '' '' '' 0
7 'Long.\nTip\nDim.\n%m' 'Long.\nTip\nDim.\n%m' '%9.4lg' '%12lg' '' '' '' '' '' 0
8 'Trans.\nBase\nDim.\n%m' 'Trans.\nBase\nDim.\n%m' '%9.4lg' '%12lg' '' '' '' '' '' 0
9 'Long.\nBase\nDim.\n%m' 'Long.\nBase\nDim.\n%m' '%9.4lg' '%12lg' '' '' '' '' '' 0
10 'Default\nDrag\nCoef.\n' 'Default\nDrag\nCoef.\n' '%8.2lf' '%12lg' '' '' '' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using telecom loading in which case you must enter 0 to have it calculated automatically)' 'If you are using a code that specifies a drag coefficient that will override what you type here (unless using telecom loading in which case you must enter 0 to have it calculated automatically)' 0
11 'Modulus\nof\nElasticity\n%m' 'Modulus\nof\nElasticity\n%m' '%11.4lg' '%12lg' '' '' '' '' '' 0
12 'Density\n\n\n%m' 'Density\n\n\n%m' '%11.4lg' '%12lg' '' '' '' '' '' 0
13 'Trans.\nMOR\n\n%m' 'Trans.\nMOR\n\n%m' '%10.4lg' '%12lg' '' '' '' '' '' 0
14 'Long.\nMOR\n\n%m' 'Long.\nMOR\n\n%m' '%11.4lg' '%12lg' '' '' '' '' '' 0
CSchemaHolder
20 'CAN Library' 6 1 1 0 0 0 0 0

0 'CAN\nProperty Label' 'CAN\nProperty Label' '%15s' '%21s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%21s' '' '' '' '' '' 0
2 'Strength\nFactor\n\n' 'Strength\nFactor\n\n' '%12s' '%12s' '' '' '' '' '' 0
3 'Strength\nCheck\n\n' 'Strength\nCheck\n\n' '%21s' '%21s' '' '' '' '' '' 0
4 'Resultant\nCapacity\n\n%m' 'Resultant\nCapacity\n\n%m' '%10.3lf' '%12.6lg' '' '' '' '' '' 0
5 'Long.\nShear\nCap.\n%m' 'Long.\nShear\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
6 'Tran.\nShear\nCap.\n%m' 'Tran.\nShear\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
7 'Vert.\nShear\nCap.\n%m' 'Vert.\nShear\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
8 'Long.\nPos.\nCap.\n%m' 'Long.\nPos.\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
9 'Long.\nNeg.\nCap.\n%m' 'Long.\nNeg.\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
10 'Tran.\nPos.\nCap.\n%m' 'Tran.\nPos.\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
11 'Tran.\nNeg.\nCap.\n%m' 'Tran.\nNeg.\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
12 'Vert.\nPos.\nCap.\n%m' 'Vert.\nPos.\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
13 'Vert.\nNeg.\nCap.\n%m' 'Vert.\nNeg.\nCap.\n%m' '%6.3lf' '%12.6lg' '' '' '' '' '' 0
14 'M-Long.\nPos.\nCapacity\n%m' 'M-Long.\nPos.\nCapacity\n%m' '%9.3lf' '%12.6lg' '' '' '' '' '' 0
15 'M-Long.\nNeg.\nCapacity\n%m' 'M-Long.\nNeg.\nCapacity\n%m' '%9.3lf' '%12.6lg' '' '' '' '' '' 0
16 'M-Tran.\nPos.\nCapacity\n%m' 'M-Tran.\nPos.\nCapacity\n%m' '%9.3lf' '%12.6lg' '' '' '' '' '' 0
17 'M-Tran.\nNeg.\nCapacity\n%m' 'M-Tran.\nNeg.\nCapacity\n%m' '%9.3lf' '%12.6lg' '' '' '' '' '' 0
18 'M-Vert.\nPos.\nCapacity\n%m' 'M-Vert.\nPos.\nCapacity\n%m' '%9.3lf' '%12.6lg' '' '' '' '' '' 0
19 'M-Vert.\nNeg.\nCapacity\n%m' 'M-Vert.\nNeg.\nCapacity\n%m' '%9.3lf' '%12.6lg' '' '' '' '' '' 0
CSchemaHolder
11 'Joints Geometry' 8 1 1 0 0 0 0 0

0 'Joint\nLabel' 'Joint\nLabel' '%6s' '%14s' '' '' '' '' '' 0
2 'X Coord.\n%m' 'X Coord.\n%m' '%9.4lg' '%12.12lg' '' '' '' '' '' 0
3 'Y Coord.\n%m' 'Y Coord.\n%m' '%9.4lg' '%12.12lg' '' '' '' '' '' 0
4 'Z Coord.\n%m' 'Z Coord.\n%m' '%9.4lg' '%12.12lg' '' '' '' '' '' 0
5 'X Disp.\nRest.' 'X Disp.\nRest.' '%8s' '%10s' '' '' '' '' '' 0
6 'Y Disp.\nRest.' 'Y Disp.\nRest.' '%8s' '%10s' '' '' '' '' '' 0
7 'Z Disp.\nRest.' 'Z Disp.\nRest.' '%8s' '%10s' '' '' '' '' '' 0
8 'X Rot.\nRest.' 'X Rot.\nRest.' '%8s' '%10s' '' '' '' '' '' 0
9 'Y Rot.\nRest.' 'Y Rot.\nRest.' '%8s' '%10s' '' '' '' '' '' 0
10 'Z Rot.\nRest.' 'Z Rot.\nRest.' '%8s' '%10s' '' '' '' '' '' 0
1 'Symmetry\nCode' 'Symmetry\nCode' '%13s' '%14s' '' '' '' '' '' 0
CSchemaHolder
7 'Steel Tubes' 20 1 1 0 0 0 0 0

0 'Length\n\n%m' 'Length\n\n%m' '%7.6lg' '%12.6lg' '' '' '' 'Length of this tube' 'Length of this tube' 0
1 'Thickness\n\n%m' 'Thickness\n\n%m' '%10.6lg' '%12.6lg' '' '' '' 'Wall thickness of this tube' 'Wall thickness of this tube' 0
2 'Lap\nLength\n%m' 'Lap\nLength\n%m' '%7.3lf' '%12.6lg' '' '' '' 'Enter 0 if butt welded or the actual overlap.  No overlap should be entered for the bottom tube' 'Enter 0 if butt welded or the actual overlap.  No overlap should be entered for the bottom tube' 0
3 'Lap\nFactor' 'Lap\nFactor' '%7.3lf' '%12.6lg' '' '' '' 'Enter 0 if butt welded or the overlap as a multiple of the inner diameter (typically 1.5).  No overlap should be entered for the bottom tube' 'Enter 0 if butt welded or the overlap as a multiple of the inner diameter (typically 1.5).  No overlap should be entered for the bottom tube' 0
4 'Lap Gap or\nButt Offset\n%m' 'Lap Gap or\nButt Offset\n%m' '%12.3lf' '%12.6lg' '' '' '' 'For spliced tubes enter a tolerance for galvanizing thickness or slop here that will reduce the diameter of the inner tube (this is a radial quantity), for Butt Welded poles enter offset from inner diameter of bottom tube' 'For spliced tubes enter a tolerance for galvanizing thickness or slop here that will reduce the diameter of the inner tube (this is a radial quantity), for Butt Welded poles enter offset from inner diameter of bottom tube' 0
5 'Yield\nStress\n%m' 'Yield\nStress\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
6 'Moment Cap.\nOverride\n%m' 'Moment Cap.\nOverride\n%m' '%12.3lf' '%12.3lf' '' '' '' 'Input a moment capacity if you want to override the code calculated one for this tube (only applicable if Strength Check Type is Calculated)' 'Input a moment capacity if you want to override the code calculated one for this tube (only applicable if Strength Check Type is Calculated)' 0
CSchemaHolder
16 'Suspension Properties' 5 1 1 0 0 0 0 0

0 'Label' 'Label' '%6s' '%39s' '' '' '' '' '' 0
1 'Stock\nNumber' 'Stock\nNumber' '%7s' '%39s' '' '' '' '' '' 0
2 'Length\n\n%m' 'Length\n\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
3 'Weight\n\n%m' 'Weight\n\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
4 'Wind\nArea\n%m' 'Wind\nArea\n%m' '%7.4lg' '%10lg' '' '' '' '' '' 0
5 'Tension\nCapacity\n%m' 'Tension\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
6 'Top Rect\nWidth\n%m' 'Top Rect\nWidth\n%m' '%9.5lg' '%9.5lg' '' '' '' 'Rectangle dimensions are only used for calculating allowable swing angles.  The top rectangle should encompass your bundle hardware.' 'Rectangle dimensions are only used for calculating allowable swing angles.  The top rectangle should encompass your bundle hardware.' 0
7 'Top Rect\nHeight\n%m' 'Top Rect\nHeight\n%m' '%9.5lg' '%9.5lg' '' '' '' 'Rectangle dimensions are only used for calculating allowable swing angles.  The top rectangle should encompass your bundle hardware.' 'Rectangle dimensions are only used for calculating allowable swing angles.  The top rectangle should encompass your bundle hardware.' 0
8 'Bot. Rect\nWidth\n%m' 'Bot. Rect\nWidth\n%m' '%10.5lg' '%10.5lg' '' '' '' 'Rectangle dimensions are only used for calculating allowable swing angles.' 'Rectangle dimensions are only used for calculating allowable swing angles.' 0
9 'Bot. Rect\nHeight\n%m' 'Bot. Rect\nHeight\n%m' '%10.5lg' '%10.5lg' '' '' '' 'Rectangle dimensions are only used for calculating allowable swing angles.' 'Rectangle dimensions are only used for calculating allowable swing angles.' 0
10 'Vert. Rect\nWidth\n%m' 'Vert. Rect\nWidth\n%m' '%11.5lg' '%11.5lg' '' '' '' 'Rectangle dimensions are only used for calculating allowable swing angles.  The bottom rectangle should encompass your counterweight.' 'Rectangle dimensions are only used for calculating allowable swing angles.  The bottom rectangle should encompass your counterweight.' 0
11 'Vert. Rect\nHeight\n%m' 'Vert. Rect\nHeight\n%m' '%11.5lg' '%11.5lg' '' '' '' 'Rectangle dimensions are only used for calculating allowable swing angles.  The bottom rectangle should encompass your counterweight.' 'Rectangle dimensions are only used for calculating allowable swing angles.  The bottom rectangle should encompass your counterweight.' 0
12 'Hardware\nCapacity\n%m' 'Hardware\nCapacity\n%m' '%9.4lg' '%10lg' '' '' '' '' '' 0
13 'Notes' 'Notes' '%6s' '%6s' '' '' '' '' '' 0
14 'Draw' 'Draw' '%5s' '%9s' '' '' '' '' '' 0
15 'Rigid' 'Rigid' '%6s' '%6s' '' '' '' 'Should this be modeled as a truss or a cable in PLS-CADD FE sag-tension (used for idlers)' 'Should this be modeled as a truss or a cable in PLS-CADD FE sag-tension (used for idlers)' 0
CSchemaHolder
13 'Suspension Insulator Connectivity' 6 1 1 0 0 0 0 0

0 'Suspension\nLabel\n' 'Suspension\nLabel\n' '%11s' '%16s' '' '' '' '' '' 0
1 'Structure\nAttach\n' 'Structure\nAttach\n' '%10s' '%16s' '' '' '' '' '' 0
2 'Tip\nLabel\n' 'Tip\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
3 'Property\nSet\n' 'Property\nSet\n' '%9s' '%39s' '' '' '' '' '' 0
4 'Cond. 1\nMinimum\nSwing\n%m' 'Cond. 1\nMinimum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
5 'Cond. 1\nMaximum\nSwing\n%m' 'Cond. 1\nMaximum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
6 'Cond. 2\nMinimum\nSwing\n%m' 'Cond. 2\nMinimum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
7 'Cond. 2\nMaximum\nSwing\n%m' 'Cond. 2\nMaximum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
8 'Cond. 3\nMinimum\nSwing\n%m' 'Cond. 3\nMinimum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
9 'Cond. 3\nMaximum\nSwing\n%m' 'Cond. 3\nMaximum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
10 'Cond. 4\nMinimum\nSwing\n%m' 'Cond. 4\nMinimum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
11 'Cond. 4\nMaximum\nSwing\n%m' 'Cond. 4\nMaximum\nSwing\n%m' '%8.2lf' '%7lg' '' '' '' '' '' 0
12 'Min. Required\nVertical Load\n(uplift)\n%m' 'Min. Required\nVertical Load\n(uplift)\n%m' '%14s' '%14s' '' '' '' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 'Used for uplift check.  Enter the minimum vertical load that must exist under the 4 weather cases defined in PLS-CADD under Criteria/Insulator Swing (only checked in PLS-CADD)' 0
CSchemaHolder
9 'Summary of Suspension Capacities and Usages' 4 1 1 0 0 0 0 0

0 'Suspension\nLabel\n' 'Suspension\nLabel\n' '%11s' '%16s' '' '' '' '' '' 0
1 'Tension\n\n\n%m' 'Tension\n\n\n%m' '%9.3lf' '%9.3lf' '' '' '' '' '' 0
2 'Input\nTension\nCapacity\n%m' 'Input\nTension\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
3 'Factored\nTension\nCapacity\n%m' 'Factored\nTension\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
4 'Tension\nUsage\n\n%%' 'Tension\nUsage\n\n%%' '%8.2lf' '%8.2lf' '' '' '' '' '' 0
5 'Input\nHardware\nCapacity\n%m' 'Input\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
6 'Factored\nHardware\nCapacity\n%m' 'Factored\nHardware\nCapacity\n%m' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
7 'Hardware\nUsage\n\n%%' 'Hardware\nUsage\n\n%%' '%9.2lf' '%9.2lf' '' '' '' '' '' 0
8 'Max.\nUsage\n\n%%' 'Max.\nUsage\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
7 'Overturning Moments For User-Input Concentrated Loads' 6 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%10s' '' '' '' '' '' 0
1 'Total\nTran.\nLoad\n%m' 'Total\nTran.\nLoad\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
2 'Total\nLong.\nLoad\n%m' 'Total\nLong.\nLoad\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
3 'Total\nVert.\nLoad\n%m' 'Total\nVert.\nLoad\n%m' '%7.3lf' '%7.3lf' '' '' '' '' '' 0
4 'Transverse\nOverturning\nMoment\n%m' 'Transverse\nOverturning\nMoment\n%m' '%12.3lf' '%12.3lf' '' '' '' '' '' 0
5 'Longitudinal\nOverturning\nMoment\n%m' 'Longitudinal\nOverturning\nMoment\n%m' '%13.3lf' '%13.3lf' '' '' '' '' '' 0
6 'Torsional\nMoment\n\n%m' 'Torsional\nMoment\n\n%m' '%10.3lf' '%10.3lf' '' '' '' '' '' 0
CSchemaHolder
8 'Joint Displacements' 3 1 1 0 0 0 0 0

0 'Joint\nLabel' 'Joint\nLabel' '%6s' '%16s' '' '' '' '' '' 0
1 'Disp.\nin X-Dir\n%m' 'Disp.\nin X-Dir\n%m' '%9lg' '%11lg' '' '' '' '' '' 0
2 'Disp.\nin Y-Dir\n%m' 'Disp.\nin Y-Dir\n%m' '%9lg' '%11lg' '' '' '' '' '' 0
3 'Disp.\nin Z-Dir\n%m' 'Disp.\nin Z-Dir\n%m' '%9lg' '%11lg' '' '' '' '' '' 0
4 'Rot.\nX-Axis\n%m' 'Rot.\nX-Axis\n%m' '%7lg' '%11lg' '' '' '' '' '' 0
5 'Rot.\nY-Axis\n%m' 'Rot.\nY-Axis\n%m' '%7lg' '%11lg' '' '' '' '' '' 0
6 'Rot.\nZ-Axis\n%m' 'Rot.\nZ-Axis\n%m' '%7lg' '%11lg' '' '' '' '' '' 0
7 'Load\nComment' 'Load\nComment' '%8s' '%8s' '' '' '' '' '' 0
CSchemaHolder
4 'X-Arm Connections' 7 1 1 0 0 0 0 0

0 'Attach\nLabel\n' 'Attach\nLabel\n' '%7s' '%16s' '' '' '' '' '' 0
1 'Offset\n\n%m' 'Offset\n\n%m' '%7.3lf' '%5.3lf' '' '' '' '' '' 0
2 'Connect\nAt\n' 'Connect\nAt\n' '%9s' '%9s' '' '' '' '' '' 0
3 'Connection\nCode\nType\n' 'Connection\nCode\nType\n' '%12s' '%12s' '' '' '' 'Select F for rigidly fixed, Pn for pinned in the "n" direction' 'Select F for rigidly fixed, Pn for pinned in the "n" direction' 0
CSchemaHolder
2 'Joints Relative to the Origin' 3 1 1 0 0 0 0 0

0 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%8s' '' '' '' '' '' 0
1 'Offset\n\n%m' 'Offset\n\n%m' '%7.5lg' '%10.5lg' '' '' '' '' '' 0
CSchemaHolder
14 'Tubular X-Arm Steel Properties' 15 1 1 0 0 0 0 0

0 'Element\nLabel\n' 'Element\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Joint\nPosition\n' 'Joint\nPosition\n' '%9s' '%12s' '' '' '' '' '' 0
3 'Rel.\nDist.\n%m' 'Rel.\nDist.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
4 'Outer\nDiam.\n%m' 'Outer\nDiam.\n%m' '%6.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Area\n\n%m' 'Area\n\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'V-Moment\nInertia\n%m' 'V-Moment\nInertia\n%m' '%9.2lf' '%10.4lg' '' '' '' '' '' 0
7 'H-Moment\nInertia\n%m' 'H-Moment\nInertia\n%m' '%9.2lf' '%10.4lg' '' '' '' '' '' 0
8 'D/t\n\n' 'D/t\n\n' '%4.2lf' '%6.2lf' '' '' '' '' '' 0
9 'W/t\nMax.\n' 'W/t\nMax.\n' '%5.1lf' '%6.2lf' '' '' '' '' '' 0
10 'Fy\n\n%m' 'Fy\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
11 'Fa\nMin.\n%m' 'Fa\nMin.\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
12 'V-Moment\nCapacity\n%m' 'V-Moment\nCapacity\n%m' '%9.2lf' '%6.2lf' '' '' '' '' '' 0
13 'H-Moment\nCapacity\n%m' 'H-Moment\nCapacity\n%m' '%9.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
20 'Detailed Tubular X-Arm Usages' 14 1 1 0 0 0 0 0

0 'Element\nLabel\n' 'Element\nLabel\n' '%8s' '%8s' '' '' '' '' '' 0
1 'Joint\nLabel\n' 'Joint\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
2 'Joint\nPosition\n' 'Joint\nPosition\n' '%9s' '%8s' '' '' '' '' '' 0
3 'Rel.\nDist.\n%m' 'Rel.\nDist.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
4 'Trans.\nDefl.\n%m' 'Trans.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
5 'Long.\nDefl.\n%m' 'Long.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
6 'Vert.\nDefl.\n%m' 'Vert.\nDefl.\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
7 'Vert.\nMom.\n%m' 'Vert.\nMom.\n%m' '%12.2lf' '%12.2lf' '' '' '' '' '' 0
8 'Horz.\nMom.\n%m' 'Horz.\nMom.\n%m' '%12.2lf' '%12.2lf' '' '' '' '' '' 0
9 'Tors.\nMom.\n%m' 'Tors.\nMom.\n%m' '%6.1lf' '%6.2lf' '' '' '' '' '' 0
10 'Axial\nForce\n%m' 'Axial\nForce\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
11 'Vert.\nShear\n%m' 'Vert.\nShear\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
12 'Horz.\nShear\n%m' 'Horz.\nShear\n%m' '%7.2lf' '%7.2lf' '' '' '' '' '' 0
13 'P/A\n\n%m' 'P/A\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
14 'M/S.\n\n%m' 'M/S.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
15 'V/Q.\n\n%m' 'V/Q.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
16 'T/R.\n\n%m' 'T/R.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
17 'Res.\n\n%m' 'Res.\n\n%m' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
18 'Max.\nUsage\n%%' 'Max.\nUsage\n%%' '%6.1lf' '%6.2lf' '' '' '' '' '' 0
19 'At\nPt.\n' 'At\nPt.\n' '%4d' '%4d' '' '' '' '' '' 0
CSchemaHolder
6 'Summary of Tubular X-Arm Usages' 3 1 1 0 0 0 0 0

0 'Tubular X-Arm\nLabel' 'Tubular X-Arm\nLabel' '%14s' '%16s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
3 'Height\nAGL %m' 'Height\nAGL %m' '%9.1lf' '9.1lf' '' '' '' '' '' 0
4 'Segment\nNumber' 'Segment\nNumber' '%8d' '%8d' '' '' '' '' '' 0
5 'Weight\n%m' 'Weight\n%m' '%7.1lf' '%9.1lf' '' '' '' '' '' 0
CSchemaHolder
5 'Summary of Tubular X-Arm Usages by Load Case' 2 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Tubular X-Arm\nLabel' 'Tubular X-Arm\nLabel' '%14s' '%16s' '' '' '' '' '' 0
3 'Height\nAGL %m' 'Height\nAGL %m' '%9.1lf' '9.1lf' '' '' '' '' '' 0
4 'Segment\nNumber' 'Segment\nNumber' '%8d' '%8d' '' '' '' '' '' 0
CSchemaHolder
5 'Brace Connectivity' 4 1 1 0 0 0 0 0

0 'Brace\nLabel\n' 'Brace\nLabel\n' '%6s' '%8s' '' '' '' '' '' 0
1 'Origin\nLabel\n' 'Origin\nLabel\n' '%7s' '%16s' '' '' '' '' '' 0
2 'End\nLabel\n' 'End\nLabel\n' '%6s' '%16s' '' '' '' '' '' 0
3 'Brace\nProperty\nSet' 'Brace\nProperty\nSet' '%9s' '%21s' '' '' '' '' '' 0
4 'Element\nType\n' 'Element\nType\n' '%9s' '%9s' '' '' '' 'Select fuse if you want the brace to be removed from the model when its compression capacity is exceeded.' 'Select fuse if you want the brace to be removed from the model when its compression capacity is exceeded.' 0
CSchemaHolder
5 'Summary of Brace Forces and Usages' 1 1 1 0 0 0 0 0

0 'Brace\nLabel' 'Brace\nLabel' '%7s' '%16s' '' '' '' '' '' 0
1 'Forces\n%m' 'Forces\n%m' '%9.2lf' '%8.2lf' '' '' '' '' '' 0
2 'Allowable\nCompression\n%m' 'Allowable\nCompression\n%m' '%12.2lf' '%8.2lf' '' '' '' '' '' 0
3 'Allowable\nTension\n%m' 'Allowable\nTension\n%m' '%10.2lf' '%8.2lf' '' '' '' '' '' 0
4 'Usage\n\n%%' 'Usage\n\n%%' '%6.2lf' '%6.2lf' '' '' '' '' '' 0
CSchemaHolder
4 'Summary of Brace Usages' 5 1 1 0 0 0 0 0

0 'Brace\nLabel' 'Brace\nLabel' '%7s' '%16s' '' '' '' '' '' 0
1 'Maximum\nUsage\n%%' 'Maximum\nUsage\n%%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Load Case\n\n' 'Load Case\n\n' '%10s' '%23s' '' '' '' '' '' 0
3 'Weight\n\n%m' 'Weight\n\n%m' '%7.1lf' '%9.1lf' '' '' '' '' '' 0
CSchemaHolder
3 'Summary of Brace Usages by Load Case' 2 1 1 0 0 0 0 0

0 'Load Case\n' 'Load Case\n' '%10s' '%23s' '' '' '' '' '' 0
1 'Maximum\nUsage %%' 'Maximum\nUsage %%' '%8.2lf' '%12.2lf' '' '' '' '' '' 0
2 'Brace\nLabel' 'Brace\nLabel' '%7s' '%16s' '' '' '' '' '' 0
0 ; multiline
0
Project Name 

1
Project Notes

30
Project File 

2
Date run     

5
Successfully performed nonlinear analysis

1035
Modeling options:

1036
  Offset Arms from Pole/Mast:

1037
  Offset Braces from Pole/Mast:

1038
  Offset Guys from Pole/Mast:

1039
  Offset Posts from Pole/Mast:

1076
  Offset Strains from Pole/Mast:

3003
  Use Alternate Convergence Process:

3004
  Steel poles and tubular arms checked with

3014
Default Modulus of Elasticity for Steel

3015
Default Weight Density for Steel

1030
for Davit Property

1021
*** Insulator Data

1022
*** Loads Data

1003
Loads from file

1069
Insulator dead and wind loads are already included in the point loads printed below.

1058
Loading Method Parameters:

1066
Structure Height Summary (used for calculating wind/ice adjust with height):

1045
Z of ground for wind height adjust 

1082
and structure Z coordinate that will be put on the centerline ground profile in PLS-CADD.

1063
Ground elevation shift             

1072
Z of ground with shift             

1067
Z of structure top (highest joint) 

1064
Structure height                   

1065
Structure height above ground      

1024
*** Analysis Results:

1005
Maximum element usage is

1027
Maximum insulator usage is

1074
Maximum pole deflection usage is

1025
*** Analysis Results for Load Case No.

1026
- Number of iterations in SAPS

1004
*** Overall summary for all load cases - Usage = Maximum Stress / Allowable Stress

1006
*** Maximum Stress Summary for Each Load Case

1007
Weight of structure

1019
Weight of Tubular Davit Arms:

3000
Weight of Steel Poles:

1014
Weight of Strains:

1017
Weight of Posts:

1018
Total:

1020
*** End of Report

1015
Weight of Suspensions:

1031
for Cross Arm Property

1042
Weight of Tubular X-Arms:

1012
Weight of Braces:

0 ; multiline
38052
Joint Support Reactions

786688
&File

2884096
&New

32910
&Standard Interface

32913
&Framing Wizard...

57601
&Open...\tCtrl+O

2884358
&Import

38369
&Arachnid

2884873
PLS-&GRID

41144
Project &Discovery

41146
Changelog Reporting

41154
Import &Backup

38421
&Server Settings

57606
P&rint Setup (Graphics)...

33347
&Backup...

33348
Restore Back&up...

33349
Pre&ferences...

57665
E&xit

788226
&View

59392
Standard &Toolbar

59393
&Status Bar

795146
Help

32884
&Help Topics

35926
&View Manual

35927
&Check for Updated Manual...

35940
&Select Manual...

35938
&Download Upgrade...

33481
Download &Examples...

35932
D&ownload Alternate Language...

190
T&ip of the Day...

35930
Visit the PLS &News Page

35929
Visit the PLS &Technical Notes Page

35936
Visit the PLS Online &Library

38387
&Register for Training Classes...

57664
&About...

33440
&Close

38015
&Save\tCtrl+S

38014
Save &As...

2884615
&Export

218
&DXF...

32966
&PLS-CADD/LITE

228
&STL...

41147
Project &Reviewer

41131
&Add Project

41132
Check &Out Project

41133
Check &In Project

57008
R&ename Project

33477
Model &Diff...

38416
Model Diff Since Last Save

32853
Batc&h Save...

38013
Batch Modif&y...

35942
Analyze &Multiple Models...

57605
Page Se&tup (Reports)...

35981
Fit Vertical &To Page

35982
Show Pa&ge Area

57607
&Print...

57609
P&rint Preview...

787969
&Edit

57635
Cu&t\tCtrl+X

57634
&Copy\tCtrl+C

57637
&Paste\tCtrl+V

57642
Select &All\tCtrl-A

57696
Fo&nt...

33411
Autosize Font

57636
&Find...\tCtrl-F

57641
R&eplace...\tCtrl-R

33415
&Goto Line...

38002
Next Result\tCtrl-+

38003
Previous Result\tCtrl--

245
F&ull Screen

215
&Zoom Rect

216
In&verse Zoom Rect

212
&Initial\tF3

35939
Is&ometric

225
&Previous\tShift+Backspace

217
&Redraw\tF4

35917
Vanishing Point Mode (Model View)...\tV

38065
Dance Structure

38117
Entity Info Snap Settings...

220
Di&stance Between Points

231
Distance Between &Joints\tF7

262
Min. Distance &Between Members\tF8

35944
&Find Member...\tCtrl-F

2361361
I&nfo

253
&Member Info

254
&Joint Info

255
&Group Info

261
&Property Info

2361619
&Display Options

213
&Set Rotation, Color and Label Options...

219
&Rotation Origin

264
Show Structure Compass

286
Show Scale Indicator

204
Latitude &Minus\tPgDn

205
Latitude &Plus\tPgUp

209
&Longitude Minus\tHome

208
L&ongitude Plus\tEnd

221
&Cut

222
&Uncut

38031
Pa&nel Cut

38033
Connec&tion Cut

38032
&Ghost Mode

240
&Black && White

237
Line &Width...

2361876
&Cycle

38006
Color By\tF9

38008
Load Case Display\tF6

35984
Load Vectors

35985
Joint Labels

35983
Member Labels

35980
Render Mode

2362133
&Toolbars

33443
3D Tool&bar

251
&Zoom Bar

32972
Add/&Move/Delete Toolbar

33451
A&pplication Toolbar

414
A&nnotation Toolbar

41149
PLS-&GRID Toolbar

3345415
&Custom Toolbars

38075
Custom Toolbar 1

38076
Custom Toolbar 2

38077
Custom Toolbar 3

38078
Custom Toolbar 4

273
&Report Navigator Toolbar

271
&Quick Search Toolbar

40400
&Auto Arrange Toolbars

33446
&Hide All Toolbars

2362647
&Edit Customizations

33470
&Report Strings...

33480
&Menu Titles, Tips and Hotkeys...

33482
&Dialog Strings...

33483
D&ialog Tips...

33471
&Tables...

33493
&Custom Toolbar...

38062
Add To Custom Toolbar via Right Click

790019
Ge&neral

32793
&General Data...

32857
&Output Options...

32863
&Post Processor Options...

32851
&Wood Pole Buckling Assumptions...

32945
&EIA Options...

32840
&Interaction Diagram Options...

38359
&Reference Manager

790276
&Components

32765
&Wood Pole...

32755
Wood Pole Material...

32761
&Steel Pole...

32766
C&oncrete Pole...

32753
&Laminated Wood Pole...

32750
&FRP Pole...

32754
&Mast...

32756
&Brace...

32751
&Cable...

32759
&Davit...

32760
&Tubular Steel Davit Arms...

32763
C&ross Arm...

32764
T&ubular Steel Cross Arms...

32767
Connections and &Anchors...

32762
&Equipment Library...

2495511
&Insulators

32809
&Clamp Properties...

32810
&Strain Properties...

32812
S&uspension Properties...

32811
&2-Part Properties...

32813
&Post Properties...

32814
&Guy Strain Properties...

32950
Input Echo &Report

32807
Save &As  Insulator Library...

32808
&Merge Insulator Libraries...

2496025
Frami&ng

32986
&Manager...

32768
&Table Edit...

32990
&Update Component Library...

32981
&Add Current Model..

32985
&Import Other Models...

32858
User Defined Steel S&hapes...

32859
&Graph Steel Shape...

791045
&Geometry

32827
&Joints...

31781
&Wood Poles...

31777
&Steel Poles...

31782
C&oncrete Poles...

31771
&Laminated Wood Poles...

31785
&FRP Poles...

31772
Masts...

32912
Switc&h Pole Material...

32977
Ra&ke Pole...

31773
&Braces...

31774
&Guys...

31769
&Cables...

31775
&Davit Arms...

31776
&Tubular Steel Davit Arms...

31779
C&ross Arms...

31780
T&ubular Steel Cross Arms...

31786
Connections and &Anchors...

31778
&Equipment...

32902
&Vangs...

2495254
&Miscellaneous

32842
&Dead Loads and Drag Areas...

32850
&Foundation Strength...

32992
&Soil and Caisson Settings...

32852
Linear &Appurtenances...

32956
&PhaseRaiser Wizard...

32901
&Wood Pole Defects...

32873
&Optional Attachment Points Restriction...

32820
&Clamp...

32821
&Strain...

32823
S&uspension...

32822
&2-Part....

32824
&Post...

32825
&Guy Strain...

35948
&Find Allowable Suspension Swing Angles...

35949
C&alculate Allowable 2-Part Load Angles...

2495768
&PLS-CADD

33432
Insulator &Link...

32854
Material &Options...

33495
Edit &Part List...

33496
Edit &Assembly List...

33433
&Edit User Entered Material...

32855
View Complete &Material List...

1520
&Configure Parts Database...

1519
Download &Parts List from Database...

32480
&Upload Assemblies to Database...

32481
&Download Assemblies from Database...

38004
Merge Part &Files...

2432768
&Add

31787
&Edit...

32984
E&xplode All

792326
&Loads

32796
&Vector Loads (LCA File)...

32797
&Wire Loads (LIC File)...

32798
&EIA Loads (EIA File)...

32996
&Remove LCA/LIC/EIA File References

32801
&Loading Tree Report

32994
&Batch Import or Edit Concentrated Loads...

792583
&Model

32791
&Check

32942
Generate Input Ec&ho Report

32828
&Run

1584
Generate Analysis Results Report

1585
Generate Summary Results Report

32904
Com&pare Results Between Runs...

32856
&Optimum Pole Selection...

32845
&Steel Pole Shaft Optimizer...

32900
&X-Brace Optimizer...

41081
Tubular Steel Davit Arm Optimizer...

792840
&Drafting

40051
&Page Size...

40054
Number of Sheet Pa&ges...

38157
Import &Drafting Settings...

38175
Te&xt Size, Line Width, Style, Color and Layer...

1710597
&Attachments (Raster and Vector)

35904
&Attachment Manager...

35905
&Move...

35906
&Stretch...

1710854
Annotation (&User-Input)

38045
&Line...

38046
&Arrow To...

38047
Arrow &From...

38048
&Polygon...

38037
Section &Bubble...

38178
&Arc..

38177
&Ellipse/Circle...

38179
&Dimension Angle...

38034
Perpendicular Line...

38049
&Dimension...

38001
Dimension &Snap...

38050
&Text...

38051
D&isplay

38041
&Edit...

38042
Move &Point or Text...

38063
Move &Line or Polygon...

38064
Rotate Line or &Polygon...

38053
&Rotate Text...

38043
&Delete...

38040
&Table Edit...

1711367
A&nnotation (Program-Generated)

38022
D&isplay

32938
Auto Add Di&mension Lines

38067
&Edit...

38055
Move &Point or Text

38056
Move &Line

38059
&Rotate Text

38058
Rotate Li&ne

38057
&Delete

38021
Delete &All\tF5

38020
&Table Edit...

1711624
&Inset Views

38215
Inset &Structure View...

40696
Empty Inset &View...

38186
&Build Inset Report View...

38103
&Delete Inset View

38087
&Resize Inset View

38086
&Move Inset View

38090
Bring to &Front

38091
Send to &Back

38129
A&utoscale Inset View

38159
S&plit Inset Report View

38332
Pan, R&otate, or Zoom Inset Structure View

2433034
&Table Edit

38038
Inset &Annotations...

38089
Inset &Structure Views...

38088
Inset &Report Views...

38131
Add Orientation to Structure View...

38130
Add Loading Tree Report...

38384
Add Loading Tree Views...

38156
Add Material List Report...

794889
&Window

33350
&New Report

33444
New Vie&w...

32903
&Project Report

40075
&Sheets View

57006
Save Window State

57650
&Cascade

57651
&Tile Horizontal

57652
Tile &Vertical

57649
&Arrange Icons

33352
C&lose All

32988
&Add

66048
Entity Info

38102
Change Snap Settings\tS

40788
Go to Location in Google Maps\tM

40669
Open CADD Project\tO

40789
Get Latest Revision \tL

40791
Open Project Reviewer

40786
Open Project KML/KMZ\tK

40670
Open Structure File\tT

40765
Open P&&P Sheet PDF\tP

40766
Open Structure Overview Report\tV

40787
Open Construction Staking Report\tC

40792
Clear Structure Usage

38110
Edit Annotation\tE

38111
Delete Annotation\tD

38112
Move Annotation Point or Text\tP

38113
Rotate Annotation Text\tT

38114
Move Annotation Line or Polygon\tL

38115
Rotate Annotation Line or Polygon\tR

38116
Table Edit Annotations...\tA

38204
Copy Annotation\tC

38205
Paste Annotation\tV

38132
Edit Inset View\tE

38133
Delete Inset View\tD

38134
Resize Inset View\tR

38135
Move Inset View\tM

38136
Bring to Front\tF

38137
Send to Back\tB

38138
Autoscale Inset View\tU

38160
Autoscale Inset View to Structure\tU

38161
Autoscale Inset View to Visible Members\tU

38333
Pan, Rotate, or Zoom Inset View\tO

38158
Split Inset Report\tP

38139
Table Edit Annotations...\tA

38176
Lock\tL

38210
Shift Inset View Contents

38030
Delete This Sheet Page

38101
Insert Sheet Page Before

3211562
Add Sheets Page

38200
Title

38201
Note

38202
Drawing

38203
Appendix

38211
Hide Attached DXF or Shapefile\tH

38212
Hide Layer\tL

38213
Show Overlay Options...\tO

38214
Attachment Manager...\tA

38140
Member Info

38125
Member Edit...

38146
Group Info

38127
Group Edit...

38141
Property Info

38128
Property Edit...

38142
Delete

38143
Move

38261
Rotate

38148
Min. Distance Between Members

38390
Tubular Steel Davit Arm Optimizer...

38391
Steel Pole Shaft Optimizer...

38150
Joint Info

38126
Joint Edit...

38152
Distance Between Joints

38181
Framing Explode

38308
Select in Framing Manager

38327
Insulator Link...

57011
Auto Add Dimension Lines to Structure\tL

57012
Move Anchor Point

57013
Move Guy Attachment Point

57014
Rake Pole

35901
Name Run...

35955
Create Controlling LCA Subset...

223
Save &as

2621703
Save as &PDF

35987
To File...

35988
To Reference Manager...

35989
To Google Drive...

2621961
&Latitude && Longitude

2622218
&Zoom

210
Zoom I&n\t+

211
Zoom &Out\t-

2622475
Zoom &To

246
&Front

247
&Back

248
&Left

249
&Right

250
&Top

33498
Switch to Model View\t1

33499
Switch to Model Check Results\t2

33500
Switch to Sheets View\t3

35933
Detach Window

33331
Detach Window to Monitor 1

33332
Detach Window to Monitor 2

33333
Detach Window to Monitor 3

2556165
Table View

2557191
XML Export

2557704
Add as Annotation to Inset View

2558217
Google Sheets Export

35956
KML or SHP Export

35967
Import

35968
in Project as XYZ Points

2556678
Goto

35918
Customize 'Steel Tubes Properties'

35999
Export &All

33353
&Open...

33354
&Close...

33355
&Save...

33356
Save &As...

2558735
Save To...

38367
Re&ference Manager...

35990
&Google Drive...

2558992
Save as PDF...

38018
&Compare Report To...

33357
Appen&d To...

38019
&Name Report...

33358
Save Se&lection As...

33359
Append Selection &To...

35945
Table View

35946
XML Export

35969
Add as Annotation to Inset View 'Steel Tubes Properties'

33502
Google Sheets Export 'Steel Tubes Properties'

44001
Goto

33400
Cu&t\tShift-Del

33401
&Copy\tCtrl-Ins

33402
&Paste\tShift-Ins

33407
&Fill

33406
Pattern Fill &Down

38079
Copy && Fill Column

3513
Prepend

33467
&Append

33408
C&lear\tDel

33474
Find\tCtrl-F

33475
Find &Next\tF3

33404
&Remove Row

33405
&Insert Row

38061
&Goto Last Row With Data

33489
Copy with Column and Row &Headings

33409
T&able Report

33445
Database &Export

33488
XML Export

33484
Add as Annotation to Inset View

33501
Google Sheets Export

0 ; multiline
32910
Creates a regular PLS-POLE project that can contain wood, steel or concrete poles and modular latticed masts

32913


57601
Open a project

38369


41144
Open the PLS-GRID Project Manager Project Discovery dialog

41146


41154


38421


57606
Change the printer and printing options for graphics views

33347
Create a single backup file containing all the information needed to recreate your project.

33348
Recreate an entire project from a backup file

33349
Edit program preferences

57665
Quit the application; prompts to save documents

59392
Toggle standard toolbar display

59393
Toggle status bar display

32884
Displays the table of contents for the manual

35926
Runs Adobe Acrobat to display the user's manual

35927
Uses your Internet connection to check Power Line Systems for an updated manual

35940
This command can be used to pick a manual in another language for the help system to use...

35938
Request an upgrade from Power Line Systems and then download and install it

33481
Download the latest available examples from Power Line Systems

35932
Connects to the PLS Internet site to obtain other languages the software may run in

190
Displays a Tip of the Day.

35930
Takes your web browser to the Power Line Systems news page where you can find information on the latest events and versions

35929
Takes your web browser to the Power Line Systems technical notes page which has information on using the software

35936
Takes your web browser to the Power Line Systems online library where you can download files for use with the software

38387
View and register for available training classes hosted by Power Line Systems, or other authorized entities

57664
Display program information, version number and copyright

57600
Create a new project

57345
Ready

57635
Cut the selection and put it on the Clipboard

57634
Copy the selection and put it on the Clipboard

199
Jump to the selected table in the report

200
View the selected output in a table

201
Export the selected table to an XML file

57637
Insert Clipboard contents

38015
Saves the current project

57616
Open this document

222
Restore display of members removed with cut

221
Cut selected members out of display

38048
Add annotation polygon

38046
Add annotation arrow to

38045
Add annotation line

32966
Export the model to PLS-CADD/LITE

32961
Rotate an element or insulator

33440
Close the active document

38014


218
Export a DXF representation of the current view.  Used to bring PLS-CADD graphics into a CAD system.

228
Export a STereoLithography file useful for 3D printing models.

41147
Open the PLS-GRID Project Manager Project Reviewer dialog

41131
Add the current project to PLS-GRID Project Manager

41132
Check out the current project from PLS-GRID Project Manager

41133
Check in the current project to PLS-GRID Project Manager

57008


33477
Compares a model on disk to the currently loaded model and issues a report with their differences

38416
Compares currently loaded model to when it was last saved and issues a report with their differences

32853


38013
Copy settings from the current model to many other models that you select

35942
Allows you to open and run an analysis on many models with a single command

57605
Change the printing options for reports

35981


35982


57607
Print the active document

57609
Display full pages

57642
Select the entire document

57696
Changes the selected text size, face, and color

33411
Size font so no lines wrap.

57636
Find the specified text

57641
Replace specific text with different text

33415
Jumps to the specified line

38002


38003


245
Toggles Full Screen Mode (Press Escape or Alt-V F to exit)

215
Zoom in on specified rectangle

216
Zoom out rect

212
Initialize view to show entire structure

35939
See the structure from an isometric perspective

225
Restore Previous View

217
Redraw current view

35917


38065
Make the structure dance by amplifying displacements (works in deformed structure views and profile view with inset structures or cross sections)

38117
Show information about entity closest to the mouse cursor.

220


231
Measure distance between two joints

262
Find the minimum distance between two members

35944
Will hilite a member in the view

253
Edit data for member closest to cursor

254
Edit data for joint closest to cursor

255
Edit data for group closest to cursor

261
Property Info

213
Control all view options (color, load case display options, ...)

219
Set view rotation origin

264
Toggle display of compass at the base of structures

286


204
Decrease latitude

205
Increase latitude

209
Decrease longitude

208
Increase longitude

38031


38033


38032


240
Toggle black and white display mode

237
Change pen width

38006
Switch between percent usage, face, section, tension/comp., material type, element type, group type, and none

38008
Cycle through the display of each load case, one at a time

35984
Switch between XYZ components, resultant, PLS-CADD wires (PLS-CADD only), and none

35985
Switch between numbers, labels, and none

35983
Switch between usage, member force, section labels, numbers, group labels, members labels, member length, and none

35980
Switch between line, wireframe and rendered drawing

33443
Toggle 3D toolbar display

251


32972


33451
Display or hide the application toolbar

414
Toggle annotation toolbar display

41149
Toggle PLS-GRID toolbar display

38075


38076


38077


38078


273


271


40400
Automatically arranges toolbars

33446
Hide all tool bars

33470
Allows the editing of menu titles

33480
Allows the editing of menu titles

33482
Edit the text shown in dialog boxes

33483
Edit the tips displayed by controls in dialogs

33471
Edit customizable tables and reports

33493


38062


32793
Edit general data

32857
Click this to edit the output options for your reports and graphs

32863


32851


32945


32840
Edit the interaction diagram options

38359


32765
Edit wood pole properties

32755
Edit the wood pole material properties...

32761
Edit Steel Pole Properties

32766
Edit concrete pole properties...

32753
Edit laminated pole properties...

32750
Edit Fiber Reinforced Polymer pole properties...

32754
Edit mast properties

32756
Edit brace material properties

32751
Edit cable properties

32759
Edit Generic Davit Arm Properties...

32760
Edit Tubular Steel Davit Arm Properties

32763
Edit Generic Cross Arm Properties...

32764
Edit Tubular Steel Cross Arm Properties...

32767
Edit connection and anchor properties...

32762
Edit the equipment library...

32809
Edits properties for clamp insulators

32810
Edits properties for strain insulators

32812
Edits properties for suspension insulators

32811
Edits properties for 2-parts insulators

32813
Edits properties for post insulators

32814
Edits properties for guy strain insulators

32950


32807
Saves the insulator library with a new name

32808
Merges a library from disk with the one currently in memory

32986


32768
Allows changing, copying or deleting framings from the library

32990


32981
Adds the current model to the framing library

32985


32858
Edit the steel shapes library

32859
Displays a user defined steel shape cross section

32827
Edit joint geometry for structures that require joints such as A-Frames

31781
Edit wood poles

31777
Edit steel poles

31782
Edit concrete poles

31771
Edit laminated poles

31785
Edit Fiber Reinforced Polymer poles

31772
Edit mast geometry

32912
Switch a pole from one material type to another

32977


31773
Edit brace geometry

31774
Edit guy geometry

31769
Edit cable geometry

31775
Edit Generic Davit Arm Geometry...

31776
Edit Tubular Steel Davit Arms Geometry

31779
Edit Generic Cross Arm Geometry

31780
Edit Tubular Steel Cross Arm Geometry

31786
Edit connection and anchor geometry

31778
Attach predefined equipment to your structure

32902
Vangs can be used to attach other elements at a distance from the center of a pole

32842
Edit the Dead Loads and Drag Areas

32850
Enter foundation strength and spring constants

32992
Enter soil and Caisson analysis options.

32852
Enter linear appurtenances for communications poles

32956


32901
Enter point defects due to damage or enter any bolt holes you want to account for

32873


32820
Edit clamp geometry...

32821
Edit strain geometry...

32823
Edit suspension geometry...

32822
Edit 2-parts geometry...

32824
Edit post geometry...

32825
Edit guy strain geometry...

35948
Determines the allowable swing angle for a suspension insulator

35949
Calculates allowable insulator swing angles as the arctan of (dH/dV)

33432
PLS-CADD insulator link

32854


33495


33496


33433


32855


1520
Configure link between material file and an ODBC database

1519
Download parts list from an ODBC database

32480
Uploads the assemblies in your current parts file to an ODBC compliant database

32481
Reads assemblies from an ODBC database into your current parts file

38004


32988
Add a Framing to the current model

31787


32984


32796
Edit the vector loads (.lca file) that are used when in Design Check for Single Structure Mode

32797
Edit the wire loads (.lic file) that are used when in Allowable Spans or Interaction Diagrams mode

32798
Edit the EIA (.eia file) loads used when checking a structure by the EIA codes

32996


32801


32994


32791
Check the current model for inconsistencies

32942


32828
Analyze the current model

1584


1585


32904


32856
Finds the lightest or cheapest pole among your selection that withstands the current loads

32845
Designs the lightest steel pole that will withstand your load

32900
X-Brace Optimizer...

41081
Designs the lightest tubular steel davit arm that will withstand your load

40051


40054


38157


38175
Set text size, line thicknesses, line styles, line colors and DXF export layers

35904
Attach, detach and position raster and vector attachments

35905
Move attachment to a mouse specified location

35906
Stretch attachment to match two mouse designated points

38047
Add annotation arrow from

38037
Add annotation section bubble

38178
Add annotation Arc

38177
Add annotation Circle/Ellipse

38179
Add annotation Dimension Angle

38034


38049
Add annotation dimension line

38001
Creates annotation showing the distance between two joints

38050
Add Text

38051


38041
Edit lines and annotation item

38042
Move point or text annotation item

38063
Move line or polygon annotation item

38064
Rotate line or polygon annotation item around its center

38053
Rotate line text or annotation text

38043
Delete line and annotation item

38040
Edit lines and annotation in spreadsheet

38022


32938


38067


38055


38056


38059


38058


38057


38021
Removes all the annotation associated with this model

38020


38215
Add an inset structure view

40696
Create new empty inset view on drafting sheet

38186
Build an inset report view using a blank table

38103
Remove an existing inset view

38087
Resize an existing inset view

38086
Move an existing inset view

38090
Selected inset view will be on top all other inset views

38091
Selected inset view will be beneath all other inset views

38129
Automatically adjust the scale of the content of the inset view to fit

38159
Split the Inset Report View into multiple separate Inset Report Views

38332
Pan, Rotate, or Zoom the contents of the selected Inset View

38038
Edit inset view's lines and annotation in spreadsheet

38089
Edit existing inset structure viewports

38088
Edit existing inset report viewports

38131


38130


38384


38156


33350
Open a blank report window

33444
Create a new 3D view

32903
Open the Project Report

40075


57006


57650
Arrange windows so they overlap

57651
Arrange windows as non-overlapping tiles

57652
Arrange windows as non-overlapping tiles

57649
Arrange icons at the bottom of the window

33352
Close all

38102
Change types of entities mouse snaps too

40788


40669


40789


40791


40786


40670


40765


40766


40787


40792


38110
Edit selected piece of annotation.

38111
Delete selected piece of annotation.

38112
Move selected piece of annotation.

38113
Rotate selected piece of annotation.

38114
Drag selected piece of annotation (moves all connected vertices)

38115
Rotate selected annotation figure about its center.

38116
Edit set of annotations in a table.

38204
Copy the annotation(s) that make up the selected entity. Hold Ctrl to append annotation(s) to existing copy buffer.

38205
Paste the annotation(s) that make up the previously copied entity. Hold Ctrl to enter 'Move Annotation' mode after pasting.

38132
Edit the Inset View

38133
Delete the Inset View

38134
Resize the Inset View

38135
Move the Inset View

38136
Bring the Inset View to the front

38137
Send the Inset View to the back

38138
Autoscale the Inset View (hold Ctrl to multiselect, then hit Enter, or release Ctrl and Left Click, to execute autoscale)

38160
Autoscale the Inset View to show the entire structure

38161
Autoscale the Inset View the currently visible members of the structure

38333
Pan, Rotate, or Zoom the contents of this Inset View

38158
Split the Inset Report View into multiple separate Inset Report Views

38139
Table edit the Inset View's Annotations

38176
Lock this Inset Report View to prevent auto-regeneration/updating from running the associated report or from relevant changes made in the Drafting/Text Size, Line Width, Style, Color and Layer... menu

38210
Shift the contents of this Inset View

38030


38101


38200


38201


38202


38203


38211


38212


38213


38214


38140
Enter Member Info mode

38125
Edit info for this member

38146
Enter Group Info mode

38127
Edit info for this group

38141
Enter Property Info mode

38128
Edit info for this property

38142
Delete this member

38143
Move this member

38261
Rotate this member

38148
View minimum distance to this member

38390


38391


38150
Enter Joint Info mode

38126
Edit info for this joint

38152
View minimum distance to this joint

38181
Explode all framing elements into their individual components

38308
Select the given framing element in the Framing Manager

38327


188
Add the selected table to an inset view as annotation

198


33465
PLS-POLE - Analysis and design of wood, steel and concrete poles and frames and modular guyed masts

33457
CAISSON - Design of reinforced concrete pier foundations for poles

33452
TOWER - Analysis and design of steel latticed towers

33454
PLS-CADD - Complete line design program including terrain modeling, spotting and drafting

210
Zoom in

211
Zoom out

57617
Open this document

57618
Open this document

57619
Open this document

194


1
Only available when in a deformed geometry view

32957
Add a pole to the model

246
View from front

247
View from behind

250
View from top

32959
Add an element

32963
Move an element or insulator

32965
Delete an element or insulator

32960
Add an insulator

249
View from right

248
View from left

57011
Add program-generated dimension lines (annotations) to the Structure Inset View

57012


57013


57014


35901


35955


223


35987


35988


35989


33498


33499


33500


35933


33331


33332


33333


57643
Undo the last action

57644
Redo the previously undone action

35999


33353
Open an existing document

33354
Close the active document

33355
Save the active document

33356
Save the active document with a new name

38367
Save the active document to the Reference Manager

35990
Upload the active document to Google Drive

38018


33357
Appends the document to another document

38019


33358
Save the selection to a file

33359
Append the selection to a file

44004


44003


35969


33502


35918


35945


35946


33400
Cut the selection and put it on the Clipboard

33401
Copy the selection and put it on the Clipboard

33402
Insert Clipboard contents

33407
Fill the selection by repeatedly pasting Clipboard contents

33406
Fill selection by repeating pattern in clipboard.  Ex: Clipboard containing rows '1A' and '2B' fills selection with '3C' '4D' '5E'...

38079
Fill column with copies of current selection

3513
Prepend current Clipboard contents to the selection

33467
Append current Clipboard contents to the selection

33408
Clear the selection.

33474
Search the table for a specified string of characters

33475
Repeat find operation searching for next occurence

33404
Remove the selected row.

33405
Insert a row after the current one

38061


33489
Copy the selection including column and row headings and put it on the Clipboard

33409
Generate a report window with table (may use this to print)

33445
Export the table to an ODBC database.

33488


33484


33501


44001


44002


44005


44006


47001


47002


47003


47004


1 ; multiline
789
Licensed Design Modules

789
Concrete

789
Steel

789
Wood

789
Modular Mast / Laminated Wood

789
FRP

789
OK

789
View License

789
CAISSON

789
Distribution

109
&Show Tips on StartUp

109
&Next Tip

109
&Close

109
Did you know?

109
Tip of the Day

962
File Information

962
File name:

962
Created by:

962
Registered to:

962
File type:

962
Last modified:

516
Update Graphics and Check Model

516
&OK

516
&Cancel

516
&Transpose

516
&Edit Properties

949
Do not use post processor                                         

949
Write post processor file                                              

949
Write file and run post processor

949
Write XML post processor file                                              

949
Write XML file and run post processor

949
Automatically save structure model to disk before running the analysis

949
Wait for post processor to complete before continuing (can cause program to hang)

949
Do not write filename on command line                

949
Write filename before command line arguments

949
Write filename after command line arguments 

949
US

949
SI

949
Consistent SI

949
OK

949
Cancel

949
Post Processor File Name Options

949
After an analysis the program can write its results in a machine readable form and pass them to a post processor for further analysis.  If you have such a post processor, select its executable and enter its command line arguments below:

949
Select post processor executable (the program will try the path entered first then the application directory).

949
Enter command line arguments to be passed to the post processor

949
Select a name for the output file (if blank will use "postproc" in the PLS temporary directory)  Press delete to clear the name.

949
Post Processor Options

949
Post Processor Unit System

38104
Color

38104
 Cloud

38104
 Bold

38104
 Italic

38104
 Underline

38104
 Fill

38104
 Auto-resize

38104
&OK

38104
&Cancel

38104
X

38104
Y

38104
Z

38104
View

38104
Text

38104
Type

38104
Sheet Text Height

38104
Page

38104
Text Angle

38104
Sheet Line Width

38104
Line Type

38104
Justification

38104
Text Box Height (%)

38104
Text Box Width (%)

38104
Edit Annotation

939
Update Graphics and Check Model

939
OK

939
Cancel

939
Multiple Pole Selection

939
&Transpose

939
&Edit Properties

939
Note: poles may be located in one of two ways:

939
1)  By tip and base joint.  This is only appropriate for A-Frame, Y-Frame and other complicated structures.

939
2)  By X, Y and Z of base and X, Y inclination angles.  This should be used for single poles and simple frames.  For example, to locate a single pole at 0,0,0 leave the tip, base, X, Y, Z and X, Y angle columns all blank.

150
&OK

150
&Cancel

936
Save

936
Cancel

936
Save As

936
Wind loads on insulators and insulator weights included in Point Loads

936
Note that SF stands for Strength Factor, NOT Safety Factor

936
&Merge

936
Edit Loading Method Parameters

790
OK

790
Cancel

790
Unselect All

790
Sort By Height

790
Select the pole classes that should be run when an allowable spans or interaction diagrams analysis is run.

790
Current property

790
Select Pole Classes

509
&Save

509
Save &As

509
&Merge

509
&Report

509
&Cancel

509
&Transpose

509
From file

791
OK

791
Cancel

791
&Transpose

791
Joints need only be specified for complex structures such as A-Frames.  Do NOT input joints here for single poles or for the joints that lie along an element.  Instead, these joints can be specified as "relative joints" in the pole or arm tables below.

673
Include raster graphics

673
Include vector graphics (*.dxf)

673
Include parts and material (*.prt)

673
Include files referenced in parts and material

673
Include TIN models (*.tin)

673
Include files in Reference Manager

673
Compress backup file

673
Prompt to include additional models in backup

673
Transmit backup file to PLS for technical support

673
OK

673
Cancel

673
The following options allow you to include or exclude certain elements from your backup file in order to reduce its size.

673
Include Files In Backup

673
Include vector graphics

673
Include raster images

673
Backup Options

124
Enable Automatic Project Revision Tracking During Each Save

124
Calculate base plate strength usage

124
Design Check for Single Structure

124
Basic Allowable Spans

124
Create a Method 1 File for PLS-CADD

124
Allowable Spans Interactions Diagrams

124
Create a Method 2 File for PLS-CADD

124
Arms

124
Braces

124
Guys

124
Posts

124
Strains

124
Linear

124
Nonlinear

124
Conv. Options

124
OK

124
Cancel

124
Analysis Options

124
Project Title

124
Project Notes

124
Maximum Pole or Mast Segment Length

124
Use Pole Offsets For

124
Fixity Point as a % of Buried Length

124
Analysis Type

124
Strength Check For Steel and FRP Poles

124
Load Type

124
Strength Check For Wood Poles

124
PLS-CADD Comment

124
Z of ground for wind height adjust and PLS-CADD centerline

124
Voltage

124
Client ID

124
General Data

38319
&Close

38319
Power Line Systems

166
Current directory

166
New Directory

166
Pick Directory

166
OK

166
Cancel

166
Quick Restore

166
Show File Names

166
Change Common Directory Path

166
The current directory column contains the directories that your project was backed up from.\nIf you want the project restored to different directories, select them in the new directory column.\nUse Quick Restore to restore all files to a single directory.

166
Directory Mapping For Restore

950
&No

950
&Always

950
&Yes

950
&Never

950
Restore Backup of Bid#24-26446_AEP_ ASHDOWN- 12th STREET Distribution Arms .bak

933
Power\nLine Systems'\nName

933
User's Name

933
Table Format

933
Report Format

933
Report Display\nOrder\n(0 to hide)

933
Power Line Systems' Tip

933
User's Tip

933
Simple Customizations (Show/Hide Columns)

933
Advanced Customizations (Column order, Formatting, Translation...)

933
Include in report

933
Include in XML export

933
OK

933
Cancel

933
PLS title

933
User title

933
Customizations saved to file:

933
Customize "Steel Pole Properties"

3447
String

3447
Integer

3447
Unsigned Integer

3447
Real

3447
Left Aligned

3447
Right Aligned

3447
Decimal (e.g. 1.2345)

3447
Scientific (e.g. 1.234e003)

3447
Shortest of Decimal and Scientific

3447
OK

3447
Cancel

3447
Data Type

3447
Data Width

3447
Alignment

3447
Notation

3447
Minimum number of characters - will add blank characters if needed to reach this number

3447
For Decimal enter maximum number of digits to the right of the decimal point.  For Scientific enter number of significant digits.

3447
Data Formatting

933
Customize "Steel Tubes Properties"

0 ; multiline
789
Click here to visit Power Line Systems web site

789
Information about new versions only displayed when server path entered in File/Preferences

516
Your model is too large or your computer too slow to update this model automatically.  Press this button whenever you want the graphics updated or the model checked.

949
Select this to prevent writing the post processor file and running the post processor program

949
Select this to have only the post processor file written

949
Select this to have the post processor file written and the post processor program executed

949
Select this to have only the post processor file written in XML format

949
Select this to have the post processor file written in XML format and the post processor program executed

949
Select the executable to run after an analysis

949
Select the name of the output post processor file or leave blank to use the default of "postproc" in the PLS temporary directory defined in preferences

949
Enter the arguments to put on the command line of the post processor

949
You should check this box if the postprocessor reads the structure file so that any changes you made to the model will get passed on to the postprocessor

949
Check this box to have the program stall until the postprocessor completes.  Not recommended.

949
Select this to prevent writing the post processor file name on the command line

949
Select this to write the post processor file name before the command line arguments

949
Select this to write the post processor file name after the command line arguments

949
Select this to have the output file written in US

949
Select this to have the output file written in SI units that match what the program displays in reports and tables

949
Select this to have the output file written in consistent SI units (i.e. N instead of KN)

38104
None to start a new line or for text, line to draw line to previous record, or close to form closed polygon with previous records

38104
How to justify text relative to specified coordinates

38104
Thickness of pen used to draw lines.  Set to 0 to use thickness from Drafting/Text Size, Line Width, Style, Color and Layer...

38104
Type of line to draw

38104
Check this to make your text annotation bold

38104
Check this to make your text annotation italic

38104
Check this to make your text annotation underline

38104
Check this to fill your polygon. (This will require the polygon to be type closed.

38104
Check this to auto resize the text based on drawn rectangle

38104
%p=%allpage=current page of all sheets,%q=%allpagetotal=total number pages in all sheets,%partitionpage=current page in subsection,%partitionpagetotal=total number of pages in subsection,%n=project name,%m=project dir, %L=line name, %d=date,%t=time,%s1=start station,%s2=stop station,%s3=start struct.,%s4=stop struct, %Cx=Line x in Criteria notes, %Rx=Line x in Project notes, %dim=distance between dimension line end points (optionally followed by desired digits after decimal like %dim0 or %dim2), %username=name of current user, %version=name and version of this program.

939
Your model is too large or your computer too slow to update this model automatically.  Press this button whenever you want the graphics updated or the model checked.

509
Enter any notes regarding the source of this data, last revision, strength or drag area factors included etc.

673
Raster image overlays (*.bmp;*.dib;*.tif;*.tiff;*.jpg;*.jpeg;*.png) can be very large and can be excluded from the backup file to reduce file size.

673
DXF overlays can be excluded from the backup file to reduce file size.

673
In general, part files should be included, but may be excluded if you are making several backup files and you know the file was included in another backup file.

673
Files referenced by parts and materials are not required for this software, but may be useful to include for archiving or sharing with others.

673
Include all files attached in the Reference Manager.

673
If the backup file is compressed, it will become a pure binary file that is smaller, but that takes more time to backup and restore.

673
If checked you will be prompted to include additional models in your backup file.

673
If checked you will be asked if you want to transmit the backup file to Power Line Systems and additional diagnostic information will be included

124
This title will be printed in all output reports and is included in the Construction Staking Report in PLS-CADD

124
Check this to have the program generate a list in the project report of everything that has changed since the previous File/Save.

124
Poles or Masts will be broken into beams of length not greater than this

124
Maximum voltage of conductor this structure is designed to support

124
Enter the number for the Client ID for this project.

124
Enter the elevation that corresponds to centerline ground in PLS-CADD (this is almost always 0.0).  Note: does not apply to telecommunications structures.

124
Select the appropriate check: ANSI 2002/2008 includes a reduction of fiber stress with height, Entire pole checks the pole with a constant fiber stress, Ground only checks the pole only at the base

124
Select the appropriate check for the analysis you are performing.  TIA/EIA 222 should only be used for monopole communications structures

124
Check to have the strength usage of base plates checked (recommended).

124
Select the type of loads to apply to this structure

124
Select this option to perform a design check of the structure under vector or EIA loads

124
Select this option to find the allowable spans for the structure using wire loads

124
Select this option to find the allowable spans for the structure using wire loads and write them to a PLS-CADD structure file

124
Select this option to find allowable spans for a range of weight to wind span ratios

124
Select this option to find allowable spans for a range of weight to wind span ratios and write them to a PLS-CADD structure file

124
Check to connect davit arms at the face of the pole instead of at centerline (Note: cross arms are not offset)

124
Check to connect braces at the face of the pole instead of at centerline

124
Check to connect guys at the face of the pole instead of at centerline

124
Check to connect post insulators at the face of the pole instead of at centerline

124
Check to connect strain insulators at the face of the pole instead of at centerline

124
Always select nonlinear if you have guys, 2-part insulators, or want the most accurate buckling check

166
Show list of all files contained in the backup file

166
Change common paths to a new directory path

166
Click here to use browser to select new directory

933
Allows you to control which columns are displayed

933
Allows you to control column display order, number formatting and language translation

933
Enter the title you would like to see for this schema or leave blank to use the built in title

933
If unchecked the data in this table will not be printed, but will still be available via the Right Click Table View/XML Export commands

933
If unchecked the data in this table will not be included in any XML export of multiple tables

933
right-aligned number, with at least 9 characters with 4 to the right of the decimal point, in the shortest of decimal and scientific notation

3447
Select this option for formatting a string of characters.

3447
Select this option for formatting integers.

3447
Select this option for formatting values that are unsigned integers.

3447
Select this option for formatting real numbers.

3447
Select this option for a left-aligned display.

3447
Select this option for a right-aligned display.

3447
Select this option to have a decimal notation.

3447
Select this option to have a scientific notation.

3447
Select this option to have a shortest of decimal and scientific notation.

933
right-aligned number, with at least 7 characters with 4 to the right of the decimal point, in the shortest of decimal and scientific notation

933
right-aligned number, with at least 7 characters with 2 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 7 characters with 5 to the right of the decimal point, in the shortest of decimal and scientific notation

933
right-aligned number, with at least 7 characters with 3 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 10 characters with 6 to the right of the decimal point, in the shortest of decimal and scientific notation

933
right-aligned number, with at least 9 characters with 2 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 10 characters with 2 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 9 characters with 5 to the right of the decimal point, in the shortest of decimal and scientific notation

933
right-aligned number, with at least 7 characters with 6 to the right of the decimal point, in the shortest of decimal and scientific notation

933
right-aligned number, with at least 9 characters with 4 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 10 characters with 4 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 12 characters with 3 to the right of the decimal point, in a decimal notation

933
Type in the order you want the columns printed in (1 = first column, 2 = 2nd etc)  Enter 0 to have a column hidden

933
right-aligned number, with at least 8 characters with 4 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 9 characters with 5 to the right of the decimal point, in a decimal notation

933
right-aligned number, with at least 10 characters with 5 to the right of the decimal point, in a decimal notation

0 ; multiline
3 'Directory Mapping For Restore166_131'
0 0 0 
7 'Edit Customizations933_131'
0 0 0 0 0 0 0 
1 ; # dialogs
124 -2560 -2275 737 'Edit Annotation38104'
