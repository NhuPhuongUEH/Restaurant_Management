import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface LoginRespone {
  errorCode: number;
  message: string;
  data: LoginData;
}
export interface LoginData {
  id: number;
  trangthai: boolean;
  ten: string;
  ho: string;
  token: '';
}
@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public login(Email: string, MatKhau: string): Observable<LoginRespone> {
    const requestData = {
      email: Email,
      matkhau: MatKhau
    };
    return this.http.post<LoginRespone>(this.api.apiUrl.login, requestData);
  }
}
