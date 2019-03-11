import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { BanService, ListBan } from 'src/app/services/ban.service';
import { HangHoaService, ListMonAn } from 'src/app/services/hang-hoa.service';
import { HoaDonService, ChiTietHoaDonInfo } from 'src/app/services/hoa-don.service';
import { BanHangService } from 'src/app/services/ban-hang.service';
import { ModalDirective } from 'ngx-bootstrap';

@Component({
  selector: 'app-ban-hang',
  templateUrl: './ban-hang.component.html',
  styleUrls: ['./ban-hang.component.css']
})
export class BanHangComponent implements OnInit {
  bans: ListBan;
  monans: ListMonAn;
  ip_tim_monan = '';
  id_hoadon = '';
  soban: number;
  id_ban: number;
  tongtienHD = 0;
  chitietHDs: ChiTietHoaDonInfo;
  @ViewChild('modalthanhtoan') modalthanhtoan: ModalDirective;
  @ViewChild('modalphucvu') modalphucvu: ModalDirective;
  constructor(private titleService: Title, private ban: BanService, private monanService: HangHoaService, private hoadonService: HoaDonService, private banhangService: BanHangService) { }

  ngOnInit() {
    this.titleService.setTitle('Bán hàng');
    this.ban.getAllBan().subscribe(result => {
      this.bans = result;
    });
    this.loadMonAn();
  }
  loadMonAn() {
    this.monanService.getAllMonAnBanHang().subscribe(result => {
      this.monans = result;
    });
  }
  loadChitiet() {
    this.hoadonService.getChiTietHoaDon(Number(this.id_hoadon)).subscribe(result => {
      this.chitietHDs = result;
      //console.log(result.id);

    });
    this.hoadonService.getTongTienHD(Number(this.id_hoadon)).subscribe(result => {
      this.tongtienHD = Number(result);
      if (this.tongtienHD <= 0) {
        document.getElementById('btn_daphucvu').classList.add('disabled');
        document.getElementById('btn_thanhtoan').classList.add('disabled');
      } else {
        document.getElementById('btn_thanhtoan').classList.remove('disabled');
        document.getElementById('btn_daphucvu').classList.remove('disabled');
      }
    });
  }
  chon_ban(id, soban) {
    this.soban = soban;
    this.id_ban = id;
    this.banhangService.getidHoaDon(id).subscribe(result => {
      this.id_hoadon = result.toString();
      this.loadChitiet();
    });
    document.getElementById('pills-home-tab').classList.remove('active');
    document.getElementById('pills-profile-tab').classList.add('active');
    document.getElementById('maban_' + id).classList.remove('active');
  }
  tim_monan() {
    this.monanService.TimMonAn(this.ip_tim_monan).subscribe(result => {
      this.monans = result;
    });
  }
  chon_mon(id, gia) {
    if (this.id_hoadon === undefined || this.id_hoadon === '') {
      alert('Chưa chọn bàn');
      return;
    }

    const param = {
      idHoaDon: this.id_hoadon,
      idMonAn: id
    };
    //kiểm tra hóa đơn, chưa có thì tạo mới
    this.hoadonService.getIdHoaDon(this.id_hoadon).subscribe(res => {
      if (res.id === 0) {
        const data = {
          ngay: new Date(),
          trangthai: false,
          ghichu: null,
          nhanVien_ID: localStorage.getItem('userid').toString(),
          ban_ID: this.id_ban,
          khachHang_ID: 1,
        };
        const data_ban = {
          trangthai: true,
          hoadondangphucvu: this.id_hoadon,
        };
        this.hoadonService.themHoaDon(data).subscribe(kq => {
          this.ban.updateBan(this.id_ban, data_ban).subscribe(); // update bàn
        });
        // thêm hóa don mới
      }
      //  kiểm tra món ăn trước khi thêm
      this.banhangService.kiemtramonan(param).subscribe(result => {
        //  update lại trạng thái hóa đơn nếu trước đó đã thanh toán
        // tslint:disable-next-line: max-line-length
        this.hoadonService.updateThanhToan(this.id_hoadon,
          {
            trangthai: false,
            nhanVien_ID: localStorage.getItem('userid').toString()
          }).subscribe();

        if (result === true) {
          // thêm
          const ct = {
            soluong: 1,
            dongia: gia,
            monAn_ID: id,
            hoaDon_ID: this.id_hoadon,
          };
          this.banhangService.themhoadon(ct).subscribe(kq => {
            this.loadChitiet();
            const ban = document.getElementById('ban_' + this.id_ban);
            ban.setAttribute('src', '/assets/images/chair2.png');
          });
        } else {
          const ct = {
            monAn_ID: id,
            hoaDon_ID: this.id_hoadon,
          };
          this.banhangService.themChiTietHoaDonDaCo(ct).subscribe(kq => {
            this.loadChitiet();
            const ban = document.getElementById('ban_' + this.id_ban);
            ban.setAttribute('src', '/assets/images/chair2.png');
          });
        }
      });

    });
  }
  xoa_chi_tiet(id_chitiet) {
    this.hoadonService.deleteChiTiet(id_chitiet).subscribe(kq => {
      this.loadChitiet();
    });
  }
  doi_so_luong_chi_tiet(id_chitiet) {
    const sl = (<HTMLInputElement>document.getElementById('tp_soluong_' + id_chitiet)).value;
    const data = {
      soluong: sl,
    };
    const param = {
      trangthai: false,
      nhanVien_ID: localStorage.getItem('userid').toString(),
    };
    this.hoadonService.updateThanhToan(this.id_hoadon, param).subscribe(kq1 => {
      this.banhangService.updateSoLuong(id_chitiet, data).subscribe(kq => {
        this.loadChitiet();
      });
    });
  }
  printHD() {
    const ghi_chu = (<HTMLInputElement>document.getElementById('ghi_chu')).value;
    const param = {
      trangthai: true,
      nhanVien_ID: localStorage.getItem('userid').toString(),
      ghichu: ghi_chu,
    };
    this.hoadonService.updateThanhToan(this.id_hoadon, param).subscribe(kq => {
      const content = document.getElementById('noidungHD').innerHTML;
      const mywindow = window.open('');

      mywindow.document.write('<html><head><title>Print</title>');
      mywindow.document.write('</head><body>');
      mywindow.document.write(content);
      mywindow.document.write('</body></html>');

      mywindow.document.close();
      mywindow.focus();
      mywindow.print();
      mywindow.close();
      document.getElementById('btn_thanhtoan').classList.add('disabled');
      this.chitietHDs[0].hoaDon.trangthai = true;
      this.modalthanhtoan.hide();
    });

  }
  ngungphucvu() {
    if (this.chitietHDs[0].hoaDon.trangthai === false) {
      alert('Bàn chưa thanh toán');
      this.modalphucvu.hide();
      return;
    }
    const param = {
      trangthai: false,
      hoadonphucvu: null,
    };
    this.ban.updateBan(this.id_ban, param).subscribe(kq => {
      this.chitietHDs = null;
      this.tongtienHD = 0;
      const ban = document.getElementById('ban_' + this.id_ban);
      ban.setAttribute('src', '/assets/images/chair.png');
      document.getElementById('btn_daphucvu').classList.add('disabled');
      document.getElementById('btn_thanhtoan').classList.add('disabled');
      this.id_hoadon = null;
      this.modalphucvu.hide();
    });
  }
  showThanhtoan() {
    if ((document.getElementById('btn_thanhtoan').classList.contains('disabled'))) {
      return;
    }
    this.modalthanhtoan.show();
  }
  showNgungphucvu() {
    if ((document.getElementById('btn_daphucvu').classList.contains('disabled'))) {
      return;
    }
    this.modalphucvu.show();
  }
}
