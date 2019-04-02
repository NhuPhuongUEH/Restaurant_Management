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
  idnguyenlieu: number;
  chitietphieunhapkho: ChiTietPhieuNhapKho = {} as ChiTietPhieuNhapKho;
  @ViewChild('modalcomfirm') modalcomfirm: ModalDirective;
  @ViewChild('modalphieu') modalphieu: ModalDirective;
  @ViewChild('modalAddNew') modalAddNew: ModalDirective;
  @ViewChild('modalAddNew1') modalAddNew1: ModalDirective;
  @ViewChild('modaldetail') modaldetail: ModalDirective;// cho do t an cai detail di van ko dc
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
      this.modaldetail.show();
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
      this.phieunhapService.getChiTietTheoPhieu(this.chitietmoi.phieuNhapKho_ID).subscribe(result => {
        this.phieunhapService.getIdPhieuNhapKho(this.chitietmoi.phieuNhapKho_ID).subscribe(res => {
          this.phieunhapkho = res;
        });
        this.idphieunhapkho = result.phieuNhapKho_ID;
        this.detail = result;
      });
      this.modalAddNew1.hide();
      this.modaldetail.show();
    });
  }
  save() {
    const param = {
      soluong: this.chitietphieunhapkho.soluong,
      donvi: this.chitietphieunhapkho.donvi,
      gia: this.chitietphieunhapkho.gia,
      phieuNhapKho_ID: this.chitietphieunhapkho.phieuNhapKho_ID,
      nguyenLieu_ID: this.chitietphieunhapkho.nguyenLieu_ID
    };
    this.phieunhapService.updateChiTietPhieu(this.chitietphieunhapkho.id, param).subscribe(result1 => {
      this.phieunhapService.getChiTietTheoPhieu(this.chitietphieunhapkho.phieuNhapKho_ID).subscribe(result => {
        this.phieunhapService.getIdPhieuNhapKho(this.chitietphieunhapkho.phieuNhapKho_ID).subscribe(res => {
          this.phieunhapkho = res;
        });
        this.idphieunhapkho = result.phieuNhapKho_ID;
        this.detail = result;
      });
      this.modalphieu.hide();
      this.modaldetail.show();
    });
  }
  showModal(event = null, id: number = 0) {
    if (event) {
      event.preventDefault();
    }
    this.phieunhapService.getidChiTietPhieuNhap(id).subscribe(result => {
      this.phieunhapService.getAllNguyenLieu().subscribe(result1 => {
        this.nguyenlieus = result1;
      });
      this.chitietphieunhapkho = result;
      this.modaldetail.hide();
      this.modalphieu.show();
    });
  }
  delConfirm(event, id) {
    event.preventDefault();
    this.modaldetail.hide();
    this.idnguyenlieu = id;
    this.modalcomfirm.show();
  }
  delete(id) {
    this.phieunhapService.deleteChiTietPhieuNhap(this.idnguyenlieu).subscribe(result => {
      this.phieunhapService.getChiTietTheoPhieu(id).subscribe(result1 => {
        this.phieunhapService.getIdPhieuNhapKho(id).subscribe(res => {
          this.phieunhapkho = res;
        });
        this.idphieunhapkho = result.phieuNhapKho_ID;
        this.detail = result1;
      });
      this.modalcomfirm.hide();
      this.modaldetail.show();
    });
  }
}
