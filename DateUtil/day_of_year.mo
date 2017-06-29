within DateUtil;
function day_of_year

  input Integer Y;
  input Integer M;
  input Integer D;

  output Integer nDays;

protected
    Integer[12] DpM = {31,28,31,30,31,30,31,31,30,31,30,31};

algorithm

  if DateUtil.is_leapyear(Y) then
    DpM[2] :=DpM[2] + 1;
  end if;

  assert(D<=DpM[M],"'day_of_year': Bad input for 'D' and/or 'M' -> 'D' is too high.", AssertionLevel.error);

  nDays :=0;

  for i in 1:M-1 loop
    nDays :=nDays + DpM[i];
  end for;

  nDays :=nDays + D;

end day_of_year;
