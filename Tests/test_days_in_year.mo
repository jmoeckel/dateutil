within Tests;
function test_days_in_year

  input String reportname = "";

protected
  Integer tc = 2;
  Integer[tc] Ys = {2017,2016};
  Integer[tc] Expctd = {365,366};
  Integer Cmptd;

  Boolean result = true;

algorithm
  for i in 1:tc loop
    Cmptd := DateUtil.days_in_year(Ys[i]);

    if not Cmptd == Expctd[i] then
      Modelica.Utilities.Streams.print("  - 'days_in_year()': Wrong output for testcase " + String(i) + ". Should be '" + String(Expctd[i]) + "', but is '" + String(Cmptd) + "'.",reportname);
      result :=false;
    end if;

  end for;

  if result then
    Modelica.Utilities.Streams.print("  - 'days_in_year()': Each testcase passed!",reportname);
  end if;

end test_days_in_year;
