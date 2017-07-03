within Tests;
function test_day_of_year

  input String reportname = "";

protected
  Integer tc = 5;

  Integer[tc] Ys = {2016, 2017, 1900,2017,2000};
  Integer[tc] Ms = {3,6,4,1,2};
  Integer[tc] Ds = {1,2,3,1,29};

  Integer[tc] Expctd = {61, 153,93, 1,60};
  Integer Cmptd;

  Boolean result = true;

algorithm

  for i in 1:tc loop
    Cmptd := DateUtil.day_of_year(
      Ys[i],
      Ms[i],
      Ds[i]);

    if not Cmptd == Expctd[i] then
      Modelica.Utilities.Streams.print("  - 'day_of_year()': Wrong output for testcase " + String(i) + ". Should be '" + String(Expctd[i]) + "', but is '" + String(Cmptd) + "'.",reportname);
      result :=false;
    end if;
  end for;

  if result then
    Modelica.Utilities.Streams.print("  - 'day_of_year()': Each testcase passed!",reportname);
  end if;

end test_day_of_year;
