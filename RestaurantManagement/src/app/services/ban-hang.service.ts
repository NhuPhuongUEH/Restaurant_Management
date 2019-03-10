import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class BanHangService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getidHoaDon(id) {
    return this.http.get(this.api.apiUrl.timhoadon_phucvu + '/' + id);
  }
  public kiemtramonan(param) {
    return this.http.post(this.api.apiUrl.chitiethoadon + '/kiemtra', param);
  }
  public themhoadon(param) {
    return this.http.post(this.api.apiUrl.chitiethoadon, param);
  }
  public updateSoLuong(id, param) {
    return this.http.put(this.api.apiUrl.chitiethoadon + '/' + id, param);
  }
  public themChiTietHoaDonDaCo(param) {
    return this.http.put(this.api.apiUrl.chitiethoadon + '/daco', param);
  }
}
