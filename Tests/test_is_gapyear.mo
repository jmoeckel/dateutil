within Tests.DateUtil;
function test_is_gapyear

protected
  Integer[5] Years = {1578, 1576, 2016, 2000, 1900};
  Boolean[5] Expctd = {false, true, true, true, false};
  Boolean[5] Cmptd;

algorithm

  for i in 1:4 loop
    Cmptd[i] :=.HumanBehaviour.Utilities.DateUtil.is_gapyear(Years[i]);
    assert(Cmptd[i]==Expctd[i], "'is_gapyear': Wrong output for year " + String(Years[i]), AssertionLevel.warning);
  end for;

end test_is_gapyear;
