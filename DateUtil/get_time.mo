within DateUtil;
function get_time
  "Returns the current timestamp (year to miliseconds) as a vector. Uses Modelica.Utilities.System.getTime()"

  output Integer[7] M "Vector contains the current timestamp: [year, month, day, hour, minute, second, milisecond]";

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

end get_time;
