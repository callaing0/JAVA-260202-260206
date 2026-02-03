사용자 정보
Table user {
  id bigint [primary key, increment]
  user_id varchar(255) [not null, note: "아이디"]
  password varchar(50) [not null, note: "비밀번호"]
  address varchar(255) [not null, note: "주소"]
  tel varchar(20) [not null, note: "연락처"]
  created_at timestamp [default: 'now()']
}



상품 정보
Table item{
  id bigint [primary key, increment]
  item_name varchar(255) [not null, note: "상품 이름"]
  item_price int [not null, note: "상품 가격"]
  item_qa int [not null, note: "상품 수량"]
  item_detail text [not null, note: "상품 설명"]
  as int [not null, note: "as 기간"]
  status enum('sale', 'soldout')
  created_at timestamp [default: 'now()']
}

상품 이미지
Table item_image{
  id bigint [pk, increment]
  item_id bigint [note: "item Table id"]
  item_img_path varchar(255) [not null, note: "이미지"]
  thumbnail bool [not null, note: "썸네일"]
}

장바구니
Table cart {
  id bigint [pk, increment]
  user_id bigint [unique, not null, note: "user table id"]
  status varchar(20) [not null, default: "active", note: "장바구니 활성화 여부"]
  created_at timestamp [default: 'now()']
}

장바구니 리스트
Table cart_list{
  id bigint [pk, increment]
  cart_id bigint [not null, note: "cart Table id"]
  item_id bigint [not null, note: "item Table id"]
  quantity int [not null, default: 1]
  created_at timestamp [default: 'now()']
  updated_at timestamp [default: 'now()']
}

주문
Table orders {
  id bigint [pk, increment]
  user_id bigint [not null, note: "user table id"]
  order_num varchar(30) [not null, note: "주문 번호"]
  order_status enum ('created','paid','cancel','completed')
  total_amount int [not null, note: "주문 상품 총 금액"]
  order_at timestamp [default: 'now()']
}

주문 상세보
Table order_detail{
  id bigint [pk, increment]
  orders_id bigint  [not null, note: "orders table id"]
  item_id bigint [not null, note: "item Table id"]
  quantity int [not null, note: "주문 상품 수량"]
  price int [not null, note: "주문 상품 단가"]
  total_price [not null, note: "주문 상품 총 금액"]
  created_at timestamp [default: 'now()']
}


