within HumanBehaviour.Utilities.DateUtil;
function is_gapyear

  input Integer year;
  output Boolean isGapYear;

algorithm

   isGapYear :=false;
   if (mod(year,4) == 0) then
      if (year < 1582) then
         isGapYear:=true;

      else
        if not (mod(year,100) == 0) then
          isGapYear :=true;
        else
          if mod(year,400) == 0 then
            isGapYear :=true;
          end if;
        end if;
      end if;
   end if;

end is_gapyear;
