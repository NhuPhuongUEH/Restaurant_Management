create view tbl_thu AS
select ngaydat, sum(tongtien) as tongtienthu
from (select hd.HoaDon_ID, CONVERT(date, (hd.Ngay)) as ngaydat, (select sum(c.DonGia * c.SoLuong) from CHITIETHOADON c where c.HoaDon_ID = hd.HoaDon_ID) as tongtien
		from HOADON hd) V_hoadon
group by ngaydat

create view tbl_chi AS
select V_PhieuNhapKho.ngaylap, sum(V_PhieuNhapKho.tongtien) as tongtiennhap
from (select pn.PhieuNhapKho_ID, CONVERT(date, (pn.NgayLap)) as ngaylap, (select sum(ctpn.Gia * ctpn.SoLuong) from CHITIETPHIEUNHAPKHO ctpn where ctpn.PhieuNhapKho_ID = pn.PhieuNhapKho_ID) as tongtien
		from PHIEUNHAPKHO pn) V_PhieuNhapKho
group by V_PhieuNhapKho.ngaylap

create view thu1 As
select * from tbl_thu t left join tbl_chi c on c.ngaylap = t.ngaydat

create view thu2 as
select * from tbl_thu t right join tbl_chi c on c.ngaylap = t.ngaydat 

select * from tbl_chi left join tbl_thu on ngaydat = ngaylap
select * from tbl_chi right join tbl_thu on ngaydat = ngaylap

select * from thu1, thu2 where (thu1.tongtiennhap<>NULL and thu1.tongtienthu<>NULL)
select * from thu1
select * from thu2
select * from thu1 left join thu2 on thu1.ngaydat= thu2.ngaylap

create procedure tongtien_hoadon @ngaydat date, @tongtien float output
as
set @tongtien=(select t.tongtienthu from tbl_thu t where CONVERT(date, t.ngaydat) = (CONVERT(date, @ngaydat)))

create procedure tongtien_phieunhap @ngaylap date, @tongtien float output
as
set @tongtien=(select t.tongtiennhap from tbl_chi t where CONVERT(date, t.ngaylap) = (CONVERT(date, @ngaylap)))

DECLARE @aaa float
exec tongtien_hoadon '8-3-2019', @aaa output
select @aaa

create procedure doanh_thu @dateFrom date, @dateTo date
as
delete from tmp_thu_chi
while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @thu float
	declare @chi float
	exec tongtien_hoadon @dateFrom, @thu output
	exec tongtien_phieunhap @dateFrom, @chi output
	insert into tmp_thu_chi values(@dateFrom, @thu, @chi)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end

exec doanh_thu '2019-03-08','2019-03-16'
select * from tmp_thu_chi