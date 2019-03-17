import { TestBed } from '@angular/core/testing';

import { PhieuNhapKhoService } from './phieu-nhap-kho.service';

describe('PhieuNhapKhoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PhieuNhapKhoService = TestBed.get(PhieuNhapKhoService);
    expect(service).toBeTruthy();
  });
});
