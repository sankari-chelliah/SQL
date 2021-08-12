#Table person has id(primary key), email -> delete rows that have same email, retain 1 copy with lowest id number

delete 
from person 
where id not in (select min(id) from person group by email);
