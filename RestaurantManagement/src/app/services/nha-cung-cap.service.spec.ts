import { TestBed } from '@angular/core/testing';

import { NhaCungCapService } from './nha-cung-cap.service';

describe('NhaCungCapService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: NhaCungCapService = TestBed.get(NhaCungCapService);
    expect(service).toBeTruthy();
  });
});
