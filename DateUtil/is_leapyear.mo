within DateUtil;
function is_leapyear "Returns true, if the given year is a leap year, otherwise false. 
  Considers years after 1582 (gregorian calendar)"

  input Integer year;
  output Boolean isLeapYear;

algorithm

   assert(year>=1582, "This function only considers the gregorian calendar. Therefore, input 'year' must be equal or later than 1582.", AssertionLevel.error);

   if ((mod(year,4) == 0) and (mod(year,100)>0)) or (mod(year,400)==0) then
     isLeapYear :=true;
   else
     isLeapYear :=false;
   end if;

end is_leapyear;
