within DateUtil;
function is_leapyear "Returns true, if the given year is a leap year, otherwise false. 
  Considers years before 1582 but not before 0"

  input Integer year;
  output Boolean isLeapYear;

algorithm

   if (mod(year,4) == 0) then

      if (year < 1582) then
         isLeapYear:=true;
      else

        if not (mod(year,100) == 0) then
          isLeapYear :=true;
        else

          if mod(year,400) == 0 then
            isLeapYear :=true;
          else
            isLeapYear :=false;
          end if;

        end if;

      end if;

   else
     isLeapYear :=false;
   end if;

end is_leapyear;
