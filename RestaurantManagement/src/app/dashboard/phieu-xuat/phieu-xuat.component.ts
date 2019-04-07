import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { PhieuXuatKhoService, ListPhieuXuat, ListNhanVien, ListNguyenLieu, PhieuXuatKho, ChiTietPhieuXuatKho } from 'src/app/services/phieu-xuat-kho.service';
import { ModalDirective } from 'ngx-bootstrap';


@Component({
  selector: 'app-phieu-xuat',
  templateUrl: './phieu-xuat.component.html',
  styleUrls: ['./phieu-xuat.component.css']
})
export class PhieuXuatComponent implements OnInit {
  phieuxuats: ListPhieuXuat;
  nhanviens: ListNhanVien;
  nguyenlieus: ListNguyenLieu;
  phieuxuat: PhieuXuatKho;
  detail: ChiTietPhieuXuatKho;
  phieunhapmoi: PhieuXuatKho = {} as PhieuXuatKho;
  idphieunhapkho: number;
  chitietmoi: ChiTietPhieuXuatKho = {} as ChiTietPhieuXuatKho;
  idnguyenlieu: number;
  chitietphieunhapkho: ChiTietPhieuXuatKho = {} as ChiTietPhieuXuatKho;
  @ViewChild('modaldetail') modaldetail: ModalDirective;
  @ViewChild('modalcomfirm') modalcomfirm: ModalDirective;
  @ViewChild('modalphieu') modalphieu: ModalDirective;
  @ViewChild('modalAddNew') modalAddNew: ModalDirective;
  @ViewChild('modalAddNew1') modalAddNew1: ModalDirective;
  constructor(private titleService: Title, private phieuxuatService: PhieuXuatKhoService) { }

  ngOnInit() {
    this.titleService.setTitle('Phiếu xuất');
    this.loadData();
  }
  loadData() {
    this.phieuxuatService.getAllPhieuXuatKho().subscribe(result => {
      console.log(result);
      this.phieuxuats = result;
    });
  }
  getAll() {
    this.modalAddNew.show();
    this.phieuxuatService.getAllNhanVien().subscribe(result1 => {
      this.nhanviens = result1;
    });
  }
  click_detail(id) {
    this.phieuxuatService.getChiTietTheoPhieu(id).subscribe(result => {
      this.phieuxuatService.getIdPhieuXuatKho(id).subscribe(res => {
        this.phieuxuat = res;
      });
      this.detail = result;
      this.modaldetail.show();
    });
  }
  themmoi() {
    const param = {
      ngayxuat: this.phieunhapmoi.ngayxuat,
      nhanVien_ID: this.phieunhapmoi.nhanVien_ID
    };
    this.phieuxuatService.addPhieuXuat(param).subscribe(result => {
      this.loadData();
      alert('thêm thành công');
      this.modalAddNew.hide();
    });
  }
  them(id) {
    this.modaldetail.hide();
    this.modalAddNew1.show();
    this.phieuxuatService.getAllNguyenLieuXuat().subscribe(result => {
      this.nguyenlieus = result;
    });
    this.chitietmoi.phieuXuatKho_ID = id;
  }
  themNguyenLieu() {
    const param = {
      soluong: this.chitietmoi.soluong,
      donvi: this.chitietmoi.donvi,
      // gia: this.chitietmoi.gia,
      phieuXuatKho_ID: this.chitietmoi.phieuXuatKho_ID,
      nguyenLieu_ID: this.chitietmoi.nguyenLieu_ID
    };
    this.phieuxuatService.addChiTietPhieuXuat(param).subscribe(res1 => {
      this.phieuxuatService.getChiTietTheoPhieu(this.chitietmoi.phieuXuatKho_ID).subscribe(result => {
        this.phieuxuatService.getIdPhieuXuatKho(this.chitietmoi.phieuXuatKho_ID).subscribe(res => {
          this.phieuxuat = res;
        });
        this.idphieunhapkho = result.phieuXuatKho_ID;
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
      // gia: this.chitietphieunhapkho.gia,
      phieuXuatKho_ID: this.chitietphieunhapkho.phieuXuatKho_ID,
      nguyenLieu_ID: this.chitietphieunhapkho.nguyenLieu_ID
    };
    this.phieuxuatService.updateChiTietPhieu(this.chitietphieunhapkho.id, param).subscribe(result1 => {
      this.phieuxuatService.getChiTietTheoPhieu(this.chitietphieunhapkho.phieuXuatKho_ID).subscribe(result => {
        this.phieuxuatService.getIdPhieuXuatKho(this.chitietphieunhapkho.phieuXuatKho_ID).subscribe(res => {
          this.phieuxuat = res;
        });
        this.idphieunhapkho = result.phieuXuatKho_ID;
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
    this.phieuxuatService.getidChiTietPhieuNhap(id).subscribe(result => {
      this.phieuxuatService.getAllNguyenLieuXuat().subscribe(result1 => {
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
    this.phieuxuatService.deleteChiTietPhieuXuat(this.idnguyenlieu).subscribe(result => {
      this.phieuxuatService.getChiTietTheoPhieu(id).subscribe(result1 => {
        this.phieuxuatService.getIdPhieuXuatKho(id).subscribe(res => {
          this.phieuxuat = res;
        });
        this.idphieunhapkho = result.phieuXuatKho_ID;
        this.detail = result1;
      });
      this.modalcomfirm.hide();
      this.modaldetail.show();
    });
  }
}
