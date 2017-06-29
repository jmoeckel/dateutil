within HumanBehaviour.Utilities.DateUtil;
function days_per_year
  input Integer year;
  output Integer ndays;

protected
  Boolean gapyear=.HumanBehaviour.Utilities.DateUtil.is_gapyear(year);

algorithm

  ndays :=if gapyear then 366 else 365;

end days_per_year;
