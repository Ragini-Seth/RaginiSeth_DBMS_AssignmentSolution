-- Ans 1.1: 
Create Table PASSENGER
(Passenger_name varchar(100),
Category varchar(10),
Gender varchar(1),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(10)
);

-- Ans 1.2:
Create Table PRICE
(
Bus_Type varchar(10),
Distance int,
Price int
);

-- Ans 2.1:
insert into PASSENGER values ('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into PASSENGER values ('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into PASSENGER values ('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into PASSENGER values ('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
insert into PASSENGER values ('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper');
insert into PASSENGER values ('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into PASSENGER values ('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper');
insert into PASSENGER values ('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into PASSENGER values ('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

-- Ans 2.2:
insert into PRICE values ('Sleeper',350,770);
insert into PRICE values ('Sleeper',500,1100);
insert into PRICE values ('Sleeper',600,1320);
insert into PRICE values ('Sleeper',700,1540);
insert into PRICE values ('Sleeper',1000,2200);
insert into PRICE values ('Sleeper',1200,2640);
insert into PRICE values ('Sleeper',1500,2700);
insert into PRICE values ('Sitting',500,620);
insert into PRICE values ('Sitting',600,744);
insert into PRICE values ('Sitting',700,868);
insert into PRICE values ('Sitting',1000,1240);
insert into PRICE values ('Sitting',1200,1488);
insert into PRICE values ('Sitting',1500,1860);

-- Ans 3:
Select count(Passenger_name) from PASSENGER where Gender='F' and Distance>=600;
Select count(Passenger_name) from PASSENGER where Gender='M' and Distance>=600;

-- Ans 4:
Select Min(Price) from PRICE where Bus_Type='Sleeper';

-- Ans 5: 
Select Passenger_name from PASSENGER where Passenger_name like 'S%';

-- Ans 6: 
Select PS.Passenger_name, PS.Boarding_City, PS.Destination_City, PS.Bus_Type, PR.Price
from PASSENGER PS inner join Price PR on PS.Bus_Type=PR.Bus_Type and PS.Distance=PR.Distance;

-- Ans 7:
Select PS.Passenger_name, PR.Price
from PASSENGER PS inner join Price PR on PS.Bus_Type=PR.Bus_Type and PS.Distance=PR.Distance
where PS.Distance>1000 and PS.Bus_Type='Sitting';

-- Ans 8:
Select PR.Bus_Type, PR.Price
from PASSENGER PS inner join Price PR on  PS.Distance=PR.Distance
where 
PS.Distance=(Select Distance from PASSENGER where Boarding_City in ('Bengaluru','Panaji') and 
Destination_City in ('Bengaluru','Panaji') and Boarding_City<> Destination_City)
and PS.Category=(Select Category from PASSENGER where Passenger_Name='Pallavi');

-- Ans 9: 
Select Distinct (Distance) from PASSENGER order by Distance desc;

-- Ans 10: 
Select Passenger_Name, (Distance*100/(Select sum(Distance) from PASSENGER)) Percent_Distance 
from PASSENGER;

-- Ans 11: 
Select Distance, Price, CASE
    WHEN Price > 1000 THEN 'Expensive'
    WHEN Price <1000 and Price>500 THEN 'Average Cost'
    ELSE 'Cheap'
END AS Category from Price;
 

