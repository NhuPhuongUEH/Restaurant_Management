import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ThongKeTonKho1Component } from './thong-ke-ton-kho1.component';

describe('ThongKeTonKho1Component', () => {
  let component: ThongKeTonKho1Component;
  let fixture: ComponentFixture<ThongKeTonKho1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ThongKeTonKho1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ThongKeTonKho1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
