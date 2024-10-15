import { Component } from '@angular/core';
import { SocialMediaService } from '../social-media.service';
import { followers } from 'src/app/shared/interfaces/followers-following.interface';

@Component({
  selector: 'app-following',
  templateUrl: './following.component.html',
  styleUrls: ['./following.component.css']
})
export class FollowingComponent {

  following!:followers[]
  

  constructor(private socialMediaService:SocialMediaService) { }
  ngOnInit(): void {
    this.showFollowing();
  }


  showFollowing() {
    this.socialMediaService.fetchFollowing(7).subscribe({
      next: (data:followers[]) =>{
        this.following = data
        console.log("data",data)
        console.log("followers",this.following)
      },
      error: (error:any)=>{
        console.log(error)
      }
    })
  }

  remove(following_id:number){
    this.socialMediaService.removeFollowing(following_id).subscribe((data:followers[])=>{
      console.log("remove following")
      console.log(following_id)
    })
  }

}
