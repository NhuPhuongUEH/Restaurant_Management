import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface NhaCungCapInfo {
  id: number;
  ten: string;
  diachi: string;
  sodienthoai: string;
}
export interface ListNhaCungCap {
  list: NhaCungCapInfo;
}
@Injectable({
  providedIn: 'root'
})
export class NhaCungCapService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getAll(): Observable<ListNhaCungCap> {
    return this.http.get<ListNhaCungCap>(this.api.apiUrl.nhacungcap);
  }
  public get(id): Observable<NhaCungCapInfo> {
    return this.http.get<NhaCungCapInfo>(this.api.apiUrl.nhacungcap + '/' + id);
  }
  public add(data: NhaCungCapInfo): Observable<NhaCungCapInfo> {
    return this.http.post<NhaCungCapInfo>(this.api.apiUrl.nhacungcap, data);
  }
  public update(data: NhaCungCapInfo): Observable<NhaCungCapInfo> {
    return this.http.put<NhaCungCapInfo>(this.api.apiUrl.nhacungcap + '/' + data.id, data);
  }
  public delete(id): Observable<NhaCungCapInfo> {
    return this.http.delete<NhaCungCapInfo>(this.api.apiUrl.nhacungcap + '/' + id);
  }
}
