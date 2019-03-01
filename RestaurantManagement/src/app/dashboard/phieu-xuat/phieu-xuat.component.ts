import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-phieu-xuat',
  templateUrl: './phieu-xuat.component.html',
  styleUrls: ['./phieu-xuat.component.css']
})
export class PhieuXuatComponent implements OnInit {

  constructor(private titleService: Title) { }

  ngOnInit() {
    this.titleService.setTitle('Phiếu xuất');
  }

}
