import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { UserService } from '../user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register-user',
  templateUrl: './register-user.component.html',
  styleUrls: ['./register-user.component.css']
})
export class RegisterUserComponent {
  registerForm!: FormGroup

  constructor(private userService : UserService , private router: Router){}

  ngOnInit(): void {
    this.createForm()
  }

  createForm():void{
    this.registerForm = new FormGroup({
      user_name : new FormControl(),
      email: new FormControl(),
      contact: new FormControl(),
      dob : new FormControl(),
      bio : new FormControl(),
      password: new FormControl(),
      confirmPassword: new FormControl()
    })
  }
  submit():void{
    // console.log(this.registerForm.value)
    this.userService.register(this.registerForm.value).subscribe((value)=>{
      console.log("Registered!!!")
      this.router.navigate(['/','login'])
    })
  }
}
