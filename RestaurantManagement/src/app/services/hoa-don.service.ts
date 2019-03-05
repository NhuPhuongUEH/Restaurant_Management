import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface HoaDonInfo {
  id: number;
  ngay: Date;
  trangthai: boolean;
  ghichu: string;
  ban_ID: number;
  nhanVien_ID: number;
  khachHang_ID: number;
  ban: Ban;
  nhanVien: NhanVien;
  khachHang: KhachHang;
  tongtien: number;
}
export interface Ban {
  id: number;
  soban: number;
  trangthai: boolean;
  hoadondangphucvu: number;
}
export interface NhanVien {
  id: number;
  honhanvien: string;
  tennhanvien: string;
  email: string;
  diachi: string;
  matkhau: string;
  trangthai: boolean;
}
export interface KhachHang {
  id: number;
  hokhachhang: string;
  tenkhachhang: string;
  email: string;
  diachi: string;
  dienthoai: string;
  ghichu: string;
}
export interface ChiTietHoaDonInfo {
  id: number;
  soluong: number;
  dongia: number;
  hoaDon_ID: number;
  monAn_ID: number;
  hoaDon: HoaDonInfo;
  monAn: MonAn;
}
export interface MonAn {
  id: number;
  tenmon: string;
  mota: string;
  hinh: string;
  trangthai: boolean;
  gia: number;
  loaiMonAn_ID: number;
  loaiMonAn: LoaiMonAn;
}
export interface LoaiMonAn {
  id: number;
  tenloai: string;
}
export interface ListHoaDon {
  list: HoaDonInfo;
}
@Injectable({
  providedIn: 'root'
})
export class HoaDonService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getAllHoaDon(): Observable<ListHoaDon> {
    return this.http.get<ListHoaDon>(this.api.apiUrl.hoadon);
  }
  public getChiTietHoaDon(id): Observable<ChiTietHoaDonInfo> {
    return this.http.get<ChiTietHoaDonInfo>(this.api.apiUrl.chitiethoadon + '/hoadon/' + id);
  }
  public getTongTienHD(id) {
    return this.http.get(this.api.apiUrl.hoadon + '/tongtien/' + id);
  }
  public getIdHoaDon(id): Observable<HoaDonInfo> {
    return this.http.get<HoaDonInfo>(this.api.apiUrl.hoadon + '/' +  id);
  }
}
