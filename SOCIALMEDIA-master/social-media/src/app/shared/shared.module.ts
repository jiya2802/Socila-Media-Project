import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavComponent } from './nav/nav.component';
import { SideComponent } from './side/side.component';
import { AppRoutingModule } from '../app-routing.module';



@NgModule({
  declarations: [
    NavComponent,
    SideComponent

  ],
  imports: [
    CommonModule,
    AppRoutingModule
  ],
  exports:[
    NavComponent,
    SideComponent
  ]
})
export class SharedModule { }
