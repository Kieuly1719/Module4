use Furama;

select * from nhan_vien where nhan_vien.ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%"; 

select * from khach_hang where TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) >= 18 and (dia_chi LIKE "Đà Nẵng" or dia_chi like "Quảng Trị");

select ten_loai_khach, ho_ten, COUNT(hd.ma_hop_dong) as so_lan_dat_phong 
from loai_khach lk 
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where lk.ten_loai_khach = "Diamond"
group by hd.ma_khach_hang
ORDER BY so_lan_dat_phong ASC;

SELECT 
    kh.ma_khach_hang, 
    kh.ho_ten, 
    lk.ten_loai_khach, 
    hd.ma_hop_dong, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    dv.ten_dich_vu, 
    (IFNULL(dv.chi_phi_thue, 0) + SUM(hdct.so_luong * dvdk.gia)) AS tong_tien
from khach_hang kh
LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY 
    kh.ma_khach_hang, 
    kh.ho_ten, 
    lk.ten_loai_khach, 
    hd.ma_hop_dong, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    dv.ten_dich_vu,
    dv.chi_phi_thue;

