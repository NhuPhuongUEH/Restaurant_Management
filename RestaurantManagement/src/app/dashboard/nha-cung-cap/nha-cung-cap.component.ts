import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { ModalDirective } from 'ngx-bootstrap';
import { NhaCungCapService, ListNhaCungCap, NhaCungCapInfo } from 'src/app/services/nha-cung-cap.service';

@Component({
  selector: 'app-nha-cung-cap',
  templateUrl: './nha-cung-cap.component.html',
  styleUrls: ['./nha-cung-cap.component.css']
})
export class NhaCungCapComponent implements OnInit {
  nhacungcaps: ListNhaCungCap;
  nhacungcap: NhaCungCapInfo = {} as NhaCungCapInfo;
  idncc: number = 0;
  @ViewChild('modal') modal: ModalDirective;
  @ViewChild('modalcomfirm') modalcomfirm: ModalDirective;
  constructor(private titleService: Title, private nhacungcapService: NhaCungCapService) { }

  ngOnInit() {
    this.titleService.setTitle('Nhà cung cấp');
    this.loadData();
  }
  loadData() {
    this.nhacungcapService.getAll().subscribe(result => {
      this.nhacungcaps = result;
    });
  }
  showModal(event = null, id: number = 0) {
    if (event) {
      event.preventDefault();
    }
    if (id > 0) {
      this.nhacungcapService.get(id).subscribe(result => {
        this.nhacungcap = result;
        this.modal.show();
      });
    } else {
      this.nhacungcap = {} as NhaCungCapInfo;
      this.modal.show();
    }
  }
  save() {
    if (this.nhacungcap.id === undefined || this.nhacungcap.id === 0) {
      this.nhacungcapService.add(this.nhacungcap).subscribe(result => {
        this.modal.hide();
        this.loadData();
      });
    } else {
      this.nhacungcapService.update(this.nhacungcap).subscribe(result1 => {
        this.modal.hide();
        this.loadData();
      });
    }
  }
  delete() {
    this.nhacungcapService.delete(this.idncc).subscribe(result => {
      this.loadData();
    });
    //this.loadData();
    this.modalcomfirm.hide();
  }
  delConfirm(event, id) {
    event.preventDefault();
    this.modal.hide();
    this.idncc = id;
    this.modalcomfirm.show();
  }
}
