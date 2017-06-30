within Tests;
function test_is_leapyear

  input String reportname = "";

protected
  Integer[5] Years = {1582, 1896, 2016, 2000, 1900};
  Boolean[5] Expctd = {true, true, true, true, false};
  Boolean[5] Cmptd;


algorithm

  for i in 1:4 loop
    Cmptd[i] := DateUtil.is_leapyear(Years[i]);

    if not Cmptd[i]==Expctd[i] then
       Modelica.Utilities.Streams.print("'is_leapyear': Wrong output for year " + String(Years[i]),reportname);
    end if;

  end for;

end test_is_leapyear;
