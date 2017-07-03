within Tests;
function test_get_interval

 input String reportname = "";

protected
  Integer[7] D1 = DateUtil.get_time();

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

  Boolean result = true;

algorithm

  for i in 1:3 loop
    for j in 1:3 loop
      for k in 1:5 loop
        Cmptd :=DateUtil.get_interval(
          Dates[i, :],
          Dates[j, :],
          units[k]);

        if not Cmptd == Expctd[(i-1)*3+j,k] then
          Modelica.Utilities.Streams.print("  - 'get_interval()': Wrong output for testcase (" + String(i) + "," + String(j) + "," + String(k) + "). Should be '" + String(Expctd[(i-1)*3+j,k]) + "', but is '" + String(Cmptd) + "'.",reportname);
          result :=false;
        end if;

      end for;
    end for;
  end for;

  if result then
    Modelica.Utilities.Streams.print("  - 'get_interval()': Each testcase passed!",reportname);
  end if;

end test_get_interval;
