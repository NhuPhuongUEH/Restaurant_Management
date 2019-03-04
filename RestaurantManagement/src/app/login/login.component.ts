import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { LoginService } from '../services/login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  message = '';
  email = '';
  matkhau = '';
  constructor(private titleService: Title, private http: HttpClient, private router: Router, private loginService: LoginService) { }

  ngOnInit() {
    this.titleService.setTitle('Đăng nhập');
    if (localStorage.getItem('username') != null) {
      this.router.navigate(['/dashboard']);
    }
  }
  login() {
    const param = {
      email: this.email,
      matkhau: this.matkhau
    };
    this.loginService.login(this.email, this.matkhau).subscribe(result => {
      if (result.errorCode === 1) {
        this.message = result.message;
      } else {
        if (result.data.trangthai === false) {
          this.message = 'Tài khoản này đã bị khóa';
        } else {
          localStorage.setItem('username', result.data.ho + ' ' + result.data.ten);
          localStorage.setItem('userid', result.data.id.toString());
          this.router.navigate(['/dashboard']);
        }
      }
    });
  }
}
