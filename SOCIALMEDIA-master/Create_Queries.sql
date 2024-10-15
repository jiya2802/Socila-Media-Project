CREATE SCHEMA social_media
GO
create database social_media
GO
Use social_media
GO
-- Users Table
CREATE TABLE dbo.users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    user_name VARCHAR(255) UNIQUE,
    dob DATE,
    bio NVARCHAR(MAX),
	image_url NVARCHAR(MAX),
    email VARCHAR(255),
    contact VARCHAR(15),
    password VARBINARY(MAX),
    account_status INT DEFAULT 0, -- 0 stands for public & 1 stands for private account
    created_at DATETIME DEFAULT GETDATE(),
    edited_at DATETIME DEFAULT GETDATE(),
    active_yn INT DEFAULT 1
);
ALTER TABLE users
ADD token VARCHAR(MAX)

ALTER TABLE users
ADD time_to_expire  DATETIME

ALTER TABLE users
ALTER COLUMN user_name VARCHAR(255)


INSERT INTO dbo.users (user_name, dob, bio, image_url, email, contact, password, account_status, created_at, edited_at, active_yn)
VALUES
('KhushiChugh', '1990-05-15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'https://example.com/john_profile.jpg', 'john@example.com', '1234567890', 0x1A2B3C4D5E6F, 0, GETDATE(), GETDATE(), 1),
('Jiya Lund', '1985-08-22', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'https://example.com/alice_profile.jpg', 'alice@example.com', '9876543210', 0x2B3C4D5E6F7A, 1, GETDATE(), GETDATE(), 1),
('Nidhi pinjani', '1992-03-10', 'Fusce pharetra ligula sit amet sapien tincidunt, eu pulvinar odio varius.', 'https://example.com/bob_profile.jpg', 'bob@example.com', '5551234567', 0x3C4D5E6F7A8B, 0, GETDATE(), GETDATE(), 1),
('Varsha Chhabria', '1988-12-05', 'Vestibulum eu odio eu arcu ultrices varius id id turpis.', 'https://example.com/emma_profile.jpg', 'emma@example.com', '1239876543', 0x4D5E6F7A8B9C, 0, GETDATE(), GETDATE(), 1),
('Vidhii Lulla', '1995-06-18', 'Maecenas vitae leo vel odio euismod convallis at eget lectus.', 'https://example.com/michael_profile.jpg', 'michael@example.com', '9995551234', 0x5E6F7A8B9C1D, 1, GETDATE(), GETDATE(), 1),
('Aashna Lulla', '1993-02-28', 'Sed euismod turpis nec tortor convallis efficitur.', 'https://example.com/olivia_profile.jpg', 'olivia@example.com', '3337771234', 0x6F7A8B9C1D2E, 0, GETDATE(), GETDATE(), 1),
('Simran Kingrani', '1990-10-15', 'Praesent pharetra quam at leo pharetra ullamcorper.', 'https://example.com/david_profile.jpg', 'david@example.com', '1112223333', 0x7A8B9C1D2E3F, 1, GETDATE(), GETDATE(), 1),
('Anmol Jeswani', '1987-07-20', 'Curabitur non velit sed nisi euismod eleifend ut at libero.', 'https://example.com/sophia_profile.jpg', 'sophia@example.com', '4448881234', 0x8B9C1D2E3F4A, 0, GETDATE(), GETDATE(), 1)

SELECT * FROM dbo.users
--Post Table
CREATE TABLE social_media.posts (
    post_id INT PRIMARY KEY IDENTITY(1,1),
    media_url VARCHAR(255),
    caption NVARCHAR(100),
    no_of_likes INT DEFAULT 0,
    no_of_comments INT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    edited_at DATETIME DEFAULT GETDATE(),
    active_yn INT DEFAULT 1,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES dbo.users(user_id)
);
INSERT INTO social_media.posts (media_url, caption, no_of_likes, no_of_comments, created_at, edited_at, active_yn, user_id)
VALUES
('https://example.com/post1.jpg', 'Enjoying a sunny day at the park!', 150, 30, '2022-02-01 09:15:00', '2022-02-01 09:15:00', 1, 1),
('https://example.com/post2.jpg', 'Trying out a new recipe tonight. #Foodie', 120, 25, '2022-02-02 12:30:45', '2022-02-02 12:30:45', 1, 2),
('https://example.com/post3.jpg', 'Coding marathon this weekend! ??', 80, 15, '2022-02-03 16:20:00', '2022-02-03 16:20:00', 1, 3),
('https://example.com/post4.jpg', 'Exploring the city lights at night. ??', 200, 40, '2022-02-04 19:45:30', '2022-02-04 19:45:30', 1, 4),
('https://example.com/post5.jpg', 'Hiking in the mountains with friends. ??', 180, 35, '2022-02-05 22:05:30', '2022-02-05 22:05:30', 1, 5),
('https://example.com/post6.jpg', 'Late-night gaming session. ??', 90, 20, '2022-02-06 01:30:00', '2022-02-06 01:30:00', 1, 6),
('https://example.com/post7.jpg', 'Art exhibition day! #ArtLover', 220, 50, '2022-02-07 14:15:45', '2022-02-07 14:15:45', 1, 7),
('https://example.com/post8.jpg', 'Beach day with family. ???', 120, 25, '2022-02-08 17:30:00', '2022-02-08 17:30:00', 1, 8),
('https://example.com/post9.jpg', 'Startup milestone achieved! ??', 100, 22, '2022-02-09 10:45:30', '2022-02-09 10:45:30', 1, 9),
('https://example.com/post10.jpg', 'Morning yoga by the lake. ????? #Peaceful', 130, 28, '2022-02-10 12:00:15', '2022-02-10 12:00:15', 1, 10);
SELECT *FROM social_media.posts


-- Followers Table
CREATE TABLE social_media.followers (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    follower_id INT,
    FOREIGN KEY (user_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (follower_id) REFERENCES dbo.users(user_id)
);
INSERT INTO social_media.followers (user_id, follower_id)
VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(3, 1),
(4, 2),
(5, 3),
(6, 1),
(7, 2),
(8, 3);
SELECT *FROM social_media.followers

-- Following table
CREATE TABLE social_media.following (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    following_id INT,
    FOREIGN KEY (user_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (following_id) REFERENCES dbo.users(user_id)
);
INSERT INTO social_media.following (user_id, following_id)
VALUES
(1, 5),
(2, 3),
(3, 1),
(4, 2),
(5, 1),
(6, 4),
(7, 2),
(8, 3),
(9, 1),
(10, 2);

-- Status table
CREATE TABLE social_media.status (
    id INT PRIMARY KEY IDENTITY(1,1),
    status VARCHAR(255)
);
INSERT INTO social_media.status (status)
VALUES
('Active'),
('Inactive'),
('Pending'),
('Blocked'),
('Online'),
('Offline'),
('Busy'),
('Away'),
('Available'),
('Hidden');

-- Requests table
CREATE TABLE social_media.requests (
    request_id INT PRIMARY KEY IDENTITY(1,1),
    sender_id INT,
    receiver_id INT,
    requested_at DATETIME DEFAULT GETDATE(),
    status INT,
    FOREIGN KEY (sender_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (status) REFERENCES social_media.status(Id)
);
INSERT INTO social_media.requests (sender_id, receiver_id, status)
VALUES
(1, 2, 1),  -- User 1 sending a friend request to User 2 with status "Pending"
(3, 1, 1),  -- User 3 sending a friend request to User 1 with status "Pending"
(2, 4, 1),  -- User 2 sending a friend request to User 4 with status "Pending"
(5, 1, 1),  -- User 5 sending a friend request to User 1 with status "Pending"
(2, 3, 1),  -- User 2 sending a friend request to User 3 with status "Pending"
(4, 5, 1);  -- User 4 sending a friend request to User 5 with status "Pending"

-- Tags table
CREATE TABLE social_media.tags (
    tag_id INT PRIMARY KEY IDENTITY(1,1),
    tag_name VARCHAR(255)
);
INSERT INTO social_media.tags (tag_name)
VALUES
('Travel'),
('Food'),
('Technology'),
('Fitness'),
('Art'),
('Fashion'),
('Books'),
('Music'),
('Gaming'),
('Nature');

-- Post_Tag table
CREATE TABLE social_media.post_tag (
    id INT PRIMARY KEY IDENTITY(1,1),
    post_id INT,
    tag_id INT,
    FOREIGN KEY (post_id) REFERENCES social_media.posts(post_id),
    FOREIGN KEY (tag_id) REFERENCES social_media.tags(tag_id)
);
INSERT INTO social_media.post_tag (post_id, tag_id)
VALUES
(1, 2),  -- Post 1 is tagged with 'Food'
(2, 3),  -- Post 2 is tagged with 'Technology'
(3, 4),  -- Post 3 is tagged with 'Fitness'
(4, 1),  -- Post 4 is tagged with 'Travel'
(5, 5),  -- Post 5 is tagged with 'Art'
(6, 6),  -- Post 6 is tagged with 'Fashion'
(7, 7),  -- Post 7 is tagged with 'Books'
(8, 8),  -- Post 8 is tagged with 'Music'
(9, 9),  -- Post 9 is tagged with 'Gaming'
(10, 10); -- Post 10 is tagged with 'Nature'

-- Comments table
CREATE TABLE social_media.comments (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    post_id INT,
    comment NVARCHAR(MAX),
    active_yn INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (post_id) REFERENCES social_media.posts(post_id)
);
INSERT INTO social_media.comments (user_id, post_id, comment)
VALUES
(1, 2, 'Great shot!'),
(3, 1, 'This looks amazing!'),
(2, 4, 'Where is this? I want to visit!'),
(5, 3, 'Awesome coding setup!'),
(4, 5, 'Incredible view!'),
(6, 7, 'I love that book too!'),
(7, 8, 'What music are you listening to?'),
(8, 10, 'Nature at its best!'),
(9, 6, 'Stunning outfit!'),
(10, 9, 'Gaming goals!');


-- Chats table
CREATE TABLE social_media.chats (
    id INT PRIMARY KEY IDENTITY(1,1),
    sender_id INT,
    receiver_id INT,
    FOREIGN KEY (sender_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES dbo.users(user_id)
);
INSERT INTO social_media.chats (sender_id, receiver_id)
VALUES
(1, 2),  -- User 1 starting a chat with User 2
(3, 1),  -- User 3 starting a chat with User 1
(2, 4),  -- User 2 starting a chat with User 4
(5, 1),  -- User 5 starting a chat with User 1
(2, 3),  -- User 2 starting a chat with User 3
(4, 5),  -- User 4 starting a chat with User 5
(6, 7),  -- User 6 starting a chat with User 7
(8, 9),  -- User 8 starting a chat with User 9
(10, 6), -- User 10 starting a chat with User 6
(7, 2);  -- User 7 starting a chat with User 2

-- Save table
CREATE TABLE social_media.saves (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (post_id) REFERENCES social_media.posts(post_id)
);

INSERT INTO social_media.saves (user_id, post_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)

-- Likes table
CREATE TABLE social_media.likes (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    post_id INT,
    active_yn INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES dbo.users(user_id),
    FOREIGN KEY (post_id) REFERENCES social_media.posts(post_id)
);
INSERT INTO social_media.likes (user_id, post_id)
VALUES
(1, 2),  -- User 1 likes Post 2
(3, 1),  -- User 3 likes Post 1
(2, 4),  -- User 2 likes Post 4
(5, 3),  -- User 5 likes Post 3
(2, 3),  -- User 2 likes Post 3
(4, 5),  -- User 4 likes Post 5
(6, 7),  -- User 6 likes Post 7
(8, 9),  -- User 8 likes Post 9
(10, 6), -- User 10 likes Post 6
(7, 2);  -- User 7 likes Post 2

-- Messages table
CREATE TABLE social_media.messages (
    id INT PRIMARY KEY IDENTITY(1,1),
    message NVARCHAR(MAX),
    time_stamp DATETIME DEFAULT GETDATE(),
    chat_id INT,
    FOREIGN KEY (chat_id) REFERENCES social_media.chats(id)
);
INSERT INTO social_media.messages (message, chat_id)
VALUES
('Hey, how are you?', 1),
('I am doing great, thanks!', 1),
('What are your plans for the weekend?', 2),
('Not sure yet, maybe some coding.', 2),
('Where do you want to go for dinner?', 3),
('I heard there is a new restaurant downtown.', 3),
('Do you want to play games later?', 4),
('Sure, I am up for it!', 4),
('I just finished reading a great book.', 5),
('What book was it?', 5);


/**********
* Store Procedure : dbo.sp_registerUser
* Author : Khushi Chugh
* Date  :4/02/2024
* Description     : Script to register User
* Test Code : EXEC dbo.sp_registerUser 'Mahima' ,'Mahima10@example.com' , '12345678' , 'Mahima14'
* Revision : 
**********/

CREATE  PROCEDURE dbo.sp_registerUser
@user_name VARCHAR(255),
@email VARCHAR(200),
@contact VARCHAR(20),
@password VARCHAR(200)
AS
BEGIN
	DECLARE @hashedPwd VARBINARY(MAX) = HASHBYTES('SHA2_256' , @password)
	INSERT INTO dbo.users(user_name, email , contact , password)
	VALUES(@user_name , @email ,@contact , @hashedPwd)

END

SELECT *FROM dbo.users

--SELECT *
--FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
--WHERE CONSTRAINT_NAME = 'UQ__users__7C9273C43614C24C';

--SELECT *
--FROM dbo.users
--WHERE user_name IS NULL;

/**********
* Store Procedure :social_media.sp_LoginUser
* Author : Khushi Chugh
* Date  :28/01/2024
* Description     : Script to Login User
* Test Code : EXEC social_media.sp_LoginUser  'Mahima' ,Mahima14
**********/
CREATE OR ALTER   PROCEDURE social_media.sp_LoginUser 
@user_name VARCHAR(30) ,
@password VARCHAR(30)
AS 
BEGIN
	DECLARE @hashedpwd VARBINARY(MAX) =HASHBYTES('SHA2_256', @password)
	DECLARE @count int
	select @count=count(1) from dbo.users where user_name=@user_name and password=@hashedpwd
	IF @count=1
	BEGIN
		update dbo.users
		SET token = NEWID(),
			time_to_expire=DATEADD(mi ,30, GETDATE())
		select * ,1 as validYN 
		FROM dbo.users where user_name=@user_name
	END
	ELSE
	BEGIN
		select 0 as validYN
	END
END
GO

/**********
* Store Procedure :dbo.sp_validate_token
* Author : Khushi Chugh
* Date  :11/02/2024
* Description     : Script to validate token
* Test Code  : EXEC  dbo.sp_validate_token  
**********/
CREATE OR ALTER PROCEDURE dbo.sp_validate_token
@user_id INT,
@token VARCHAR(MAX)
AS
BEGIN
	DECLARE @count INT 
	select @count=count(1) from dbo.users where user_id=@user_id and token=@token and time_to_expire > GETDATE()
	IF @count = 1
	BEGIN
		select 1 as ValidYN
	END
	ELSE
	BEGIN
		select 0 as ValidYN
	END
END


/**********
* Store Procedure : social_media.sp_SavePost
* Author : Khushi Chugh
* Date  :11/02/2024
* Description     : Script to Save Post
* Test Code  : EXEC  social_media.sp_SavePost 3, 3
**********/
CREATE or ALTER  PROCEDURE social_media.sp_SavePost
@post_id INT, 
@user_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM social_media.saves WHERE post_id = @post_id AND user_id = @user_id)
	BEGIN
        INSERT INTO social_media.saves (post_id, user_id) VALUES (@post_id ,@user_id)
		SELECT * FROM social_media.saves WHERE post_id = @post_id AND user_id = @user_id
    END 

END

SELECT *FROM social_media.saves



/**********
* Store Procedure : social_media.sp_UnSavePost
* Author : Khushi Chugh
* Date  :11/02/2024
* Description     : Script to UnSave Post
* Test Code  : EXEC  social_media.sp_UnSavePost 3,3
**********/
CREATE or ALTER PROCEDURE social_media.sp_UnSavePost
@post_id INT,
@user_id  INT
 AS
BEGIN
    DELETE FROM social_media.saves WHERE post_id = @post_id AND user_id = @user_id;
END;



/**********
* Store Procedure : social_media.sp_AddTags
* Author : Khushi Chugh
* Date  :11/02/2024
* Description     : Script to Add Tags
* Test Code  : EXEC  social_media.sp_AddTags
**********/
CREATE or ALTER PROCEDURE social_media.sp_AddTags
@post_id INT,
@ 
AS
BEGIN
    INSERT INTO social_media.post_tag (post_id, tag_id) VALUES (postId, tags);
END;


--CREATE PROCEDURE FetchTags(IN postId INT)
--BEGIN
--    SELECT tags FROM post_tags WHERE post_id = postId;
--END;

--CREATE PROCEDURE EditTags(IN postId INT, IN newTags VARCHAR(255))
--BEGIN
--    UPDATE post_tags SET tags = newTags WHERE post_id = postId;
--END;




/**********
* Store Procedure : social_media.sp_AddComments
* Author : Khushi Chugh
* Date  :16/03/2024
* Description     : Script to Add Comment
* Test Code  : EXEC  social_media.sp_AddComments 3 ,4  , 'Checking Comments Section'
**********/
CREATE OR ALTER PROCEDURE social_media.sp_AddComments
@post_id INT,
@user_id INT,
@comment VARCHAR(MAX)
AS
BEGIN
    INSERT INTO comments (post_id, user_id, comment) VALUES (@post_id, @user_id, @comment);
END;


SELECT * FROM social_media.saves

/**********
* Store Procedure :social_media.sp_validateEmail
* Author : Khushi Chugh
* Date  :10/03/2024
* Description     : Script to validate Email
* Test Code  : EXEC  social_media.sp_validateEmail
**********/
CREATE OR ALTER PROCEDURE social_media.sp_validateEmail
@email VARCHAR(100)
AS
BEGIN
	DECLARE @count INT 
	select @count=count(1) from users where email=@email
	IF @count = 1
	BEGIN
		select 1 as ValidYN
	END
	ELSE
	BEGIN
		select 0 as ValidYN
	END

END


CREATE TABLE forgot_password_token
(
    id INT PRIMARY KEY IDENTITY(1,1),
	user_id int ,
    token VARCHAR(MAX),
    time_to_expire DATE,
	email VARCHAR(200),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);


/**********
* Store Procedure :social_media.sp_generateFPToken
* Author : Khushi Chugh
* Date  :10/03/2024
* Description     : Script to Generate forget paaword token
* Test Code  : EXEC  social_media.sp_generateFPToken
**********/

CREATE OR ALTER PROCEDURE social_media.sp_generateFPToken
@email VARCHAR(200)
AS
BEGIN
    DECLARE @user_id INT;
	    DECLARE @token VARCHAR(MAX);


    SET @user_id = (SELECT user_id FROM users WHERE email = @email);
	    SET @token = NEWID()



    INSERT INTO forgot_password_token (user_id, token, time_to_expire, email)
    VALUES (
        @user_id,
        @token,
        DATEADD(mi, 30, GETDATE()),
        @email
    );

	SELECT @token as token

END;
