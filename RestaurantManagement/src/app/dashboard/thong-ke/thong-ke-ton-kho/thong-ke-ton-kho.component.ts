import { Component, OnInit } from '@angular/core';
import { ListNguyenLieu, TonKho, ThongKeService } from 'src/app/services/thong-ke.service';
import { Title } from '@angular/platform-browser';
import { formatDate } from 'ngx-bootstrap';


@Component({
  selector: 'app-thong-ke-ton-kho',
  templateUrl: './thong-ke-ton-kho.component.html',
  styleUrls: ['./thong-ke-ton-kho.component.css']
})
export class ThongKeTonKhoComponent implements OnInit {
  nguyenlieus: ListNguyenLieu;
  TonKhos: TonKho[];
  dateTo;
  dateFrom;
  select_nl=0;
  idnguyenlieu: number;
  constructor(private titleService: Title, private thongkeService: ThongKeService) { }

  ngOnInit() {
    this.titleService.setTitle('Thống kê tồn kho');
    this.dateFrom = formatDate(new Date(), 'yyyy-MM-dd', 'en-GB');
    this.dateTo = formatDate(new Date(), 'yyyy-MM-dd', 'en-GB');
    this.loadNguyenLieu();
  }
  loadNguyenLieu() {
    this.thongkeService.getAllNguyenLieu().subscribe(result => {
      this.nguyenlieus = result;
    });
  }
  loadData() {
    const param = {
      idnguyenlieu: this.select_nl,
      dateFrom: this.dateFrom,
      dateTo: this.dateTo
    };
    this.thongkeService.getThongKeTonKho(param).subscribe(result => {
      this.TonKhos = result.data;
    });
  }
  click() {
    console.log(this.select_nl);
    this.loadData();
  }
}
