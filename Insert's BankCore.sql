insert into clients(first_name, last_name, tax_id, email)
values ('alisher', 'rahimov', 100200301, '100200301'),
(N'Мадина', N'Саидова', 400500602, 'madina@mail.tj'),
(N'Иван', N'Петров', 700800903, 'ivan@mail.ru');

insert into Accounts(client_id, AccNumber, Currency, balance, status)
values (1, '2020297200001', 'TJS', 5000.00, 'Active'),
(2, '2020297200002', 'TJS', 10500.50, 'Active'), 
(3, '2020281000003', 'RUB', 85000.00, 'Active');

insert into cards(Account_id, Card_number, Expiry_Date, CVV, is_pinned)
values(1, '4444555566667777', '2028-12-31', '123', 1),
(3, '5555666677778888', '2027-06-01', '999', 0);

insert into Deposits(AccountID, InterestRate, StartDate, MaturityDate, InitialAmount, status)
values(3, 12.50, '2026-01-01', '2027-01-01', 50000.00, 'Active');

insert into Loans(client_id, total_amount, interest_rate, TerMonths)
values (2, 20000.00, 18.00, 24);

insert into LoanPayments(LoanID, Amount, PrincipalAmount, InterestAmount)
values(1, 1000.00, 700.00, 300.00);

insert into Transactions(from_account_id, to_account_id, amount, Transaction_Type)
values(1, 3, 1000.00, 'Transfer'),
(3, 2, 500.00, 'Payment');

insert into FraudLog(Transaction_ID, Reason, Risk_Level, is_confirmed)
values(1, N'High amount transfer', 5, 0);

INSERT INTO Branches (BranchName, City, Address) VALUES 
(N'Головной офис', N'Душанбе', N'пр. Рудаки 1'),
(N'Худжандский филиал', N'Худжанд', N'ул. Ленина 10'),
(N'Бохтарский офис', N'Бохтар', N'ул. Вахш 5');

INSERT INTO Clients (first_name, last_name, tax_id, email) VALUES 
(N'Сомон', N'Эмомали', 500100200, 'somon@bank.tj'),
(N'Зарина', N'Курбонова', 600200300, 'zarina@bank.tj'),
(N'Рустам', N'Азизов', 700300400, 'rustam@bank.tj');

UPDATE Accounts SET BranchID = 1 WHERE Account_ID % 2 = 0;
UPDATE Accounts SET BranchID = 2 WHERE BranchID IS NULL;

INSERT INTO Transactions (from_account_id, to_account_id, amount, Transaction_Type, Tran_date)
VALUES 
(1, 2, 50.00, 'Payment', '2025-06-10T08:30:00'),
(2, 3, 120.00, 'Transfer', '2025-06-11T08:30:00'),
(3, 1, 300.00, 'ATM', '2025-06-12T08:30:00'),
(1, 3, 450.00, 'Payment', '2025-06-13T08:30:00'),
(2, 1, 10.00, 'Transfer', '2025-06-14T08:30:00');


-----------------------------------------------------------------------
begin try
begin transaction

select * from students
where class_id=(select class_id from classes where class_name='5a')

insert into students(last_name, first_name, middle_name, gender, birth_date, phone, address, 
class_id = (select class_id from classes where class_name='5A'))
values ('aliev', 'vali', 'abduvaliev', 'мард', '2009-01-08', '+992369852147', 'Хуҷанд, кӯчаи 8', 5);

update students 
set class_id=(select class_id from classes where class_name='6A')
where class_id=(select class_id from classes where class_name='5A') and gender='мард'

update students
set class_id=(select class_id from classes where class_name='7A')
where class_id=(select class_id from classes where class_name='5A') and gender='зан'

delete from grades as g
where grade_value=2 and 

end try
begin catch
rollback
end catch


select * from students as s
join classes as c
on c.class_id = s.class_id