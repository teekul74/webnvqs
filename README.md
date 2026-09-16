# Hệ thống Quản lý Hồ sơ Nghĩa vụ Quân sự — Bản Web hoàn chỉnh (v2)

Kiến trúc mới: cơ sở dữ liệu SQLite thật, đăng nhập + phân quyền, giao diện xây bằng React/Vite chuyên nghiệp. Vẫn chạy hoàn toàn local trên máy/mạng nội bộ đơn vị — không cần internet, không cần hosting.

## Cách dùng nhanh nhất — chạy file .exe

1. Giải nén toàn bộ thư mục
2. Nhấp đúp **`dist/QuanLyHoSoNVQS.exe`** — cửa sổ đen hiện ra, để nguyên đó
3. Mở trình duyệt vào `http://localhost:3000`
4. Đăng nhập lần đầu bằng tài khoản quản trị mặc định:
   - **Tên đăng nhập:** `admin`
   - **Mật khẩu:** `admin123`
5. **Đổi mật khẩu ngay** (góc trên phải → tên tài khoản → "Đổi mật khẩu")

⚠️ Nếu Windows Defender cách ly file .exe (dung lượng còn vài chục KB), khôi phục trong **Windows Security → Protection history**, hoặc thêm ngoại lệ trước khi giải nén.

## Quản lý tài khoản (chỉ Quản trị viên)

Vào góc trên phải → tên tài khoản → **"Quản lý tài khoản"** để tạo tài khoản cho từng nhân viên. Có 2 vai trò:
- **Quản trị**: toàn quyền — thêm/sửa/xoá hồ sơ, quản lý tài khoản người khác, tuỳ chỉnh banner
- **Nhân viên**: thêm/sửa/nhập Excel — **không được xoá** hồ sơ hay xoá hàng loạt

## Dùng chung trong mạng nội bộ (LAN)

**Quan trọng: chỉ 1 máy chạy phần mềm — những người khác KHÔNG cần cài đặt gì cả.**

1. Chọn 1 máy làm "máy chủ" (máy để tại phòng, bật cả ngày) — chạy `dist/QuanLyHoSoNVQS.exe` trên máy đó
2. Khi chạy, cửa sổ đen sẽ hiện sẵn các địa chỉ mạng, ví dụ:
   ```
   Người khác trong cùng mạng LAN, vào một trong các địa chỉ sau:
     → http://192.168.1.5:3000
   ```
   Copy đúng địa chỉ đó gửi cho mọi người trong phòng
3. Mọi người mở trình duyệt trên máy họ, dán địa chỉ đó vào, đăng nhập bằng tài khoản riêng (đã được Admin tạo trước) — không cần copy hay cài phần mềm gì lên máy họ

⚠️ Nếu copy file `.exe` sang chạy trên nhiều máy khác nhau, mỗi máy sẽ tạo ra dữ liệu riêng biệt, không đồng bộ với nhau. Chỉ chạy trên đúng 1 máy chủ duy nhất.

## Tự động chạy khi mở máy tính (máy chủ)

Để khỏi phải nhớ mở phần mềm thủ công mỗi ngày:

- Nhấp đúp **`Cai_Dat_Tu_Dong_Chay.bat`** — chỉ cần làm 1 lần. Từ lần mở máy tiếp theo, phần mềm sẽ tự chạy ngầm mỗi khi đăng nhập Windows.
- Nếu muốn gỡ bỏ, nhấp đúp **`Go_Bo_Tu_Dong_Chay.bat`**.

## Dữ liệu lưu ở đâu

Toàn bộ dữ liệu (hồ sơ, tài khoản, ảnh) nằm trong **1 file cơ sở dữ liệu duy nhất**:
```
data/hoso.sqlite
```
Nên sao lưu định kỳ file này ra USB/ổ cứng ngoài.

## Chạy bằng mã nguồn (dành cho phát triển)

Yêu cầu Node.js 22 trở lên (do dùng `node:sqlite`).

```
npm install
npm run build:client   # build giao diện React (chỉ cần chạy lại khi có sửa giao diện)
npm start
```

## Tự đóng gói lại .exe (nếu có chỉnh sửa code)

```
npm run build:win
```

File mới nằm trong `dist/`.

## Sự cố thường gặp

- **"Windows protected your PC"**: bấm "More info" → "Run anyway" — đây là cảnh báo bình thường với .exe không có chữ ký số, không phải virus
- **Quên mật khẩu admin**: xoá file `data/hoso.sqlite` để hệ thống tạo lại tài khoản `admin/admin123` mặc định (⚠️ thao tác này xoá toàn bộ dữ liệu — chỉ dùng khi thực sự cần và không có bản sao lưu)
- **Port 3000 đang bận**: chạy `set PORT=4000 && dist\QuanLyHoSoNVQS.exe` rồi vào `http://localhost:4000`
