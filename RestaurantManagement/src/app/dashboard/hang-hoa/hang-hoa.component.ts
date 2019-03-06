import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { ListMonAn, MonAnInfo, ThanhPhan, NguyenLieu, ListLoaiMonAn, HangHoaService } from 'src/app/services/hang-hoa.service';
import { ModalDirective } from 'ngx-bootstrap';

@Component({
  selector: 'app-hang-hoa',
  templateUrl: './hang-hoa.component.html',
  styleUrls: ['./hang-hoa.component.css']
})
export class HangHoaComponent implements OnInit {
  cke_them = ``;
  sanphams: ListMonAn;
  detail: MonAnInfo;
  thanhphans: ThanhPhan;
  nguyenlieus: NguyenLieu[];
  loaimonans: ListLoaiMonAn;
  sanphammoi: MonAnInfo = {} as MonAnInfo;
  sanphamupdate: MonAnInfo = {} as MonAnInfo;
  tp_idmonan: number;
  sl_tp_up: number;
  sl_tp_down: number;
  ip_tp_soluong: number;
  id_monan: number;
  trangthai: string;
  @ViewChild('modalDetail') modalDetail: ModalDirective;
  @ViewChild('modalcomfirm') modalcomfirm: ModalDirective;
  constructor(private titleService: Title, private monanService: HangHoaService) { }

  ngOnInit() {
    this.titleService.setTitle('Sản phẩm');
    this.loadData();
  }
  loadData() {
    this.monanService.getAllMonAn().subscribe(result => {
      this.sanphams = result;
    });
  }
  clickdetail(id) {
    this.monanService.getChiTietMonAn(id).subscribe(result => {
      this.tp_idmonan = result.id;
      this.detail = result;
    });
  }
  updateTrangThai(event, id) {
    event.preventDefault();
    this.monanService.getChiTietMonAn(id).subscribe(result => {
      this.id_monan = result.id;
      this.trangthai = result.trangthai;
      if (this.trangthai === 'đang kinh doanh') {
        const param = {
          trangthai: 'ngừng kinh doanh',
        };
        this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(res => {
          console.log(res);
          if (document.getElementById('btn-tinhtrang').classList.contains('btn-danger')) {
            document.getElementById('btn-tinhtrang').classList.remove('btn-danger');
          }
          document.getElementById('btn-tinhtrang').classList.add('btn-success');
          this.loadData();
        });
      } else {
        const param = {
          trangthai: 'đang kinh doanh',
        };
        this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(res1 => {
          console.log(res1);
          if (document.getElementById('btn-tinhtrang').classList.contains('btn-success')) {
            document.getElementById('btn-tinhtrang').classList.remove('btn-success');
          }
          document.getElementById('btn-tinhtrang').classList.add('btn-danger');
          this.loadData();
        });
      }
    });
    this.modalDetail.hide();
    this.loadData();
  }
  deleteMonAn(id) {
    this.monanService.getChiTietMonAn(id).subscribe(result => {
      this.id_monan = result.id;
      this.trangthai = result.trangthai;
      const param = {
        trangthai: 'xóa'
      };
      this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(res => {
        this.loadData();
      });
    });
    this.modalcomfirm.hide();
  }
  delConfirm(event) {
    event.preventDefault();
    this.modalDetail.hide();
    this.modalcomfirm.show();
  }
}
