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
  @ViewChild('modaldetail') modaldetail: ModalDirective;
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
  click_detail(id) {
    this.phieuxuatService.getChiTietTheoPhieu(id).subscribe(result => {
      this.phieuxuatService.getIdPhieuXuatKho(id).subscribe(res => {
        this.phieuxuat = res;
      });
      this.detail = result;
    });
  }
}
