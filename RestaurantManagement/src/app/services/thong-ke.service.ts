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
}
