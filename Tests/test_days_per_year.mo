within Tests.DateUtil;
function test_days_per_year

protected
  Integer[2] Ys = {2017,2016};

  Integer[2] Expctd = {365,366};
  Integer[2] Cmptd;

algorithm
  for i in 1:2 loop
    Cmptd[i] :=.HumanBehaviour.Utilities.DateUtil.days_per_year(Ys[i]);
    assert(Cmptd[i]==Expctd[i], "'days_per_year': Wrong output for test " + String(i), AssertionLevel.warning);
  end for;

end test_days_per_year;
