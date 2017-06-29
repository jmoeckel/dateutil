within DateUtil;
function compute_timegap
  "Computes the timegap between two dates in a usergiven unit"

  input Integer[7] D1 "date 1";
  input Integer[7] D2 "date 2";
  input String unit = "hr" "Must be in {'d','hr', 'min', 'sec', 'ms'}";

  output Integer diff;

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

  String s;

algorithm

  if Modelica.Math.Vectors.isEqual(D1,D2) then
    diff :=0;

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

    //Daynumber
    L_nDays := DateUtil.day_of_year(
      L[1],
      L[2],
      L[3]);
    E_nDays := DateUtil.day_of_year(
      E[1],
      E[2],
      E[3]);

    //Diff in Days
    if L[1] == E[1] then
      nDays :=L_nDays - E_nDays;
    else
      nDays := .DateUtil.days_per_year(E[1]) - E_nDays;
      year :=E[1] + 1;

      while year<L[1] loop
        nDays := nDays + DateUtil.days_per_year(year);
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
      diff :=nDays;
    elseif unit == "hr" then
      diff :=nDays*24 + difftime[1];
    elseif unit == "min" then
      diff :=nDays*1440 + difftime[1]*60 + difftime[2];
    elseif unit == "sec" then
      diff :=nDays*86400 + difftime[1]*3600 + difftime[2]*60 + difftime[3];
    else
      diff :=nDays*86400000 + difftime[1]*3600000 + difftime[2]*60000 +
        difftime[4];
    end if;

  end if;

end compute_timegap;
