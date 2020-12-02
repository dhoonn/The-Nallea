--사용자 만들기
CREATE USER ADEPTER IDENTIFIED BY "1234";
GRANT DBA TO ADEPTER;

--테이블
create table tb_member (
    m_num number(10) CONSTRAINT pk_mnum PRIMARY KEY,
    m_id nvarchar2(20),
    m_k_id nvarchar2(20),
    m_n_id nvarchar2(20),
    m_g_id nvarchar2(20),
    m_password nvarchar2(100),
    m_name nvarchar2(50),
    m_email nvarchar2(50),
    m_phone nvarchar2(20),
    m_profile nvarchar2(1000),
    m_auth nvarchar2(20),
    m_permit number(5)
    );
    
drop sequence member_seq;
create sequence member_seq
    start with 1
    increment by 1
    nocache;
commit;

-- 업체 등록
drop table tb_company;
create table tb_company (
    c_id nvarchar2(50) CONSTRAINT pk_c_id PRIMARY KEY,
    c_password nvarchar2(100) not null,
    c_name nvarchar2(100) not null,
    c_photo nvarchar2(1000),
    c_contents nvarchar2(200),
    c_address nvarchar2(100),
    c_y nvarchar2(50),
    c_x nvarchar2(50),
    c_sort nvarchar2(50),
    c_ceo_tel nvarchar2(20),
    c_ceo nvarchar2(20),
    c_area nvarchar2(100),
    c_auth nvarchar2(20)
    );

-- 식당 게시판
drop table tb_food;
create table tb_food (
    f_num number(10) CONSTRAINT pk_h_num PRIMARY KEY,
    f_c_id nvarchar2(20) CONSTRAINT PK_f_c_id REFERENCES tb_company(c_id) on delete cascade,
    f_title nvarchar2(50),
    f_detail nvarchar2(50),
    f_mainimg nvarchar2(50),
    f_x nvarchar2(100),
    f_y nvarchar2(100));

CREATE SEQUENCE food_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

select * from tb_food;

-- 식당 메뉴 게시판
drop table tb_food_menu;
create table tb_food_menu (
    f_m_c_id nvarchar2(20) CONSTRAINT PK_f_m_c_id REFERENCES tb_company(c_id) on delete cascade,
    f_m_price number(10),
    f_m_foodimg nvarchar2(1000),
    f_m_subimg nvarchar2(1000));

-- 항공권 게시판
drop table tb_air_schedule;
create table tb_air_schedule (
    a_title nvarchar2(500),
    a_name nvarchar2(20),
    a_startplace nvarchar2(50),
    a_endplace nvarchar2(50),
    a_startdate nvarchar2(50),
    a_enddate nvarchar2(50),
    a_eprice nvarchar2(10),
    a_bprice nvarchar2(10));
    
select * from tb_air_schedule;

-- 항공권 넘버
drop table tb_schedule;
create table tb_schedule(
s_m_num number(10),
s_date nvarchar2(20),
s_num number(10));

