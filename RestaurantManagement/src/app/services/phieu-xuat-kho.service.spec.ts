import { TestBed } from '@angular/core/testing';

import { PhieuXuatKhoService } from './phieu-xuat-kho.service';

describe('PhieuXuatKhoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PhieuXuatKhoService = TestBed.get(PhieuXuatKhoService);
    expect(service).toBeTruthy();
  });
});
