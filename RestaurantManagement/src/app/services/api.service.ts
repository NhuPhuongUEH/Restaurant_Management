import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  baseUrl = 'https://localhost:44331/api/';
  apiUrl = {
    login : this.baseUrl + 'nhanvien/login',
    monan : this.baseUrl + 'monan',
    loaimonan : this.baseUrl + 'loaimonan',
    hoadon : this.baseUrl + 'hoadon',
    banhang: this.baseUrl + 'monan/banhang',
    chitiethoadon : this.baseUrl + 'chitiethoadon',
    congthuc: this.baseUrl + 'thanhphanmonan/',
    congthucmonan: this.baseUrl + 'thanhphanmonan/monan/',
    tinhtrangmonan: this.baseUrl + 'monan/tinhtrang',
    timnguyenlieu: this.baseUrl + 'nguyenlieu/tim?q=',
    timmonan: this.baseUrl + 'monan/tim?q=',
    ban: this.baseUrl + 'ban',
    timhoadon_phucvu: this.baseUrl + 'ban/hoadon',
    tinhtranghoadon: this.baseUrl + 'hoadon/tinhtrang',
    nhacungcap: this.baseUrl + 'nhacungcap',
    doanhthu: this.baseUrl + 'hoadon/doanhthu',
    tongthuchi: this.baseUrl + 'hoadon/doanhthu/tongthuchi',
    nhanvien: this.baseUrl + 'nhanvien',
    phieunhap: this.baseUrl + 'phieunhapkho',
    chitietphieunhapkho: this.baseUrl + 'chitietphieunhapkho',
    nguyenlieu: this.baseUrl + 'nguyenlieu',
    phieuxuat: this.baseUrl + 'phieuxuatkho',
    chitietphieuxuatkho: this.baseUrl + 'chitietphieuxuatkho',
    thongketonkho: this.baseUrl + 'nguyenlieu/thongketonkho',
    thongkesoluong: this.baseUrl + 'chitiethoadon/thongkesoluong',
    thongkesudung: this.baseUrl + 'nguyenlieu/thongkesudung',
    thongketonkho1: this.baseUrl + 'nguyenlieu/thongketonkho1',
    nguyenlieunhap: this.baseUrl + 'nguyenlieu/nguyenlieunhap',
    nguyenlieuxuat: this.baseUrl + 'nguyenlieu/nguyenlieuxuat'
  };
  constructor() { }
}
