within Tests;
function test_is_leapyear

  input String reportname = "";

protected
  Integer[5] Years = {1582, 1896, 2016, 2000, 1900};
  Boolean[5] Expctd = {false, true, true, true, false};
  Boolean Cmptd;

  Boolean result = true;

algorithm

  for i in 1:4 loop
    Cmptd := DateUtil.is_leapyear(Years[i]);

    if not Cmptd==Expctd[i] then
       Modelica.Utilities.Streams.print("  - 'is_leapyear()': Wrong output for input " + String(Years[i]) + ". Should be '" + String(Expctd[i]) + "', but is '" + String(Cmptd) + "'.",reportname);
       result :=false;
    end if;

  end for;

  if result then
    Modelica.Utilities.Streams.print("  - 'is_leapyear()': Each testcase passed!",reportname);
  end if;

end test_is_leapyear;
