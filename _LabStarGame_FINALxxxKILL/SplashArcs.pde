class Arc{
  Node v;
  Node u;
  Arc(Node _s, Node _e){
    v=_s;
    u=_e;
  }
  void draw(){
    int r=(int)((red(v.mycolor)+red(u.mycolor))/2);
    int g=(int)((green(v.mycolor)+green(u.mycolor))/2);
    int b=(int)((blue(v.mycolor)+blue(u.mycolor))/2);    
    stroke(r,g,b);
    strokeWeight(2);
    line(v.pos.x+2,v.pos.y+2,u.pos.x+2,u.pos.y+2);
    strokeWeight(1);
    bezier(v.pos.x,v.pos.y,v.oldpos[2].x,v.oldpos[2].y,u.oldpos[2].x,u.oldpos[2].y,u.pos.x,u.pos.y);    
    noStroke();
  }
}

class Arc1{
  Node1 v;
  Node1 u;
  Arc1(Node1 _s, Node1 _e){
    v=_s;
    u=_e;
  }
  void draw(){
    int r=(int)((red(v.mycolor)+red(u.mycolor))/2);
    int g=(int)((green(v.mycolor)+green(u.mycolor))/2);
    int b=(int)((blue(v.mycolor)+blue(u.mycolor))/2);    
    stroke(r,g,b);
    strokeWeight(2);
    line(v.pos.x+2,v.pos.y+2,u.pos.x+2,u.pos.y+2);
    strokeWeight(1);
    bezier(v.pos.x,v.pos.y,v.oldpos[2].x,v.oldpos[2].y,u.oldpos[2].x,u.oldpos[2].y,u.pos.x,u.pos.y);    
    noStroke();
  }
}

class Arc2{
  Node2 v;
  Node2 u;
  Arc2(Node2 _s, Node2 _e){
    v=_s;
    u=_e;
  }
  void draw(){
    int r=(int)((red(v.mycolor)+red(u.mycolor))/2);
    int g=(int)((green(v.mycolor)+green(u.mycolor))/2);
    int b=(int)((blue(v.mycolor)+blue(u.mycolor))/2);    
    stroke(r,g,b);
    strokeWeight(2);
    line(v.pos.x+2,v.pos.y+2,u.pos.x+2,u.pos.y+2);
    strokeWeight(1);
    bezier(v.pos.x,v.pos.y,v.oldpos[2].x,v.oldpos[2].y,u.oldpos[2].x,u.oldpos[2].y,u.pos.x,u.pos.y);    
    noStroke();
  }
}

class Arc3{
  Node3 v;
  Node3 u;
  Arc3(Node3 _s, Node3 _e){
    v=_s;
    u=_e;
  }
  void draw(){
    int r=(int)((red(v.mycolor)+red(u.mycolor))/2);
    int g=(int)((green(v.mycolor)+green(u.mycolor))/2);
    int b=(int)((blue(v.mycolor)+blue(u.mycolor))/2);    
    stroke(r,g,b);
    strokeWeight(2);
    line(v.pos.x+2,v.pos.y+2,u.pos.x+2,u.pos.y+2);
    strokeWeight(1);
    bezier(v.pos.x,v.pos.y,v.oldpos[2].x,v.oldpos[2].y,u.oldpos[2].x,u.oldpos[2].y,u.pos.x,u.pos.y);    
    noStroke();
  }
}

class Arc4{
  Node4 v;
  Node4 u;
  Arc4(Node4 _s, Node4 _e){
    v=_s;
    u=_e;
  }
  void draw(){
    int r=(int)((red(v.mycolor)+red(u.mycolor))/2);
    int g=(int)((green(v.mycolor)+green(u.mycolor))/2);
    int b=(int)((blue(v.mycolor)+blue(u.mycolor))/2);    
    stroke(r,g,b);
    strokeWeight(2);
    line(v.pos.x+2,v.pos.y+2,u.pos.x+2,u.pos.y+2);
    strokeWeight(1);
    bezier(v.pos.x,v.pos.y,v.oldpos[2].x,v.oldpos[2].y,u.oldpos[2].x,u.oldpos[2].y,u.pos.x,u.pos.y);    
    noStroke();
  }
}
