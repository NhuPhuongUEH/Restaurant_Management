import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-nha-cung-cap',
  templateUrl: './nha-cung-cap.component.html',
  styleUrls: ['./nha-cung-cap.component.css']
})
export class NhaCungCapComponent implements OnInit {

  constructor(private titleService: Title) { }

  ngOnInit() {
    this.titleService.setTitle('Bán hàng');
  }

}
