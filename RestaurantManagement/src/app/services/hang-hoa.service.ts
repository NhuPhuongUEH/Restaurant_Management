import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface MonAnInfo {
  id: number;
  tenmon: string;
  mota: string;
  hinh: string;
  trangthai: string;
  gia: number;
  loaiMonAn_ID: number;
  loaiMonAn: LoaiMonAn;
}
export interface LoaiMonAn {
  id: number;
  tenloai: string;
}
export interface ListMonAn {
  monan: MonAnInfo;
}
export interface ListLoaiMonAn {
  loaimonan: LoaiMonAn;
}
export interface NguyenLieu {
  id: number;
  tennguyenlieu: string;
  donvi: string;
  soluong: number;
}
export interface ThanhPhan {
  id: number;
  soluong: number;
  nguyenLieu: NguyenLieu[];
}
@Injectable({
  providedIn: 'root'
})
export class HangHoaService {
  constructor(private api: ApiService, private http: HttpClient) { }
  public getAllMonAn(): Observable<ListMonAn> {
    return this.http.get<ListMonAn>(this.api.apiUrl.monan);
  }
  public getChiTietMonAn(id): Observable<MonAnInfo> {
    return this.http.get<MonAnInfo>(this.api.apiUrl.monan + '/' + id);
  }
  public updateTinhTrangMonAn(param, id): Observable<MonAnInfo> {
    return this.http.put<MonAnInfo>(this.api.apiUrl.tinhtrangmonan + '/' + id, param);
  }
}
