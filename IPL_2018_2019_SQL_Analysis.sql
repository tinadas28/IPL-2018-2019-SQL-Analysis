/*Which bowler took the most wickets in IPL 2018*/
SELECT Player, Wkts 
FROM `tina143.Ipl_analysis.2018_Bowlers`
ORDER BY Wkts DESC 
LIMIT 10;

/*Which bowler took the most wickets in IPL 2019*/
SELECT Player, Wkts 
FROM `tina143.Ipl_analysis.2019_Bowlers`
ORDER BY Wkts DESC 
LIMIT 10;

/*Which batsmen scored the most runs in IPL 2018*/
SELECT Player, Runs
FROM `tina143.Ipl_analysis.2018_Batsmen`
ORDER BY Runs DESC 
LIMIT 10;

/*Which bowler took the most wickets in IPL 2018 while maintaining an economy rate below 7*/
SELECT 
Player, Wkts, E_R AS Economy_Rate
FROM `tina143.Ipl_analysis.2019_Bowlers`
WHERE E_R < 7
ORDER BY Wkts DESC 
LIMIT 10;

/*Which batsmen hit the most boundaries in IPL 2018*/
SELECT Player,Fours, Sixes,
(Fours + Sixes) AS TotalBoundaries 
FROM `tina143.Ipl_analysis.2018_Batsmen`
ORDER BY TotalBoundaries DESC 
LIMIT 10;

/*Who scored the most runs in IPL 2018 while maintaining a strike rate of at least 130*/
SELECT Player,Runs,S_R AS Strike_Rate
FROM `tina143.Ipl_analysis.2018_Batsmen`
WHERE S_R >= 130
ORDER BY Runs DESC 
LIMIT 10;

/*Which batsmen hit the most fours in IPL 2019*/
SELECT Player, Fours
FROM `tina143.Ipl_analysis.2019_Batsmen`
ORDER BY Fours DESC 
LIMIT 10;

/*Which bowlers conceded the fewest runs per over in IPL 2019*/
SELECT 
Player, E_R AS Economy_Rate
FROM `tina143.Ipl_analysis.2019_Bowlers`
WHERE E_R IS NOT NULL
ORDER BY E_R ASC 
LIMIT 10;

/*Which batsmen scored the most half-centuries across IPL 2018 and 2019 combined*/
WITH combined AS ( SELECT Player, `50s` AS  HalfCenturies 
FROM `tina143.Ipl_analysis.2018_Batsmen` 
UNION ALL 
SELECT Player, `50s` AS  HalfCenturies 
FROM `tina143.Ipl_analysis.2019_Batsmen`
)
SELECT Player, SUM(HalfCenturies) AS TotalHalfCenturies 
FROM combined
GROUP BY Player 
ORDER BY TotalHalfCenturies DESC 
LIMIT 10;
