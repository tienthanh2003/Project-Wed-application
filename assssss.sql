
-- Tạo cơ sở dữ liệu BookStore
CREATE DATABASE BookStore;
Drop database BookStore
-- Sử dụng cơ sở dữ liệu BookStore
USE BookStore;
Use [AssmentPRJ]


CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    upassword VARCHAR(100) NOT NULL,
	[urole] [int] NULL,
	Moneys DECIMAL(10, 2) NOT NULL,
	
);
Drop table Users
-- Tạo bảng quản lý sách (Books)
CREATE TABLE Books (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    book_name NVARCHAR(100) NOT NULL,
    image_path NVARCHAR(255) NOT NULL,
	Descrip NVarchar(max)  not null,
	quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
Create table Shipper(
	id int PRIMARY KEY IDENTITY(1,1),
	types nvarchar(50) NULL,
);
INSERT INTO shipper( types ) VALUES 
(N'Giao Hàng Nhanh'),
(N'ShopperExpress '),
(N'GHN'),
(N'VNPost'),
(N'ViettheoPost');
SELECT * FROM shipper
-- Tạo bảng quản lý danh mục sách (Categories)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(50) NOT NULL
);

-- Tạo bảng quản lý đơn đặt hàng (Orders)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT not null,
	sid INT not null,
	[date] [date] NOT NULL,
	phone Varchar(100) not null,
	baddress Varchar(100) not null,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (sid) REFERENCES shipper(id),
);

-- Tạo bảng chi tiết đơn đặt hàng (OrderDetails)
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT not null,
    bookid INT not null,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (bookid) REFERENCES Books(book_id)
    
);

