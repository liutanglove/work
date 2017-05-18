create table s_user(
	username varchar2(128) primary key,
	password varchar2(128)
)
insert into s_user values('admin','admin');
insert into s_user values('dings','dings');
update s_user set password = '21232f297a57a5a743894a0e4a801fc3' where username='admin';
select * from s_user;

create table s_category(
	id varchar2(128) primary key,
	name varchar2(128),
	lev varchar2(64),
	parentId references s_category(id),
	createTime timestamp,
	lastUpdateTime timestamp
)
delete from s_category where name is null;
insert into s_category values('001','时尚女装','1',null,sysdate,sysdate);
insert into s_category values('002','连衣裙','2','001',sysdate,sysdate);
insert into s_category values('010','碎花裙','2','001',sysdate,sysdate);
insert into s_category values('011','小西装','2','001',sysdate,sysdate);
insert into s_category values('003','女仔裤','3','002',sysdate,sysdate);
insert into s_category values('012','女鞋','3','010',sysdate,sysdate);
insert into s_category values('013','女袜','3','011',sysdate,sysdate);
insert into s_category values('004','精品男装','1',null,sysdate,sysdate);
insert into s_category values('005','流行男鞋','2','004',sysdate,sysdate);
insert into s_category values('006','男士内裤','3','005',sysdate,sysdate);
insert into s_category values('007','服饰配件','1',null,sysdate,sysdate);
insert into s_category values('008','女士腰带','2','007',sysdate,sysdate);
insert into s_category values('009','男士腰带','3','008',sysdate,sysdate);
select * from s_category where lev = '1' and ;
select * from s_category 
			where parentId in(
				select id from s_category 
						where parentId in (
							select id from s_category 
									where lev = '1'))
select * from s_category where lev = '1'									
select * from s_category where lev = '2' and parentId = '001'
delete from s_category where id = '87aa229c';

--参数组表(s_paraGroup)--
create table s_paraGroup(
	id varchar2(128) primary key,
	name varchar2(128),
	sortNum varchar2(64),
	cId references s_category(id),
	createTime timestamp,
	lastUpdateTime timestamp
)
select * from s_paraGroup
update s_paraGroup set name = '参数组3' where id = '006'
delete from s_paraGroup where id = '91c62506'
insert into s_paraGroup values('001','主体','1','001',sysdate,sysdate);
insert into s_paraGroup values('002','网络','2','001' ,sysdate,sysdate);
insert into s_paraGroup values('003','尺寸','3','001',sysdate,sysdate);
insert into s_paraGroup values('004','参数组1','4','002',sysdate,sysdate);
insert into s_paraGroup values('005','参数组2','1','002',sysdate,sysdate);
insert into s_paraGroup values('006','参数组3','2','002',sysdate,sysdate);
--参数项表--
create table s_paraItem(
	id varchar2(128) primary key,
	name varchar2(128),
	sortNum varchar2(64),
	gId references s_paraGroup(id),
	createTime timestamp,
	lastUpdateTime timestamp
)
select * from s_paraItem
insert into s_paraItem values('001','品牌','1','001',sysdate,sysdate);
insert into s_paraItem values('002','型号','2','001',sysdate,sysdate);
insert into s_paraItem values('003','4G网络制','3','002',sysdate,sysdate);
insert into s_paraItem values('004','3G网络制','4','002',sysdate,sysdate);
insert into s_paraItem values('007','袖长','5','004',sysdate,sysdate);
insert into s_paraItem values('008','领型','2','004',sysdate,sysdate);
insert into s_paraItem values('009','版型','3','005',sysdate,sysdate);
insert into s_paraItem values('010','风格','6','005',sysdate,sysdate);
insert into s_paraItem values('011','衣长','1','006',sysdate,sysdate);
insert into s_paraItem values('012','袖长','2','006',sysdate,sysdate);
delete from s_paraItem where id ='bdf8d03c'

