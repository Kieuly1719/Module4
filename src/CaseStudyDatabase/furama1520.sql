use furama;

DELETE FROM nhan_vien 
WHERE ma_nhan_vien NOT IN (
    SELECT ma_nhan_vien 
    FROM hop_dong 
    WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
);

UPDATE khach_hang 
SET ma_loai_khach = (SELECT ma_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Diamond')
WHERE ma_khach_hang IN (
    SELECT * FROM (
        SELECT kh.ma_khach_hang
        FROM khach_hang kh
        JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE lk.ten_loai_khach = 'Platinum' 
          AND YEAR(hd.ngay_lam_hop_dong) = 2021
        GROUP BY kh.ma_khach_hang
        HAVING SUM(dv.chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia, 0)) > 10000000
    ) AS temp
);

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM khach_hang 
WHERE ma_khach_hang IN (
    SELECT ma_khach_hang 
    FROM hop_dong 
    WHERE YEAR(ngay_lam_hop_dong) < 2021
);

SET FOREIGN_KEY_CHECKS = 1;

UPDATE dich_vu_di_kem 
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (
    SELECT * FROM (
        SELECT hdct.ma_dich_vu_di_kem
        FROM hop_dong_chi_tiet hdct
        JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
        GROUP BY hdct.ma_dich_vu_di_kem
        HAVING SUM(hdct.so_luong) > 10
    ) AS temp
);

SELECT 
    ma_nhan_vien AS id, 
    ho_ten, 
    email, 
    so_dien_thoai, 
    ngay_sinh, 
    dia_chi,
    'Nhân viên' AS vai_tro -- Thêm cột này để dễ phân biệt
FROM nhan_vien

UNION ALL

SELECT 
    ma_khach_hang AS id, 
    ho_ten, 
    email, 
    so_dien_thoai, 
    ngay_sinh, 
    dia_chi,
    'Khách hàng' AS vai_tro
FROM khach_hang;