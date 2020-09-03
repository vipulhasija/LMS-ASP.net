Create Table Shelf_Details  
(  
    Shelf_id int PRIMARY KEY,  
    Shelf_No int,  
    Floor_No int  
);

Insert into Shelf_Details Values(1, 1, 1);  
Insert into Shelf_Details Values(2, 2, 10001);  
Insert into Shelf_Details Values(3, 1, 10002); 

CREATE TABLE Book_Details  
(  
    ISBN_Code int PRIMARY KEY,  
    Book_Titlevar char(100),  
    BookLanguage varchar(30),  
    Publisher_Id int,  
    No_Copies_Actual int,  
    No_Copies_Current int,  
    Category_id int,  
    Publication_year int,
	Shelf_Id int  
)  


ALTER TABLE Book_Details  
ADD CONSTRAINT Shelf_Id_FK FOREIGN KEY(Shelf_Id) REFERENCES Shelf_Details(Shelf_Id);

INSERT INTO Book_details  
VALUES(0006,'Programming Concept','English',2,20,15,2,2006,1);


INSERT INTO Book_details  
VALUES(0007,'Martial Gos Asura','English Translated',2,20,15,2,2006,3);


CREATE TABLE Publisher_details  
(  
    Publisher_id int PRIMARY KEY,  
    Publisher_Name varchar(50)  
)  

INSERT INTO Publisher_Details VALUES(1,'McGraw Hill');  
INSERT INTO Publisher_Details VALUES(2,'BPB Publication'); 

ALTER TABLE Book_details  
ADD CONSTRAINT Publisher_ID_FK FOREIGN KEY(Publisher_Id) REFERENCES Publisher_Details(Publisher_Id); 

CREATE TABLE Category_Details  
(  
    Category_Id int PRIMARY KEY,  
    Category_Name varchar(50)  
) 

INSERT INTO CATEGORY_DETAILS VALUES(1,'Database');  
INSERT INTO CATEGORY_DETAILS VALUES(2,'Programming Language'); 
INSERT INTO CATEGORY_DETAILS VALUES(3,'Fantasy Novel'); 


ALTER TABLE Book_details  
ADD CONSTRAINT Category_Id_FK FOREIGN KEY(Category_Id) REFERENCES Category_Details(Category_Id);


CREATE TABLE Staff_Details  
(  
    Staff_Id int PRIMARY KEY,  
    Staff_Name varchar(50),  
    Password varchar(16),  
    Is_Admin binary,  
    Designation varchar(20)  
) 

Insert into STAFF_DETAILS values (1,'Tarek Hossain','1234asd',0,'Lib_mgr');  
Insert into STAFF_DETAILS values (2,'Md.Kishor Morol','iloveyou',0,'Lib_clr');


Create Table VisitorCategory
(
Type_Id int Primary Key,
Type_description varchar(40)
)

Insert into VisitorCategory Values(1,'STAFF');
Insert into VisitorCategory Values(2,'REGISTORED');
Insert into VisitorCategory Values(3,'NOT-REGISTERED');

Create TABLE Visitor_Details  
(  
    Visitor_Id varchar(10) PRIMARY KEY,  
    Visitor_Name varchar(50),  
    Sex Varchar(20),  
    Date_Of_Birth date,  
    Interest varchar(10),  
    contact_Number varchar(11),
	VisitorType int
)

Alter table Visitor_Details 
Add Constraint FK_Visitor_Type
Foreign Key (VisitorType) References VisitorCategory(Type_Id);

Insert into Visitor_DETAILS values ('13-23059-1','Ahmed,Ali','Male','05-Oct-1995','CSSE','01681849871',1);  
Insert into Visitor_DETAILS values ('13-23301-1','MOrol MD.Kishor','Male','03-Jan-1994','CSE','01723476554',2);  

CREATE TABLE Book_Issue_Summary  
(  
	Request_ID int IDENTITY(1, 1) ,
    Borrower_Id  varchar(10) not null,  
    Book_Id int,  
    Borrowed_From date not null,  
    Borrowed_TO date not null,  
    Actual_Return_Date date,  
    Issued_by int  
) 

ALTER TABLE Book_Issue_Summary 
ADD CONSTRAINT Book_Id_FK FOREIGN KEY(Book_Id) REFERENCES Book_Details(ISBN_Code); 

ALTER TABLE Book_Issue_Summary  
ADD CONSTRAINT Issued_by_FK FOREIGN KEY(Issued_by) REFERENCES Staff_Details(Staff_Id);

ALTER TABLE Book_Issue_Summary  
ADD CONSTRAINT Issued_TO_FK FOREIGN KEY(Borrower_Id) REFERENCES Visitor_Details(Visitor_Id);

Insert into Book_Issue_Summary VALUES('13-23059-1',0007,'01-Aug-2014','7-Aug-2014','7-Aug-2014',1);  
Insert into Book_Issue_Summary VALUES('13-23059-1',0006,'02-Aug-2014','8-Aug-2014',NULL,1)  ;



  