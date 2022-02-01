/*Trips:
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | date     |     
+-------------+----------+
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+. */




with total_trips(total_trips_day, each_day) as (
            select count(id), request_at 
            from trips
            where client_id in (select users_id from users where banned='no')
            and driver_id in (select users_id from users where banned='no')
            group by request_at),
            
    cancel_trips(cancel_trip_day, each_day) as (
           select count(id), request_at
           from trips
           where status like 'cancel%'
           and client_id in (select users_id from users where banned='no')
           and driver_id in (select users_id from users where banned='no')
           group by request_at)
           
select total_trips.each_day as 'Day', round(nvl(cancel_trips.cancel_trip_day/total_trips.total_trips_day,0.00),2) as 'Cancellation_rate'
from total_trips left join cancel_trips
on total_trips.each_day = cancel_trips.each_day;
