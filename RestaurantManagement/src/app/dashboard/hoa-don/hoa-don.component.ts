import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { ListHoaDon, HoaDonService, ChiTietHoaDonInfo, HoaDonInfo } from 'src/app/services/hoa-don.service';

@Component({
  selector: 'app-hoa-don',
  templateUrl: './hoa-don.component.html',
  styleUrls: ['./hoa-don.component.css']
})
export class HoaDonComponent implements OnInit {
  hoadons: ListHoaDon;
  tongtienHD: number = 0;
  detail: ChiTietHoaDonInfo;
  hoadonif: HoaDonInfo;
  constructor(private titleService: Title, private hoadonService: HoaDonService) { }

  ngOnInit() {
    this.titleService.setTitle('Hóa đơn');
    this.loadData();
  }
  loadData() {
    this.hoadonService.getAllHoaDon().subscribe(result => {
      this.hoadons = result;
    });
  }
  click_detail(id) {
    this.hoadonService.getChiTietHoaDon(id).subscribe(result => {
      this.hoadonService.getTongTienHD(id).subscribe(res => {
        this.tongtienHD = Number(res);
      });
      this.hoadonService.getIdHoaDon(id).subscribe(res1 => {
        this.hoadonif = res1;
      });
      this.detail = result;
    });
  }
}
