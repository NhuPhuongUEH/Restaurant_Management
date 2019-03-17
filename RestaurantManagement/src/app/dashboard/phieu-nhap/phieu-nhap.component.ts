import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { PhieuNhapKhoService, ListPhieu, ListNhaCungCap, ListNhanVien, PhieuNhapKho, ChiTietPhieuNhapKho, ListNguyenLieu } from 'src/app/services/phieu-nhap-kho.service';
import { ModalDirective, formatDate } from 'ngx-bootstrap';

@Component({
  selector: 'app-phieu-nhap',
  templateUrl: './phieu-nhap.component.html',
  styleUrls: ['./phieu-nhap.component.css']
})
export class PhieuNhapComponent implements OnInit {
  phieunhaps: ListPhieu;
  nhacungcaps: ListNhaCungCap;
  nhanviens: ListNhanVien;
  phieunhapmoi: PhieuNhapKho = {} as PhieuNhapKho;
  detail: ChiTietPhieuNhapKho;
  phieunhapkho: PhieuNhapKho;
  nguyenlieus: ListNguyenLieu;
  idphieunhapkho: number;
  chitietmoi: ChiTietPhieuNhapKho = {} as ChiTietPhieuNhapKho;
  @ViewChild('modalAddNew') modalAddNew: ModalDirective;
  @ViewChild('modalAddNew1') modalAddNew1: ModalDirective;
  @ViewChild('modaldetail') modaldetail: ModalDirective;
  constructor(private titleService: Title, private phieunhapService: PhieuNhapKhoService) { }

  ngOnInit() {
    this.titleService.setTitle('Phiếu nhập');
    this.loadData();
  }
  loadData() {
    this.phieunhapService.getAllPhieuNhapKho().subscribe(result => {
      this.phieunhaps = result;
    });
  }
  getAll() {
    this.modalAddNew.show();
    this.phieunhapService.getAllNhaCungCap().subscribe(result => {
      this.nhacungcaps = result;
    });
    this.phieunhapService.getAllNhanVien().subscribe(result1 => {
      this.nhanviens = result1;
    });
  }
  themmoi() {
    const param = {
      ngaylap: this.phieunhapmoi.ngaylap,
      nhaCungCap_ID: this.phieunhapmoi.nhaCungCap_ID,
      nhanVien_ID: this.phieunhapmoi.nhanVien_ID
    };
    this.phieunhapService.addPhieuNhap(param).subscribe(result => {
      this.loadData();
      alert('thêm thành công');
      this.modalAddNew.hide();
    });
  }
  click_detail(id) {
    this.phieunhapService.getChiTietTheoPhieu(id).subscribe(result => {
      this.phieunhapService.getIdPhieuNhapKho(id).subscribe(res => {
        this.phieunhapkho = res;
      });
      this.idphieunhapkho = result.phieuNhapKho_ID;
      this.detail = result;
    });
  }
  them(id) {
    this.modaldetail.hide();
    this.modalAddNew1.show();
    this.phieunhapService.getAllNguyenLieu().subscribe(result => {
      this.nguyenlieus = result;
    });
    this.chitietmoi.phieuNhapKho_ID = id;
  }
  themNguyenLieu() {
    const param = {
      soluong: this.chitietmoi.soluong,
      donvi: this.chitietmoi.donvi,
      gia: this.chitietmoi.gia,
      phieuNhapKho_ID: this.chitietmoi.phieuNhapKho_ID,
      nguyenLieu_ID: this.chitietmoi.nguyenLieu_ID
    };
    this.phieunhapService.addChiTietPhieuNhap(param).subscribe(res1 => {
      this.modalAddNew1.hide();
      this.modaldetail.show();
    });
  }
}
