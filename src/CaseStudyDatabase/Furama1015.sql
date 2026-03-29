use furama;

SELECT hd.ma_hop_dong,
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    hd.tien_dat_coc, 
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY 
    hd.ma_hop_dong, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    hd.tien_dat_coc;
    
SELECT DISTINCT 
    dvdk.ma_dich_vu_di_kem, 
    dvdk.ten_dich_vu_di_kem
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond' 
  AND (kh.dia_chi LIKE '%Vinh%' OR kh.dia_chi LIKE '%Quảng Ngãi%');

SELECT 
    hd.ma_hop_dong, 
    nv.ho_ten AS ho_ten_nhan_vien, 
    kh.ho_ten AS ho_ten_khach_hang, 
    kh.so_dien_thoai, 
    dv.ten_dich_vu, 
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem, 
    hd.tien_dat_coc
FROM hop_dong hd
JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE (YEAR(hd.ngay_lam_hop_dong) = 2020 AND MONTH(hd.ngay_lam_hop_dong) IN (10, 11, 12))
  AND hd.ma_dich_vu NOT IN (
      SELECT ma_dich_vu 
      FROM hop_dong
      WHERE YEAR(ngay_lam_hop_dong) = 2021 AND MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6
  )
GROUP BY 
    hd.ma_hop_dong, 
    nv.ho_ten, 
    kh.ho_ten, 
    kh.so_dien_thoai, 
    dv.ten_dich_vu, 
    hd.tien_dat_coc;
    
SELECT 
    dvdk.ma_dich_vu_di_kem, 
    dvdk.ten_dich_vu_di_kem, 
    SUM(hdct.so_luong) AS tong_so_luong_su_dung
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY 
    dvdk.ma_dich_vu_di_kem, 
    dvdk.ten_dich_vu_di_kem
HAVING SUM(hdct.so_luong) >= ALL (
    SELECT SUM(so_luong) 
    FROM hop_dong_chi_tiet 
    GROUP BY ma_dich_vu_di_kem
);

SELECT 
    hd.ma_hop_dong, 
    ldv.ten_loai_dich_vu, 
    dvdk.ten_dich_vu_di_kem, 
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM hop_dong hd
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE dvdk.ma_dich_vu_di_kem IN (
    SELECT ma_dich_vu_di_kem
    FROM hop_dong_chi_tiet
    GROUP BY ma_dich_vu_di_kem
    HAVING COUNT(ma_dich_vu_di_kem) = 1
)
GROUP BY 
    hd.ma_hop_dong, 
    ldv.ten_loai_dich_vu, 
    dvdk.ten_dich_vu_di_kem;
    
SELECT 
    nv.ma_nhan_vien, 
    nv.ho_ten, 
    td.ten_trinh_do, 
    bp.ten_bo_phan, 
    nv.so_dien_thoai, 
    nv.dia_chi
FROM nhan_vien nv
JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
LEFT JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien 
                     AND YEAR(hd.ngay_lam_hop_dong) IN (2020, 2021)
GROUP BY 
    nv.ma_nhan_vien, 
    nv.ho_ten, 
    td.ten_trinh_do, 
    bp.ten_bo_phan, 
    nv.so_dien_thoai, 
    nv.dia_chi
HAVING COUNT(hd.ma_hop_dong) <= 3;