import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface DoanhThu {
  ngay: Date;
  thu: number;
  chi: number;
}
export interface DoanhThuRespone {
  errorCode: number;
  message: string;
  data: DoanhThu[];
}
export interface TongThuChi {
  maxthu: number;
  maxchi: number;
  tongthu: number;
  tongchi: number;
}
export interface TonKhoRespone {
  errorCode: number;
  message: string;
  data: TonKho[];
}
export interface TonKho {
  id_nguyenlieu: number;
  tennguyenlieu: string;
  dvt: string;
  tondau: number;
  xuat: number;
  nhap: number;
  toncuoi: number;
}
export interface NguyenLieu {
  id: number;
  tennguyenlieu: string;
  donvi: string;
  soluong: number;
}
export interface ListNguyenLieu {
  list: NguyenLieu;
}
export interface SoLuong {
  khoa: string;
  ten_mon: string;
  ngay: Date;
  so_luong: number;
}
export interface SoLuongRespone {
  errorCode: number;
  message: string;
  data: SoLuong[];
}
@Injectable({
  providedIn: 'root'
})
export class ThongKeService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getDoanhThu(data): Observable<DoanhThuRespone> {
    return this.http.post<DoanhThuRespone>(this.api.apiUrl.doanhthu, data);
  }
  public postThuChi(param): Observable<TongThuChi> {
    return this.http.post<TongThuChi>(this.api.apiUrl.tongthuchi, param);
  }
  public getThongKeTonKho(param): Observable<TonKhoRespone> {
    return this.http.post<TonKhoRespone>(this.api.apiUrl.thongketonkho, param);
  }
  public getAllNguyenLieu(): Observable<ListNguyenLieu> {
    return this.http.get<ListNguyenLieu>(this.api.apiUrl.nguyenlieu);
  }
  public getSoLuong(param): Observable<SoLuongRespone> {
    return this.http.post<SoLuongRespone>(this.api.apiUrl.thongkesoluong, param);
  }
}
