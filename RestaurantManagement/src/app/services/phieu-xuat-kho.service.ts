import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface PhieuXuatKho {
  id: number;
  ngayxuat: Date;
  nhanVien: NhanVien;
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
export interface ListNhanVien {
  list: NhanVien;
}
export interface ChiTietPhieuXuatKho {
  id: number;
  soluong: number;
  donvi: string;
  gia: number;
  phieuXuatKho_ID: number;
  nguyenLieu_ID: number;
  phieuXuatKho: PhieuXuatKho;
  nguyenLieu: NguyenLieu;
}
export interface ListPhieuXuat {
  list: PhieuXuatKho;
}
export interface ListChiTietPhieuXuatKho {
  list: ChiTietPhieuXuatKho;
}
export interface NguyenLieu {
  id: number;
  tennguyenlieu: string;
  soluong: number;
  donvi: string;
}
export interface ListNguyenLieu {
  list: NguyenLieu;
}
@Injectable({
  providedIn: 'root'
})
export class PhieuXuatKhoService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getAllPhieuXuatKho(): Observable<ListPhieuXuat> {
    return this.http.get<ListPhieuXuat>(this.api.apiUrl.phieuxuat);
  }
  public getAllNhanVien(): Observable<ListNhanVien> {
    return this.http.get<ListNhanVien>(this.api.apiUrl.nhanvien);
  }
  public getAllNguyenLieu(): Observable<ListNguyenLieu> {
    return this.http.get<ListNguyenLieu>(this.api.apiUrl.nguyenlieu);
  }
  public getChiTietTheoPhieu(id): Observable<ChiTietPhieuXuatKho> {
    return this.http.get<ChiTietPhieuXuatKho>(this.api.apiUrl.chitietphieuxuatkho + '/phieuxuatkho/' + id);
  }
  public getIdPhieuXuatKho(id): Observable<PhieuXuatKho> {
    return this.http.get<PhieuXuatKho>(this.api.apiUrl.phieuxuat + '/' + id);
  }
}
