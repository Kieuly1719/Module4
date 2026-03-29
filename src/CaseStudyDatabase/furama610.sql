use Furama;

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,
dv.chi_phi_thue, ldv.ten_loai_dich_vu from loai_dich_vu ldv
left join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where (month(hd.ngay_lam_hop_dong) = 1 or month(hd.ngay_lam_hop_dong) = 2
or month(hd.ngay_lam_hop_dong) = 3 ) and year(hd.ngay_lam_hop_dong) = 2021;

select ho_ten from khach_hang group by ho_ten;

SELECT 
    dv.ma_dich_vu, 
    dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.so_nguoi_toi_da, 
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu 
FROM dich_vu dv
JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
JOIN hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu 
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
  AND dv.ma_dich_vu NOT IN (
		SELECT ma_dich_vu 
      FROM hop_dong 
      WHERE YEAR(ngay_lam_hop_dong) = 2021
  )
GROUP BY dv.ma_dich_vu;

select ho_ten from khach_hang
group by ho_ten;
select distinct ho_ten from khach_hang;
SELECT ho_ten FROM khach_hang
UNION
SELECT ho_ten FROM khach_hang;

select month(ngay_lam_hop_dong) as thang,
count(ma_khach_hang) as so_luong_khach_hang
from
dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP By MONTH(ngay_lam_hop_dong)
order by thang;

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
hd.tien_dat_coc, count(hdct.ma_dich_vu_di_kem) as so_luong_dvdk from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by ma_hop_dong