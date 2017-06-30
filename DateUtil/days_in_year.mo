within DateUtil;
function days_in_year
  "Returns the number of days in a year: 365 or in case of a leap year 366."

  input Integer year "Year that should be considered";
  output Integer ndays "Number of days in the given year.";

protected
  Boolean leapyear= DateUtil.is_leapyear(year);

algorithm

  ndays :=if leapyear then 366 else 365;

end days_in_year;
