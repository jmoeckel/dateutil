within Tests.DateUtil;
function test_compute_timegap

protected
  Integer[7] D1=.HumanBehaviour.Utilities.DateUtil.getime_as_vector();

  Integer Cmptd1=.HumanBehaviour.Utilities.DateUtil.compute_timegap(D1, D1);
  Integer Expctd1 = 0;

  Integer[3,7] Dates = [2017,2,28,0,0,0,0;
                        2017,2,28,0,0,0,5;
                        2017,2,26,23,59,59,995];

  Integer Cmptd;
  Integer[9,5] Expctd = [0,0,0,0,0;
                    0,0,0,0,5;
                    1,24,1440,86400,86400005;
                    0,0,0,0,5;
                    0,0,0,0,0;
                    1,24,1440,86400,86400010;
                    1,24,1440,86400,86400005;
                    1,24,1440,86400,86400010;
                    0,0,0,0,0];

  String[5] units = {"d","hr","min","sec","ms"};

algorithm

  assert(Cmptd1==Expctd1, "'compute_timegap': Wrong output for Cmptd1", AssertionLevel.warning);

  for i in 1:3 loop
    for j in 1:3 loop
      for k in 1:5 loop
        Cmptd :=.HumanBehaviour.Utilities.DateUtil.compute_timegap(
          Dates[i, :],
          Dates[j, :],
          units[k]);
        assert(Cmptd==Expctd[(i-1)*3+j,k], "'compute_timegap': Wrong output for test: " + String(i) + "," + String(j) + "," + String(k), AssertionLevel.warning);
      end for;
    end for;
  end for;

end test_compute_timegap;
