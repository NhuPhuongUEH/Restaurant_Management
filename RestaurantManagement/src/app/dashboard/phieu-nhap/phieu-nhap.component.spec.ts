import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PhieuNhapComponent } from './phieu-nhap.component';

describe('PhieuNhapComponent', () => {
  let component: PhieuNhapComponent;
  let fixture: ComponentFixture<PhieuNhapComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PhieuNhapComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PhieuNhapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
