import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PhieuXuatComponent } from './phieu-xuat.component';

describe('PhieuXuatComponent', () => {
  let component: PhieuXuatComponent;
  let fixture: ComponentFixture<PhieuXuatComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PhieuXuatComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PhieuXuatComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
