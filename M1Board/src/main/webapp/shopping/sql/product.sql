
  -- String productID;        // 상품아이디 
  -- String pname;          	// 상품 이름
  -- Integer unitPrice;       // 상품가격
  -- String description;    	// 상품 설명
  -- String maufacture;    	// 제조사
  -- String category;       	// 분류
  -- long unitsInStock;       // 재고 수
  -- String condition;        // 신상, 중고, 재생
  -- String filename;  		// 파일 이미지
  
  -- int quantity;			//장바구니 


--product 테이블 생성--
drop table if exists product;
create table product(
	productID	varchar(10)	not null,
	pname		varchar(20),
	unitPrice	int,
	description	varchar(200),
	maufacture	varchar(20),
	category	varchar(20),
	unitsInStock	long,
	conditions	varchar(20),
	filename	varchar(200),
	
	primary key(productID)
	
)default charset = utf8mb4;

delete from product where productID = 'P32442'; 

select * from product; 

insert into product values("p1","iPhone 6s",800000,
						"4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera",
						"Apple",
						"Smart Phone",1000,"New","P1234.png");
						
insert into product values("p2","LG PC 그램",1500000,
						"13.3inch,IPS LED display,5rd Generation Intel Core Processors",
	
						"LG","Notebook",1000,"New","P1236.png");
						
update product set filename='P1237.png' where filename = 'P1236.png';	---변경--					

insert into product values("p3","Galaxy Tab",900000,
						"212.8*125.6*6.6mm,Syper AMOLED display,Octa-Core processor",
						"Samsung","Tablet",1000,"New","P1236.png");


	
desc product;
						