-- 추천
CREATE TABLE spot(
    sname NVARCHAR2(50),
    AREA NVARCHAR2(50),
    TYPE_NUM number(5),
    WITH_NUM number(6),
    sphoto NVARCHAR2(1000),
    s_x nvarchar2(100),
    s_y NVARCHAR2(100)
);
select * from spot;
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('애월', '제주', '1', '1', '애월.jpg', '33.434481', '126.382952');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('이호테우', '제주', '1', '2', '이호테우.jpg', '33.502550', '126.452195');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('자연사박물관', '제주', '1', '3', '자연사박물관.jpg', '33.506616', '126.531607'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('중문', '제주', '1', '4', '중문.jpg', '33.245307', '126.411643'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('사려니숲', '제주', '2', '1', '사려니숲.jpg', '33.393063', '126.672318'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('한라산수목원', '제주', '2', '2', '한라수목원.jpg', '33.470088', '126.493223'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('에코랜드', '제주', '2', '3', '에코랜드.jpg', '33.455789', '126.668016'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('만장굴', '제주', '2', '4', '만장굴.jpg', '33.528790', '126.771427'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('러브랜드', '제주', '3', '2', '러브랜드.jpg', '33.451826', '126.489979'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('우도', '제주', '3', '3', '우도.jpg', '33.505156', '126.953919');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('스위스마을', '제주', '3', '4', '스위스마을.jpg', '33.494328', '126.676748');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('한라산', '제주', '4', '1', '제주1.jpg', '33.362168', '126.528866');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('스쿠터투어', '제주', '4', '2', '스쿠터투어.jpg', '33.509976', '126.503872');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('승마체험', '제주', '4', '3',  '승마체험.jpg', '33.409454', '126.411840');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('유리의 성', '제주', '4', '4', '유리의성.jpg', '33.314775', '126.273612');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('마라도', '제주', '5', '1', '마라도.jpg', '33.121139', '126.266992');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('백제사', '제주', '5', '2', '백제사.jpg', '33.449022', '126.424207');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('성산 일출봉', '제주', '5', '3', '성산일출봉.jpg', '33.458173', '126.942496'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('약천사', '제주', '5', '4', '약천사.jpg', '33.245451', '126.449647');


insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('서면음식거리', '부산', '1', '1', '서면.jpg', '35.157702', '129.059134'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('부산대젊음의거리', '부산', '1', '2', '부산대.jpg', '35.231192', '129.086444');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('자갈치시장', '부산', '1', '3', '자갈치.jpg', '35.096758', '129.030435'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('더베이101', '부산', '1', '4', '더베이.jpg', '35.156678', '129.152159'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('정란각', '부산', '2', '1', '정란각.jpg', '35.125800', '129.042639');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('감천문화마을', '부산', '2', '2', '감천문화마을.jpg', '35.097425', '129.010571');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('태종대', '부산', '2', '3', '태종대.jpg', '35.053067', '129.087161');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('광안리', '부산', '2', '4', '광안리.jpg', '35.153048', '129.118611');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('미포철길', '부산', '3', '2', '.미포철길jpg', '35.160017', '129.170812');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('오륙도스카이워크', '부산', '3', '3', '오륙도스카이워크.jpg', '35.100634', '129.124574');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('전포카페거리', '부산', '3', '4', '전포카페거리.jpg', '35.155402', '129.063863');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('해동용궁사', '부산', '4', '1', '해동용궁사.jpg', '35.188357', '129.223247'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('아난티코브', '부산', '4', '2', '아난티코브.jpg', '35.199966', '129.229016');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('동백섬', '부산', '4', '3', '동백섬.jpg', '35.154513', '129.152552');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('고흐의길', '부산', '4', '4', '고흐의길.jpg', '35.175957', '129.183650');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('범어사', '부산', '5', '1', '범어사.jpg', '35.284025', '129.068721');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('어린왕자상', '부산', '5', '2', '어린왕자상.jpg', '35.097787', '129.008540');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('근대역사관', '부산', '5', '3', '근대역사관.jpg', '35.102797', '129.031160'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('청사포전망대', '부산', '5', '4', '청사포전망대.jpg', '35.164060', '129.196706');


insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('속초중앙시장', '강릉,속초', '1', '1', '속초중앙시장.jpg', '38.204884', '128.588219'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('대포항', '강릉,속초', '1', '2', '대포항.jpg', '38.173854', '128.606942');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('동명항횟촌', '강릉,속초', '1', '3', '동명항횟촌.jpg', '38.211789', '128.600734'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('초당순두부길', '강릉,속초', '1', '4', '초당순두부길.jpg', '37.790355', '128.913018');  

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('바우지움미술관', '강릉,속초', '2', '1', '바우지움미술관.jpg', '38.212975', '128.515491');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('주문진', '강릉,속초', '2', '2', '주문진.jpg', '37.900628', '128.819858');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('대관령양떼목장', '강릉,속초', '2', '3', '대관령양떼목장.jpg', '37.689566', '128.753024'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('안목해변', '강릉,속초', '2', '4', '안목해변.jpg', '37.772953', '128.947358'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('얼라이브하트', '강릉,속초', '3', '2', '얼라이브하트.jpg', '38.205486', '128.517172');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('하슬라아트월드', '강릉,속초', '3', '3', '하슬라아트월드.jpg', '37.706779', '129.010954'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('정동진', '강릉,속초', '3', '4', '정동진.jpg', '37.691294', '129.032604'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('영금정', '강릉,속초', '4', '1', '영금정.jpg', '38.211881', '128.601443'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('영진해변', '강릉,속초', '4', '2', '영진해변.jpg', '37.869109', '128.845322'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('오죽헌', '강릉,속초', '4', '3', '오죽헌.jpg', '37.779433', '128.878151');
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('정동진해돋이', '강릉,속초', '4', '4', '정동진해돋이.jpg', '37.683452', '129.044920');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('설악산', '강릉,속초', '5', '1', '설악산.jpg', '38.119651', '128.465515'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('소금강', '강릉,속초', '5', '2', '소금강.jpg', '37.769555', '128.609396');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('비로봉', '강릉,속초', '5', '3', '비로봉.jpg', '37.760926', '128.577303');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('천불동계곡', '강릉,속초', '5', '4', '천불동계곡.jpg', '38.157544', '128.470057'); 


insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('한옥마을', '전주', '1', '1', '한옥마을.jpg', '35.815477', '127.153436'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('남부시장청년몰', '전주', '1', '2', '남부시장.jpg', '35.812122', '127.147356'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('전동성당', '전주', '1', '3', '전동성당.jpg', '35.813373', '127.149202'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('객리단길', '전주', '1', '4', '객리단길.jpg', '35.817708', '127.143968');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('전주천', '전주', '2', '1', '전주천.jpg', '35.870138', '127.104715'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('경기전', '전주', '2', '2', '경기전.jpg', '35.815348', '127.149782');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('이오당', '전주', '2', '3', '이오당.jpg', '35.812366', '127.154116'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('모카우체국', '전주', '2', '4', '모카우체국.jpg', '35.815985', '127.148733'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('벽화마을', '전주', '3', '2', '벽화마을.jpg', '35.814259', '127.157223');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('추억박물관', '전주', '3', '3', '추억박물관.jpg', '35.818575', '127.148400');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('덕진공원', '전주', '3', '4', '덕진공원.jpg', '35.847582', '127.121863'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('금산사미륵전', '전주', '4', '1', '금산사미륵전.jpg', '35.723129', '127.053951');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('술박물관', '전주', '4', '2', '술박물관.jpg', '35.728604', '127.136321');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('견훤왕궁터', '전주', '4', '3', '견훤왕궁터.jpg', '35.812863', '127.169090');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('도립미술관', '전주', '4', '4', '도립미술관.jpg', '35.767047', '127.210409'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('모악산', '전주', '5', '1', '모악산.jpg', '35.729863', '127.084370');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('완산공원', '전주', '5', '2', '완산공원.jpg', '35.803253', '127.141817');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('안덕체험마을', '전주', '5', '3', '안덕체험마을.jpg', '35.695072', '127.099840');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('무형유산원', '전주', '5', '4', '무형유산원.jpg', '35.809809', '127.159397'); 


insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('황리단길', '경주', '1', '1', '.jpg', '35.837713', '129.209660'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('핑크뮬리', '경주', '1', '2', '.jpg', '35.835530', '129.219349'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('중앙시장', '경주', '1', '3', '.jpg', '35.844053', '129.206369'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('보문호수', '경주', '1', '4', '.jpg', '35.842691', '129.286258');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('첨성대', '경주', '2', '1', '.jpg', '35.834726', '129.219042'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('버드파크', '경주', '2', '2', '.jpg', '35.849172', '129.261505');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('보문호반길', '경주', '2', '3', '.jpg', '35.840884', '129.284016');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('동궁원', '경주', '2', '4', '.jpg', '35.850744', '129.264485'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('러브캐슬', '경주', '3', '2', '.jpg', '35.810962', '129.306899');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('추억의달동네', '경주', '3', '3', '.jpg', '35.803725', '129.312434'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('테디베어박물관', '경주', '3', '4', '.jpg', '35.851884', '129.276933');

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('대중음악박물관', '경주', '4', '1', '.jpg', '35.840156', '129.289233'); 
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('힐링테마파크', '경주', '4', '2', '.jpg', '35.776980', '129.265081');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('무장산억새군락지', '경주', '4', '3', '.jpg', '35.875393', '129.345094');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('국립경주박물관', '경주', '4', '4', '.jpg', '35.829431', '129.227906'); 

insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('석굴암', '경주', '5', '1', '.jpg', '35.794053', '129.350289');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('송대말등대', '경주', '5', '2', '.jpg', '35.807362', '129.511313');   
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('불국사', '경주', '5', '3', '.jpg', '35.790132', '129.332082');  
insert into spot(sname, AREA, type_num, with_num, sphoto, s_x, s_y) values('화랑의언덕', '경주', '5', '4', '.jpg', '35.768971', '129.091086');

commit;