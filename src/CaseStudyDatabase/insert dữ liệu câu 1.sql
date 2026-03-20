use Furama;
INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES
(1, 'Lễ tân'),
(2, 'phục vụ'),
(3, 'chuyên viên'),
(4, 'giám sát'),
(5, 'quản lý'),
(6, 'giám đốc');

INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES
(1, 'Sale-Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUES
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue) VALUES
(1, 'Năm'),
(2, 'Tháng'),
(3, 'Ngày'),
(4, 'Giờ');

INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu) VALUES
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai) VALUES
(1, 'Massage', 500000, 'Lượt', 'Khả dụng'),
(2, 'Karaoke', 200000, 'Giờ', 'Khả dụng'),
(3, 'Thức ăn', 150000, 'Phần', 'Khả dụng'),
(4, 'Nước uống', 30000, 'Chai', 'Khả dụng'),
(5, 'Thuê xe tham quan', 100000, 'Lượt', 'Khả dụng');

INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) VALUES
(1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
(2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 2, 2, 2),
(3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2);
INSERT INTO khach_hang (ma_khach_hang, ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) VALUES
(1, 1, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
(2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
(3, 1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh');

INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang) VALUES
(1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'Vip', 'Có hồ bơi', 500, 4),
(2, 'House Princess 01', 14000, 5000000, 7, 2, 2, 'Vip', 'Có thêm bếp nướng', NULL, 3),
(3, 'Room Twin 01', 5000, 1000000, 2, 4, 3, 'Normal', 'Có tivi', NULL, NULL);

INSERT INTO hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) VALUES
(1, '2020-12-08 14:00:00', '2020-12-08 18:00:00', 0, 1, 1, 3),
(2, '2020-07-14 09:00:00', '2020-07-21 12:00:00', 200000, 2, 3, 1),
(3, '2021-03-15 10:00:00', '2021-03-17 12:00:00', 50000, 3, 2, 2);

INSERT INTO hop_dong_chi_tiet (ma_hop_dong_chi_tiet, ma_hop_dong, ma_dich_vu_di_kem, so_luong) VALUES
(1, 2, 1, 5),
(2, 2, 2, 2),
(3, 2, 3, 5),
(4, 3, 4, 10),
(5, 3, 5, 2);

