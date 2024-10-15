import { Component, OnInit } from '@angular/core';
import { SocialMediaService } from '../social-media.service';
import { followers } from 'src/app/shared/interfaces/followers-following.interface';

@Component({
  selector: 'app-followers-following',
  templateUrl: './followers-following.component.html',
  styleUrls: ['./followers-following.component.css'],
})
export class FollowersFollowingComponent implements OnInit {
  followers!: followers[];

  constructor(private socialMediaService: SocialMediaService) {}
  ngOnInit(): void {
    this.showFollowers();
  }

  showFollowers() {
    this.socialMediaService.fetchFollowers(7).subscribe({
      next: (data: followers[]) => {
        this.followers = data;
        console.log('data', data);
        console.log('followers', this.followers);
      },
      error: (error: any) => {
        console.log(error);
      },
    });
  }

  remove(follower_id: number) {
    this.socialMediaService.removeFollower(follower_id).subscribe({
      next: (data: followers[]) => {
        console.log('remove follower');
      },
      error: (error: any) => {
        console.log(error);
      },
    });
  }
}
