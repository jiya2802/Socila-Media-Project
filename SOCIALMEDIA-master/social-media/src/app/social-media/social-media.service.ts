import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { POST } from '../shared/interfaces/post.interface';
import { Data } from '@angular/router';
import { observableToBeFn } from 'rxjs/internal/testing/TestScheduler';


@Injectable({
  providedIn: 'root'
})
export class SocialMediaService {

  constructor(private http:HttpClient) { }

  fetchPosts(user_id:number):Observable<POST[]>{
    return this.http.get<POST[]>(`http://localhost:8080/api/fetchpost/`+user_id)
  }

  fetchFollowers(user_id:number):Observable<POST[]>{
    return this.http.get<POST[]>(`http://localhost:8081/api/followers/`+user_id)
  }

  fetchFollowing(user_id:number):Observable<POST[]>{
    return this.http.get<POST[]>(`http://localhost:8081/api/following/`+user_id)
  }

  createPost(post:any):Observable<any>{
    return this.http.post(`http://localhost:8080/api/create-post`,post)
  }
  uploadFile(file : any) : Observable<any>{
    const formData = new FormData();
    formData.append("file",file);
    return this.http.post("http://localhost:8080/api/uploadFile",formData)
  }
  likePost(post_id : number,user_id : number):Observable<any>{
    return this.http.post(`http://localhost:8080/api/like`,{post_id,user_id})
  }
  UnLikePost(post_id : number,user_id : number):Observable<any>{
    return this.http.post(`http://localhost:8080/api/unlike`,{post_id,user_id})
  }
  removeFollower(follower_id:number):Observable<any>{
    return this.http.post(`http://localhost:8081/api/removeFollower`,{follower_id})
  }
  removeFollowing(following_id:number):Observable<any>{
    return this.http.post(`http://localhost:8081/api/removeFollowing`,{following_id})
  }
}
