import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  baseUrl = 'https://localhost:44331/api/';
  apiUrl = {
    login : this.baseUrl + 'nhanvien/login'
  };
  constructor() { }
}
