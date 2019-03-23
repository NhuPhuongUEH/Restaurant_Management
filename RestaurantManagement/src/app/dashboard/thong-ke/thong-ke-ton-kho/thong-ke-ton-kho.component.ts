import { Component, OnInit } from '@angular/core';
import { ListNguyenLieu, TonKho, ThongKeService, SuDung } from 'src/app/services/thong-ke.service';
import { Title } from '@angular/platform-browser';
import { Chart } from 'angular-highcharts';
import { formatDate } from '@angular/common';


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
  select_ngl:0;
  idnguyenlieu: number;
  chart: Chart;
  dateto;
  datefrom;
  SuDungs: SuDung[];
  constructor(private titleService: Title, private thongkeService: ThongKeService) { }

  ngOnInit() {
    this.titleService.setTitle('Thống kê tồn kho');
    this.dateFrom = formatDate(new Date(), 'yyyy-MM-dd', 'en-GB');
    this.dateTo = formatDate(new Date(), 'yyyy-MM-dd', 'en-GB');
    this.datefrom = formatDate(new Date(), 'yyyy-MM-dd', 'en-GB');
    this.dateto = formatDate(new Date(), 'yyyy-MM-dd', 'en-GB');
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
  loadData1() {
    const param = {
      dateFrom: this.datefrom,
      dateTo: this.dateto,
      idnguyenlieu: this.select_ngl
    };
    this.thongkeService.getSuDung(param).subscribe(result => {
        this.SuDungs = result.data;
        const arrsudung = [];
        const arrxuat = [];
        const arrngay = [];
        result.data.forEach(element => {
          arrsudung.push(element.soluongsudung);
          arrxuat.push(element.soluongxuat);
          arrngay.push(formatDate(element.ngay, 'dd-MM-yyyy', 'en-GB'));
        });
        this.chart = new Chart({
          lang: {
            numericSymbols: [` gram`, ` kg`],
            numericSymbolMagnitude: 1,
            decimalPoint: ',', ///phân cách thập phân
            thousandsSep: '.' ///hàng ngàn
          },
          chart: {
            style: {
              fontFamily: `tahoma`, /// chỉnh font cho chữ thống dc đúng
              fontSize: '16px'
            },
            type: 'column',
            plotBorderWidth: 1,
          },
          title: {
            text: 'Thống kê Nguyên Liêu sử dụng',
            align: 'center',
            style: {
              color: 'red',
              fontWeight: 'bold',
              fontSize: '1.5rem'
            },
            y: 20,
          },
          subtitle: {
            text: `Từ ${formatDate(this.datefrom, 'dd-MM-yyyy', 'en-GB')} đến ${formatDate(this.dateto, 'dd-MM-yyyy', 'en-GB')}`
          },
          xAxis: {
            categories: arrngay
          },
          yAxis: {
            title: {
              text: 'Số lượng kilogram',

              style: {
                color: 'blue',
                fontWeight: 'bold',
                fontSize: '1rem'
              }

            }
          },
          credits: {
            enabled: false
          },
          series: [
            {
              name: 'SuDung',
              data: arrsudung,
              color: 'red'
            } as any,
            {
              name: 'Xuat',
              data: arrxuat,
              color: 'green'
            } as any
          ]
        });
      });
  }
  click1() {
    //console.log(this.select_nl);
    this.loadData1();
  }
}
