import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface BanInfo {
  id: number;
  soban: number;
  trangthai: boolean;
  hoadondangphucvu: number;
}
export interface ListBan {
  ban: BanInfo;
}
@Injectable({
  providedIn: 'root'
})
export class BanService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getAllBan(): Observable<ListBan> {
    return this.http.get<ListBan>(this.api.apiUrl.ban);
  }
  public updateBan(id, param): Observable<BanInfo> {
    return this.http.put<BanInfo>(this.api.apiUrl.ban + '/' + id, param);
  }
}