drop table Categories
INSERT INTO Categories (category_name) VALUES 
(N'Sách thiếu nhi'),
(N'Sách dành cho thanh thiếu niên '),
(N'Sách khoa học'),
(N'Sách lịch sử'),
(N'Bộ sách giáo khoa'),
(N'Tiểu Thuyết');
Select * From Categories
INSERT INTO Books (book_name, image_path, Descrip,quantity ,price, category_id) VALUES 
(N'NoBiTa va Mê Cung Thiếc', N'img\Doraemon.jpg',N'Nobita và Doraemon phát hiện một chiếc vali bí ẩn mà ông Nobi đã nói về đảo Blikin. 
                        Họ mở ra và đến được đảo này, nơi ông Nobi nghĩ rằng mình đã nằm mơ. 
                        Tại đây, họ phát hiện ra hành tinh Chamocha và bị bắt bởi bọn rôbốt Napogistor. 
                        Nobita, Shizuka và Sapio tìm đến mê cung thiếc để giải cứu Doraemon và chiến đấu chống lại Napogistor... ','200', 28000.0, 1),
(N'Kính Vạn Hoa 18 tập', N'img\Kinh Van Hoa.jpg',N'Kính vạn hoa là một bộ truyện dài nhiều tập của nhà văn Nguyễn Nhật Ánh. 
                        Bộ truyện gồm 54 tập truyện mang tính hài hước kể về những chuyện vui buồn trong giới học trò, những trò nghịch ngợm, những trò chơi thú vị, những bài học cuộc sống sâu sắc và đầy ý nghĩa. 
                        Những nhân vật chính là Quý ròm, nhỏ Hạnh, Tiểu Long cùng các nhân vật khác. 
                        Mỗi tập là một câu chuyện khác nhau xung quanh ba bạn nhỏ này. 
                        Những tập Kính vạn hoa có thể coi là những cuốn sách tâm lý của tuổi học trò.','190' ,450000.0 , 2),
(N'Trái Đất và Hệ Mặt Trời', N'img\Khoa Hoc.jpg',N'Những kiến thức khoa học thú vị về vũ trụ , trái đất và hệ mặt trời','150' ,88000.0, 3),
(N'Lược Sử thế giới', N'img\Lich su.jpg ',N'Cuốn sách "Lược sử thế giới" của E. H. Gombrich, được viết lần đầu tiên bằng tiếng Đức vào năm 1935, đã trở thành một trong những cuốn sách lịch sử phổ biến nhất, được dịch sang hơn ba mươi ngôn ngữ khác nhau. 
                        Năm 2005, cuốn sách đã được xuất bản bằng tiếng Anh, kèm theo phần minh họa bổ sung, và đã bán được hơn nửa triệu bản trên toàn thế giới.
                        Cuốn sách này không chỉ là một tác phẩm lịch sử thông thường mà còn là một bài thơ về lịch sử thế giới, mang độ lịch lãm và sâu sắc. 
                        E. H. Gombrich dẫn dắt người đọc qua từng giai đoạn lịch sử từ thời kỳ Đồ đá đến thời kỳ của năng lượng nguyên tử, với sự diễn giải rõ ràng và dễ hiểu về những biến cố lịch sử phức tạp nhất, những trào lưu tư tưởng khó hiểu nhất, và những nhân vật lịch sử đa chiều nhất....','300' ,300000.0, 4),
(N'Bộ sách giáo khoa lớp 11', N'img\SGk.jpg',N'Trọn bộ sách giáo khoa lớp 11','80' ,480000.0, 5);
-- Truy vấn dữ liệu từ bảng Categories và Books
SELECT c.category_name, b.book_name, b.description, b.price
FROM Categories c
JOIN Books b ON c.category_id = b.category_id;
INSERT INTO Users (username, upassword,[urole],Moneys ) VALUES ('user', '123','1','300000.0'),
												('admin','1','0','1000000.0'),
												('admin1','2','0','800000.0'),
											('user1','456','1','500000.0');
Select * from Users
Select * from Books
Select *
Select * from Users
Drop table Users
 SELECT * FROM Users
                 WHERE username ='user' AND upassword = 123;
				 Select *from users
				 select B.book_name, B.image_path, B.price, C.category_id ,C.category_name 
                from Books B INNER JOIN Categories C ON B.category_id = C.category_id
				INSERT INTO Books (book_name, image_path, Descrip,quantity ,price, category_id) VALUES 
				(N'Tam Quốc Diễn Nghĩa trọn bộ', N'img\tam quốc trọn bộ.jpg',N'Tam Quốc Diễn Nghĩa là một trong Tứ đại danh tác của nền văn học cổ điển Trung Quốc.Tiểu thuyết có nội dung kể về một thời kỳ hỗn loạn trong lịch sử Trung Hoa là thời Tam Quốc (190–280) với 120 chương hồi, theo phương pháp bảy phần thực, ba phần hư (bảy phần thực tế, ba phần hư cấu).','120' ,280000.0, 6),
				(N'Hồng Lâu Mộng', N'img\honglaumong.jpg',N'Hồng lâu mộng hay tên gốc Thạch đầu ký là một trong Tứ đại danh tác của Trung Quốc .Hồng Lâu Mộng là một bức tranh hiện thực rộng lớn về xã hội phong kiến Trung Quốc trên con đường suy tàn. Cái vẻ ngoài tôn nghiêm nề nếp không che đậy được thực chất mọt ruỗng của giới thượng lưu sống trong Giả phủ. Cuộc sống xa hoa, dâm ô cố hữu của giai cấp bóc lột và những mối quan hệ tàn nhẫn giữa họ với nhau đã đưa Giả phủ vào con đường tàn tạ không cứu vãn được. Đó chính là hình ảnh thu nhỏ của xã hội Trung Quốc đời Thanh.','300',250000.0,6),
				(N'Tây Du Ký', N'img\tayduky.jpg',N'Tác giả Ngô Thừa Ân là một tiểu thuyết gia kiệt xuất của thời nhà Minh, tự là Nhữ Trung, hiệu Tạ Dương Sơn Nhân, là người ở Sơn Dương phủ Hoài An (nay là huyện
														Hoài An, tỉnh Sơn Tây, Trung Quốc).
														“Tây du ký” là một cuốn tiểu thuyết chương hồ tỏa ra mạnh mẽ hơi thở của chủ nghĩa lãng mạn, cũng là đỉnh cao của các tiểu thuyết huyền thoại trong lịch sử văn học Trung Quốc. Cùng với “Thủy hử”, “Tam quốc diễn nghĩa”, “Hồng lâu mộng”, “Tây du ký” được coi là bốn tác phẩm kinh điển của văn học cổ điển Trung Hoa. Tác phẩm giàu trí tưởng tượng, phép nhân hóa xuất thần, đã đạt tới đỉnh cao của sự sáng tạo, vì vậy trải qua hơn 400 năm mà sức sống không hề suy yếu; từ người già đến trẻ nhỏ, từ phụ nữ đến nam giới đều yêu thích, có ảnh hưởng đến nhiều thế hệ độc giả. Học giả của nhà Thanh, trương Thư Thân, đã từng bình luận: “Cuốn sách ‘Tây du ký’ từ khi bắt đầu đến khi kết thúc đều nói về những điều rất chân thành, những điều mới mẻ mà lương thiện. Đây thực sự là một cuốn sách tuyệt vời”.
														Toàn bộ cuốn sách gồ 100 hồ, có thể chia ra làm ba phần chính, chủ yếu miêu tả những câu chuyện về việc Tôn Ngộ Không ra đời và đại náo thiên cung, Đường Tăng xuất thế và nguyên do đi lấy chân kinh, và sau đó là việc bốn thầy trò trải qua chín chín tám mươi mốt kiếp nạn, cuối cùng đã lấy được chân kinh.','50',252000.0,6),
				(N'Thủy Hử', N'img\thuyhu.jpg',N'Thủy Hử là một trong Tứ đại danh tác của nền văn học cổ điển Trung Quốc. Qua giọng văn sống động của tác phẩm, một trăm linh tám anh hùng Lương Sơn mỗi người một vẻ, một xuất thân, một tính cách, một cuộc đời hiện lên qua từng trang sách. Trong quá trình tụ nghĩa Lương Sơn, họ gặp quan tham thì chống, gặp ác bá thì trừng, đặt chữ “nghĩa” làm phương châm hành động. Lối hành động không câu nệ và tính cách hào sảng ấy nơi các nhân vật đã quyện xoắn những mẩu chuyện rời thành một thế giới võ lâm thu nhỏ, tạo cảm giác sảng khoái trong từng câu chữ.','120' ,280000.0, 6);										;