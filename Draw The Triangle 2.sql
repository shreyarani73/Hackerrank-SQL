select rpad('* ',  level*2, '* ')
from dual
connect by level<=20;