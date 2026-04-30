use BankCore

create table Clients(
	Client_id int primary key identity(1,1),
	first_name nvarchar(200) not null,
	last_name nvarchar(200) not null,
	tax_id int unique not null,
	email nvarchar(200),
	Registration_Date datetime default getdate()
);

create table Accounts(
	Account_id int primary key identity(1,1),
	client_id int foreign key references clients(client_id),
	AccNumber varchar(30) unique not null,
	Currency varchar(30) check(currency in ('USD', 'EUR', 'TJS', 'RUB')),
	balance decimal(18, 2) default 0.00,
	status varchar(18) default 'Active' check(status in ('Active', 'Blocked'))
);

create table cards(
card_id int primary key identity(1,1),
Account_id int foreign key references Accounts(account_id),
Card_number nvarchar(20) not null,
Expiry_Date Date not null,
CVV varchar(10),
is_pinned bit default 0
);

create table Transactions(
	Transaction_id int primary key identity(1,1),
	from_account_id int foreign key references accounts(account_id),
	to_account_id int foreign key references accounts(account_id),
	amount decimal(18, 2) check(amount > 0),
	Transaction_Type varchar(15) check (Transaction_Type in ('Transfer', 'ATM', 'Payment')),
	Tran_date datetime default getdate()
);

create table Loans(
	Loan_id int primary key identity(1,1),
	client_id int foreign key references clients(client_id),
	total_amount decimal(18, 2) not null,
	interest_rate decimal(5, 2),
	TerMonths int,
	start_date datetime default getdate()
);


create table FraudLog(
	Log_id int primary key identity(1,1),
	Transaction_ID int foreign key references Transactions(Transaction_ID),
	Reason nvarchar(250),
	Risk_Level int check (risk_level between 1 and 10),
	detect_date datetime default getdate(),
	is_confirmed bit default 0
);


create table Branches(
    BranchID int primary key identity(1,1),
    BranchName nvarchar(100) not null,
    City nvarchar(50) not null,
    Address nvarchar(255) 
);

alter table Accounts add BranchID int foreign key references Branches(BranchID);
alter table Loans add BranchID int foreign key references Branches(BranchID);


	---------------------------------------------------------------
use school;

select * from classes;

-- 3
select s.last_name, s.first_name, g.grade_value, l.lesson_date from grades as g
join students as s
on s.student_id = g.student_id
join lessons as l
on l.lesson_id = g.lesson_id
where g.grade_value IN ('А', 'В', '4', '5') 
order by l.lesson_date desc;

-- 4
select distinct c.class_name, count(s.student_id) as student_count from students as s
join classes as c
on c.class_id = s.class_id
where c.class_name in ('7A', '8A')
group by c.class_name;

-- 5
select t.last_name, t.first_name, count(cs.subject_id) as subject_count from class_subjects as cs
join teachers as t
on t.teacher_id = cs.teacher_id
group by t.last_name, t.first_name ;

-- 6
select c.class_name, count(weekly_hours) as total_weekly from class_subjects as cs
join classes as c
on cs.class_id = c.class_id
group by c.class_name
;