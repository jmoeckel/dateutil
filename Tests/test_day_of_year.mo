within Tests.DateUtil;
function test_day_of_year

protected
  Integer[4] Ys = {2016, 2017, 1900,2017};
  Integer[4] Ms = {3,6,4,1};
  Integer[4] Ds = {1,2,3,1};

  Integer[4] Expctd = {61, 153,93, 1};
  Integer[4] Cmptd;

algorithm
  for i in 1:4 loop
    Cmptd[i] :=.HumanBehaviour.Utilities.DateUtil.day_of_year(
      Ys[i],
      Ms[i],
      Ds[i]);
    assert(Cmptd[i]==Expctd[i], "'day_of_year': Wrong output for test " + String(i), AssertionLevel.warning);
  end for;

end test_day_of_year;
