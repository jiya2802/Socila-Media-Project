import { Component, OnInit } from '@angular/core';
import { SocialMediaService } from '../social-media.service';
import { identifierName } from '@angular/compiler';
import { CookieService } from 'ngx-cookie-service';
import { POST } from 'src/app/shared/interfaces/post.interface';

@Component({
  selector: 'app-feed-page',
  templateUrl: './feed-page.component.html',
  styleUrls: ['./feed-page.component.css']
})
export class FeedPageComponent implements OnInit {
  constructor(private socialMediaService: SocialMediaService,private cookieService: CookieService) {

  }
  // isLiked: boolean = false;
  postData!: POST[]
  ngOnInit(): void {
    this.getPosts();
    
  }
  getPosts() {
    this.socialMediaService.fetchPosts(5).subscribe({
      next: (data: POST[]) => {
        this.postData = data.map(post => ({ ...post, isLiked: false }));
        this.formatTags();
        console.log(this.postData);
      },
      error: (error) => {
        console.error(error);
      }
    });
  }
  private formatTags(): void {
    // console.log("Original tags:");
    this.postData.forEach(post => {
      // console.log("Condition result:", post.tags !== null && post.tags !== '');

      // console.log(post.tags);
      // console.log(post.tags !== null);
      if (post.tags !== null && post.tags !== '') { // Use && instead of ||
        const tagsArray = post.tags.split(',').map(tag => tag.trim());
        post.tags = tagsArray.map(tag => "#" + tag).join(' ');
      } else {
        post.tags = '';
      }
    });
  }
  toggleLike(post: POST): void {
    let id: number = parseInt(this.cookieService.get('id'));
    // console.log(post.isLiked)
    post.isLiked = !post.isLiked;
    if (post.isLiked) {
      this.socialMediaService.likePost(post.post_id,4).subscribe(response => {
        
      });
    } else {
      this.socialMediaService.UnLikePost(post.post_id,4).subscribe(response => {
        // post.isLiked = !post.isLiked;
      });
    }
  }
}
