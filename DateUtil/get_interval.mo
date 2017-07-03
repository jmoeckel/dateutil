within DateUtil;
function get_interval "Computes the interval between two dates. Given dates must not be ordered 
  (i.e. second input might be earlier or later than first). Unit of the interval 
  is hours by default, but can be adapted."

  input Integer[7] D1 "First date, format: {year, month, day, hour, minute, second, milisecond}";
  input Integer[7] D2 "Second date, format: {year, month, day, hour, minute, second, milisecond}";
  input String unit = "hr" "Unit of the computed interval. Must be in {'d','hr', 'min', 'sec', 'ms'}";

  output Integer interval "Interval between the dates 'D1' and 'D2' in unit 'unit'.";

protected
  Integer[7] L "Later";
  Integer[7] E "Earlier";

  Integer[4] fullDay = {24,60,60,1000};
  Integer[4] clockE;
  Integer[4] clockL;
  Integer[4] remtime_E;
  Integer[4] difftime;

  Integer L_nDays;
  Integer E_nDays;
  Integer nDays;
  Integer year;
  Integer keepOne;

algorithm

  if Modelica.Math.Vectors.isEqual(D1,D2) then
    interval :=0;

  else
    //Detemine, which date is the later one
    for i in 1:7 loop
      if D1[i]>D2[i] then
        L :=D1;
        E :=D2;
        break;
      elseif D1[i]<D2[i] then
        L :=D2;
        E :=D1;
        break;
      else
         //continue
      end if;
    end for;

    //Clocks
    clockE :=E[4:7];
    clockL :=L[4:7];

    //Day of year
    L_nDays := DateUtil.day_of_year(
      L[1],
      L[2],
      L[3]);
    E_nDays := DateUtil.day_of_year(
      E[1],
      E[2],
      E[3]);

    //interval in days
    if L[1] == E[1] then
      nDays :=L_nDays - E_nDays;
    else
      nDays :=.DateUtil.days_in_year(E[1]) - E_nDays;
      year :=E[1] + 1;

      while year<L[1] loop
        nDays :=nDays + DateUtil.days_in_year(year);
        year :=year + 1;
      end while;

      nDays :=nDays + L_nDays;
    end if;

    //Consider clocktime
    keepOne :=0;
    for i in 4:-1:1 loop
      if i==4 then
        remtime_E[i] :=fullDay[i] - (clockE[i]);
      else
        remtime_E[i] :=fullDay[i] - (clockE[i] + 1);
      end if;

      difftime[i] :=remtime_E[i] + clockL[i] + keepOne;

      if difftime[i]>=fullDay[i] then
        difftime[i] :=difftime[i] - fullDay[i];
        keepOne :=1;
      else
        keepOne :=0;
      end if;
    end for;

    //if keepOne ==0, reduce nDays by one, as there is no full day given by clocks
    if keepOne==0 then
      nDays :=nDays - 1;
    end if;

    //adapt the output
    if unit == "d" then
      interval :=nDays;
    elseif unit == "hr" then
      interval :=nDays*24 + difftime[1];
    elseif unit == "min" then
      interval :=nDays*1440 + difftime[1]*60 + difftime[2];
    elseif unit == "sec" then
      interval :=nDays*86400 + difftime[1]*3600 + difftime[2]*60 + difftime[3];
    else
      interval :=nDays*86400000 + difftime[1]*3600000 + difftime[2]*60000 + difftime[4];
    end if;

  end if;

end get_interval;
