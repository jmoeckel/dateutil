within Tests;
function test_get_time

  input String reportname = "";

protected
  Integer[7] Cmptd = DateUtil.get_time();

  Integer[7] MinMax = {2017,12,31,23,59,59,999};

    Boolean result = true;
algorithm

  //Mostly check, if the format of Modelica.Utilities.System.getTime() has been changed
  if Cmptd[1]<MinMax[1] then
    Modelica.Utilities.Streams.print("  - 'get_time()': Wrong output for index " + String(1) + ". Should be greater than '" + String(MinMax[1]) + "', but is '" + String(Cmptd[1]) + "'.",reportname);
    result :=false;
  end if;


  for i in 2:7 loop

    if Cmptd[i]>MinMax[i] then
      Modelica.Utilities.Streams.print("  - 'get_time()': Wrong output for index " + String(i) + ". Should be smaller than '" + String(MinMax[i]) + "', but is '" + String(Cmptd[i]) + "'.",reportname);
      result :=false;
    end if;

  end for;

  if result then
    Modelica.Utilities.Streams.print("  - 'get_time()': Each testcase passed!",reportname);
  end if;



end test_get_time;
