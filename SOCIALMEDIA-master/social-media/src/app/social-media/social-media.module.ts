import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FeedPageComponent } from './feed-page/feed-page.component';
import { SharedModule } from '../shared/shared.module';
import { FollowersFollowingComponent } from './followers-following/followers-following.component';
import { CreatePostComponent } from './create-post/create-post.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FollowingComponent } from './following/following.component';
import { AddFriendComponent } from './add-friend/add-friend.component';



@NgModule({
  declarations: [
    CreatePostComponent,
    FeedPageComponent,
    FollowersFollowingComponent,
    FollowingComponent,
    AddFriendComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule
  ],
  exports:[
    FeedPageComponent,
    CreatePostComponent,
    FollowersFollowingComponent,
    AddFriendComponent
  ]
})
export class SocialMediaModule { }
