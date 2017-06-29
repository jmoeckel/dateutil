within DateUtil;
function getime_as_vector

  output Integer[7] M;

protected
  Integer ms "Millisecond";
  Integer sec "Second";
  Integer min "Minute";
  Integer hour "Hour";
  Integer day "Day";
  Integer mon "Month";
  Integer year "Year";

algorithm
  (ms, sec, min, hour, day, mon, year) :=Modelica.Utilities.System.getTime();

  M :={year,mon,day,hour,min,sec,ms};

end getime_as_vector;
