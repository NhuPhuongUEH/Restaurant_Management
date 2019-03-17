import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface PhieuNhapKho {
  id: number;
  ngaylap: Date;
  nhaCungCap_ID: number;
  nhanVien_ID: number;
  nhaCungCap: NhaCungCap;
  nhanVien: NhanVien;
}
export interface ListPhieu {
  list: PhieuNhapKho;
}
export interface NhaCungCap {
  id: number;
  ten: string;
  diachi: string;
  sodienthoai: string;
}
export interface ListNhaCungCap {
  list: NhaCungCap;
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
export interface ChiTietPhieuNhapKho {
  id: number;
  soluong: number;
  donvi: string;
  gia: number;
  phieuNhapKho_ID: number;
  nguyenLieu_ID: number;
  phieuNhapKho: PhieuNhapKho;
  nguyenLieu: NguyenLieu;
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
export class PhieuNhapKhoService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getAllPhieuNhapKho(): Observable<ListPhieu> {
    return this.http.get<ListPhieu>(this.api.apiUrl.phieunhap);
  }
  public getAllNhaCungCap(): Observable<ListNhaCungCap> {
    return this.http.get<ListNhaCungCap>(this.api.apiUrl.nhacungcap);
  }
  public getAllNhanVien(): Observable<ListNhanVien> {
    return this.http.get<ListNhanVien>(this.api.apiUrl.nhanvien);
  }
  public addPhieuNhap(param): Observable<PhieuNhapKho> {
    return this.http.post<PhieuNhapKho>(this.api.apiUrl.phieunhap, param);
  }
  public getAllNguyenLieu(): Observable<ListNguyenLieu> {
    return this.http.get<ListNguyenLieu>(this.api.apiUrl.nguyenlieu);
  }
  public getChiTietTheoPhieu(id): Observable<ChiTietPhieuNhapKho> {
    return this.http.get<ChiTietPhieuNhapKho>(this.api.apiUrl.chitietphieunhapkho + '/phieunhapkho/' + id);
  }
  public getIdPhieuNhapKho(id): Observable<PhieuNhapKho> {
    return this.http.get<PhieuNhapKho>(this.api.apiUrl.phieunhap + '/' + id);
  }
  public addChiTietPhieuNhap(param): Observable<ChiTietPhieuNhapKho> {
    return this.http.post<ChiTietPhieuNhapKho>(this.api.apiUrl.chitietphieunhapkho, param);
  }
}