alter table s_paraItem drop constraint SYS_C005565
alter table s_paraItem
	add constraint fk2 foreign key(gid)
		references s_paraGroup(id)
		 on delete cascade

 select * from s_paraItem where gId = #{id}
 	select g.*,i.id as iId,i.name as iName,i.sortNum as iSortNum,i.createTime as iCreateTime,i.lastUpdateTime as iLastUpdateTime from s_paraGroup g left join s_paraItem i on g.id = gId left join s_category c on g.cId = c.id;
 	
 	
 select 		g.*,i.id as iId,i.name as iName,i.sortNum as iSortNum,cId,i.createTime as iCreateTime,i.lastUpdateTime as iLastUpdateTime, 
		c.id as c_Id,c.name as cName,c.lev as cLev,c.createTime as cCreateTime,c.lastUpdateTime as cLastUpdateTime
			from (select * from (select rownum r,s.* from s_paraGroup s where rownum <=6) t1
					where t1.r>3) g 
				left join s_paraItem i 
						on g.id = gId
				left join s_category c 
						on cId = c.id
--规格项表--
create table s_speci_item(
	id varchar2(128) primary key,
	name varchar2(128),
	show_type varchar2(64),
	note varchar2(128),
	sortNum varchar2(64),
	createTime timestamp,
	lastUpdateTime timestamp
)
insert into s_speci_item values('001','颜色','图片','女装','1',sysdate,sysdate);
insert into s_speci_item values('002','颜色','图片','男装','1',sysdate,sysdate);
insert into s_speci_item values('003','尺码','文本','女装','2',sysdate,sysdate);
insert into s_speci_item values('004','尺码','文本','男装','3',sysdate,sysdate);
insert into s_speci_item values('005','尺码','文本','女鞋','3',sysdate,sysdate);
insert into s_speci_item values('006','尺码','文本','男鞋','3',sysdate,sysdate);
select * from s_speci_item;
update s_speci_item set show_type='文本' where id ='006';
--规格项可选值表--
create table s_speci_item_option(
	id varchar2(128) primary key,
	name varchar2(128),
	img_url varchar2(256),
	parentId references s_speci_item(id) on delete cascade,
	sortNum varchar2(64),
	createTime timestamp,
	lastUpdateTime timestamp
)
select * from s_speci_item_option;
insert into s_speci_item_option values('001','黄色','/back/img/2.gif','001','1',sysdate,sysdate);
insert into s_speci_item_option values('002','酒红色','/back/img/3.gif','001','1',sysdate,sysdate);
insert into s_speci_item_option values('003','白色','/back/img/1.gif','002','1',sysdate,sysdate);
insert into s_speci_item_option values('004','银色','/back/img/5.gif','002','1',sysdate,sysdate);
insert into s_speci_item_option values('005','均码',null,'003','1',sysdate,sysdate);
insert into s_speci_item_option values('006','XXS',null,'003','1',sysdate,sysdate);
insert into s_speci_item_option values('007','S',null,'004','2',sysdate,sysdate);
insert into s_speci_item_option values('008','M',null,'004','2',sysdate,sysdate);
insert into s_speci_item_option values('009','34',null,'005','3',sysdate,sysdate);
insert into s_speci_item_option values('010','35',null,'005','3',sysdate,sysdate);
insert into s_speci_item_option values('011','36',null,'006','3',sysdate,sysdate);
insert into s_speci_item_option values('012','37',null,'006','3',sysdate,sysdate);



--商品表--
create table s_product(
	id varchar2(128) primary key,
	name varchar2(128),
	cid references s_category(id) on delete cascade,
	numb varchar2(128) unique,
	sale_price number(7,2),
	market_price number(7,2),
	is_pro varchar2(8),
	score varchar2(64),
	introduce clob,
	primary_img varchar2(128)
)
drop table s_product
select * from s_product
update s_product set is_pro = 'N' where id = '57c5f3b3';
delete from s_product where id = '214d5084';
--图片表--
create table s_img(
	id varchar2(128) primary key,
	img_url_large varchar2(128),
	productId references s_product(id) on delete cascade,
	img_url_small varchar2(128),
	img_url_middle varchar2(128),
	title varchar2(128),
	sort_num varchar2(64)
)
select * from s_img
drop table s_img