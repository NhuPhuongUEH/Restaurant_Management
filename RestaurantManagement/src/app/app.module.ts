import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { BanHangComponent } from './dashboard/ban-hang/ban-hang.component';
import { HangHoaComponent } from './dashboard/hang-hoa/hang-hoa.component';
import { CKEditorModule } from 'ng2-ckeditor';
import { ThongKeComponent } from './dashboard/thong-ke/thong-ke.component';
import { HoaDonComponent } from './dashboard/hoa-don/hoa-don.component';
import { ChartModule, HIGHCHARTS_MODULES  } from 'angular-highcharts';
import * as exporting from 'highcharts/modules/exporting.src';
import * as more from 'highcharts/highcharts-more.src';
import { NhaCungCapComponent } from './dashboard/nha-cung-cap/nha-cung-cap.component';
import { PhieuNhapComponent } from './dashboard/phieu-nhap/phieu-nhap.component';
import { PhieuXuatComponent } from './dashboard/phieu-xuat/phieu-xuat.component';
import { ModalModule } from 'ngx-bootstrap';
import { ThongKeDoanhThuComponent } from './dashboard/thong-ke/thong-ke-doanh-thu/thong-ke-doanh-thu.component';
import { ThongKeSoLuongComponent } from './dashboard/thong-ke/thong-ke-so-luong/thong-ke-so-luong.component';
import { ThongKeTonKhoComponent } from './dashboard/thong-ke/thong-ke-ton-kho/thong-ke-ton-kho.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { ThongKeTonKho1Component } from './dashboard/thong-ke/thong-ke-ton-kho1/thong-ke-ton-kho1.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent,
    BanHangComponent,
    HangHoaComponent,
    ThongKeComponent,
    HoaDonComponent,
    NhaCungCapComponent,
    PhieuNhapComponent,
    PhieuXuatComponent,
    ThongKeDoanhThuComponent,
    ThongKeSoLuongComponent,
    ThongKeTonKhoComponent,
    ThongKeTonKho1Component
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    CKEditorModule,
    ChartModule,
    ModalModule.forRoot(),
    NgxPaginationModule
  ],
  providers: [
    { provide: HIGHCHARTS_MODULES, useFactory: () => [ more, exporting ] } // add as factory to your providers
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
