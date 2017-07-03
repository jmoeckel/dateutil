within DateUtil;
function day_of_year
  "Returns for a date, given by a year, a month, and a day, the number of days, 
  that has already passed in this year - including the given day (i.e. January,
  2nd will result in 2). Leap years are considered."

  input Integer Y "Year";
  input Integer M "Month";
  input Integer D "Day";

  output Integer nDays "Number of days that has passed since Januar, 1st of the year 'Y'.";

protected
    Integer[12] DpM = {31,28,31,30,31,30,31,31,30,31,30,31} "Days per Month";

algorithm

  if DateUtil.is_leapyear(Y) then
    DpM[2] :=DpM[2] + 1;
  end if;

  assert(D<=DpM[M],"'day_of_year()': Bad combination of inputs 'D' and 'M' -> 'D' is too big.", AssertionLevel.error);

  nDays :=sum(DpM[1:M - 1]) + D;
                               //sum over all days of all passed months + days of the current month

end day_of_year;
