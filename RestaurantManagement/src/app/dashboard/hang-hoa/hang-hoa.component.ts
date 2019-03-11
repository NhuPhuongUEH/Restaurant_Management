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
  @ViewChild('modalAddNew') modalAddNew: ModalDirective;
  @ViewChild('modalDetail') modalDetail: ModalDirective;
  @ViewChild('modalcomfirm') modalcomfirm: ModalDirective;
  @ViewChild('modalUpdate') modalUpdate: ModalDirective;
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
    this.modalDetail.show();
  }
  updateTrangThai(event, id) {
    event.preventDefault();
    this.monanService.getChiTietMonAn(id).subscribe(res => {
      this.id_monan = res.id;
      this.trangthai = res.trangthai;
      if (this.trangthai === 'đang kinh doanh') {
        const param = {
          trangthai: 'ngừng kinh doanh',
        };
        this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(result => {
          if (document.getElementById('btn-tinhtrang').classList.contains('btn-danger')) {
            document.getElementById('btn-tinhtrang').classList.remove('btn-danger');
          }
          document.getElementById('btn-tinhtrang').classList.add('btn-success');
          this.loadData();
        });
      } else {
        const param = {
          trangthai: 'đang kinh doanh'
        };
        this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(res => {
          console.log(res);
          if (document.getElementById('btn-tinhtrang').classList.contains('btn-success')) {
            document.getElementById('btn-tinhtrang').classList.remove('btn-success');
          }
          document.getElementById('btn-tinhtrang').classList.add('btn-danger');
          this.loadData();
        });
      }
    });
    this.modalDetail.hide();
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
  getThanhPhan(id) {
    this.monanService.getThanhPhanHienTai(id).subscribe(result => {
      this.thanhphans = result;
    });
  }
  timNguyenLieu(query) {
    this.monanService.TimNguyenLieu(query).subscribe(result => {
      this.nguyenlieus = result;
    });
  }
  thanhphan_uptodown() {
    if (this.sl_tp_up === undefined) {
      alert('chưa chọn nguyên liệu');
      return;
    }
    if (this.ip_tp_soluong === undefined || this.ip_tp_soluong === null || this.ip_tp_soluong === 0) {
      alert('Số lượng nguyên liệu không hợp lệ');
      return;
    }
    const param = {
      "soluong": this.ip_tp_soluong,
      "nguyenLieu_ID": this.sl_tp_up,
      "monAn_ID": this.tp_idmonan,
    };
    this.monanService.ThemThanhPhan(param).subscribe(result => {
      console.log(result);
      this.getThanhPhan(this.tp_idmonan);
    });
  }
  thanhphan_downtoup() {
    if (this.sl_tp_down === undefined) {
      alert('Chưa chọn nguyên liệu');
      return;
    }
    this.monanService.XoaThanhPhan(this.sl_tp_down).subscribe(result => {
      this.getThanhPhan(this.tp_idmonan);
    });
  }
  getAllLoai() {
    this.modalAddNew.show();
    this.monanService.getAllLoaiMonAn().subscribe(result => {
      this.loaimonans = result;
    });
  }
  themMonAn() {
    const formData: FormData = new FormData();
    formData.append('tenmon', this.sanphammoi.tenmon);
    formData.append('gia', this.sanphammoi.gia.toString());
    formData.append('file', this.sanphammoi.hinh);
    formData.append('trangthai', this.sanphammoi.trangthai);
    formData.append('mota', this.cke_them);
    formData.append('loaiMonAn_ID', this.sanphammoi.loaiMonAn_ID.toString());
    this.monanService.addnewMonAn(formData).subscribe(result => {
      if (result['errorCode'] === 1) {
        alert('Lỗi');
        return;
      } else {
        this.loadData();
        alert('Thêm thành công');
        this.modalAddNew.hide();
      }
    });
  }
  handleUpload(event) {
    this.sanphammoi.hinh = event.target.files[0];
  }

  showCapNhat() {
    this.monanService.getAllLoaiMonAn().subscribe(result => {
      this.loaimonans = result;
    });
    this.sanphamupdate.id = this.detail.id;
    this.sanphamupdate.tenmon = this.detail.tenmon;
    this.sanphamupdate.gia = this.detail.gia;
    this.sanphamupdate.loaiMonAn_ID = this.detail.loaiMonAn_ID;
    this.sanphamupdate.hinh = this.detail.hinh;
    this.sanphamupdate.trangthai = this.detail.trangthai;
    this.sanphamupdate.mota = this.detail.mota;
    this.sanphamupdate.loaiMonAn_ID = this.detail.loaiMonAn_ID;
    this.cke_them = this.detail.mota;
    this.modalDetail.hide();
    this.modalUpdate.show();
  }
  // tslint:disable-next-line: member-ordering
  imageUpdate: File = null;
  handleUploadUpdate(event) {
    this.imageUpdate = event.target.files[0];
    this.sanphamupdate.hinh = this.imageUpdate.name;
  }
  capNhatHangHoa() {
    const formData: FormData = new FormData();

    formData.append('tenmonan', this.sanphamupdate.tenmon);
    formData.append('dongia', this.sanphamupdate.gia.toString());
    formData.append('hinh', this.sanphamupdate.hinh);
    formData.append('trangthai', this.sanphamupdate.trangthai);
    formData.append('mota', this.cke_them);
    formData.append('loaiMonAn_ID', this.sanphamupdate.loaiMonAn_ID.toString());
    formData.append('File', this.imageUpdate);

    this.monanService.updateMonAn(this.sanphamupdate.id, formData).subscribe(result => {
      if (result['errorCode'] === 0) {
        this.loadData();
        alert('Thành công!');
        this.modalUpdate.hide();
      } else {
        alert("Có lỗi xảy ra");
      }
    });
  }
}
