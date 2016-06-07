function whos_demo
date_time = datestr(now);
 
C = strsplit(date_time,{'-',''});
get_date(C);

   function get_date(d)
      day = d{1};
      mon = d{2};
      year = d{3};
      whos
   end

end