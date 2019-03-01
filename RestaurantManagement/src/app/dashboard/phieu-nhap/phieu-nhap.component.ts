import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-phieu-nhap',
  templateUrl: './phieu-nhap.component.html',
  styleUrls: ['./phieu-nhap.component.css']
})
export class PhieuNhapComponent implements OnInit {

  constructor(private titleService: Title) { }

  ngOnInit() {
    this.titleService.setTitle('Phiếu nhập');
  }

}
