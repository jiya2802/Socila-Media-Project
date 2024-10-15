import { Component, ElementRef, ViewChild } from '@angular/core';
import { SocialMediaService } from '../social-media.service';
import { FormControl, FormGroup } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-create-post',
  templateUrl: './create-post.component.html',
  styleUrls: ['./create-post.component.css']
})
export class CreatePostComponent {
 constructor(private socialMediaService : SocialMediaService,private cookieService : CookieService) { }
 @ViewChild('fileInput') fileInput!: ElementRef<HTMLInputElement>;
 id: number = parseInt(this.cookieService.get('id'))
 imageUrl!: String
 createPostForm = new FormGroup({
    id: new FormControl(4),
    caption: new FormControl(''),
    image_url: new FormControl(''),
    tags: new FormControl(''),
  });
  openFileSelector() {
    this.fileInput.nativeElement.click();
  }

  read(event: any) {
    this.imageUrl = event.target.files[0]
    console.log(event.target.files)
    this.createPostForm.patchValue({
      image_url: event.target.files[0].name
    })
  }
  createPost(){
    console.log(this.createPostForm.value)
    this.socialMediaService.uploadFile(this.imageUrl).subscribe((data)=>{
      this.socialMediaService.createPost(this.createPostForm.value).subscribe((data)=>{
        console.log(data)
        // this.router.navigate(['/','login'])
      })
    })
  }
}
