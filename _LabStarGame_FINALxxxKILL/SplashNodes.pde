class Node {
  Vector2D pos;
  Vector2D disp;
  Vector2D[] oldpos;
  float mass;
  float newmass;
  color mycolor;
  color mycolor1;
  color mycolor2;
  boolean trail;
  boolean ball;
  Node(float _x, float _y, float _mass) {
    pos=new Vector2D(_x, _y);
    disp=new Vector2D();
    mass=_mass;
    oldpos=new Vector2D[8];
    for (int i=0;i<oldpos.length;i++)
      oldpos[i]=pos.clone();
    mycolor=color(#B96B04);
    ball=true;
    trail=true;
  }
  void incrMass(float nm) {
    newmass=mass+nm;
  }
  void setBall(boolean ball) {
    this.ball=ball;
  }
  void setTrail(boolean trail) {
    this.trail=trail;
  }
  void update() {
    for (int i=oldpos.length-1;i>0;i--)
      oldpos[i]=oldpos[i-1];
    oldpos[0]=pos.clone();  
    pos.addSelf(disp);
    disp.clear();
  }  
  void draw() {
    if (mass<newmass)
      mass+=.6;

    if (ball) {
      fill(#B96B04);
      ellipse(pos.x, pos.y, mass*2, mass*2);

      fill(#F8B951);
      ellipse(pos.x-2,pos.y-2,mass*1.2,mass*1.2);
    }
  }

  void costrain(float x0, float x1, float y0, float y1) {
    pos.x=min(x1, max(x0, pos.x));
    pos.y=min(y1, max(y0, pos.y));
  }
  String toString() {
    return pos+"";
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Node1{
  Vector2D pos;
  Vector2D disp;
  Vector2D[] oldpos;
  float mass;
  float newmass;
  color mycolor;
  color mycolor1;
  color mycolor2;
  boolean trail;
  boolean ball;
  boolean ball2;
  Node1(float _x, float _y,float _mass){
    pos=new Vector2D(_x,_y);
    disp=new Vector2D();
    mass=_mass;
    oldpos=new Vector2D[8];
    for(int i=0;i<oldpos.length;i++)
      oldpos[i]=pos.clone();
    mycolor=color(#E0923D);
    ball=true;
    trail=true;
  }
  void incrMass(float nm){
    newmass=mass+nm;
  }
  void setBall(boolean ball){
    this.ball=ball;
  }
  void setTrail(boolean trail){
    this.trail=trail;
  }
  void update(){
    for(int i=oldpos.length-1;i>0;i--)
      oldpos[i]=oldpos[i-1];
    oldpos[0]=pos.clone();  
    pos.addSelf(disp);
    disp.clear();
  }  
  void draw(){

    if (mass<newmass){
      mass+=.2;
  }

    if (ball)  {
      fill(#E0923D);
      ellipse(pos.x,pos.y,mass*2,mass*2);

      fill(#F8B951);
      ellipse(pos.x+2,pos.y+2,mass*1.2,mass*1.2);
}

  }

  void costrain(float x0, float x1,float y0, float y1){
    pos.x=min(x1,max(x0,pos.x));
    pos.y=min(y1,max(y0,pos.y));
  }
  String toString(){
    return pos+"";
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Node2{
  Vector2D pos;
  Vector2D disp;
  Vector2D[] oldpos;
  float mass;
  float newmass;
  color mycolor;
  color mycolor1;
  color mycolor2;
  boolean trail;
  boolean ball;
  boolean ball2;
  Node2(float _x, float _y,float _mass){
    pos=new Vector2D(_x,_y);
    disp=new Vector2D();
    mass=_mass;
    oldpos=new Vector2D[8];
    for(int i=0;i<oldpos.length;i++)
      oldpos[i]=pos.clone();
    mycolor=color(#D87B09);
    ball=true;
    trail=true;
  }
  void incrMass(float nm){
    newmass=mass+nm;
  }
  void setBall(boolean ball){
    this.ball=ball;
  }
  void setTrail(boolean trail){
    this.trail=trail;
  }
  void update(){
    for(int i=oldpos.length-1;i>0;i--)
      oldpos[i]=oldpos[i-1];
    oldpos[0]=pos.clone();  
    pos.addSelf(disp);
    disp.clear();
  }  
  void draw(){

    if (mass<newmass){
      mass+=.6;
  }

    if (ball)  {
      fill(#D87B09);
      ellipse(pos.x,pos.y,mass*2,mass*2);

      fill(#F8B951);
      ellipse(pos.x+2,pos.y+2,mass*1.2,mass*1.2);
}

  }

  void costrain(float x0, float x1,float y0, float y1){
    pos.x=min(x1,max(x0,pos.x));
    pos.y=min(y1,max(y0,pos.y));
  }
  String toString(){
    return pos+"";
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Node3{
  Vector2D pos;
  Vector2D disp;
  Vector2D[] oldpos;
  float mass;
  float newmass;
  color mycolor;
  color mycolor1;
  color mycolor2;
  boolean trail;
  boolean ball;
  boolean ball2;
  Node3(float _x, float _y,float _mass){
    pos=new Vector2D(_x,_y);
    disp=new Vector2D();
    mass=_mass;
    oldpos=new Vector2D[8];
    for(int i=0;i<oldpos.length;i++)
      oldpos[i]=pos.clone();
    mycolor=color(#FC8E17);
    ball=true;
    trail=true;
  }
  void incrMass(float nm){
    newmass=mass+nm;
  }
  void setBall(boolean ball){
    this.ball=ball;
  }
  void setTrail(boolean trail){
    this.trail=trail;
  }
  void update(){
    for(int i=oldpos.length-1;i>0;i--)
      oldpos[i]=oldpos[i-1];
    oldpos[0]=pos.clone();  
    pos.addSelf(disp);
    disp.clear();
  }  
  void draw(){

    if (mass<newmass){
      mass+=.6;
  }

    if (ball)  {
      fill(#FC8E17);
      ellipse(pos.x,pos.y,mass*2,mass*2);

      fill(#F8B951);
      ellipse(pos.x+2,pos.y+2,mass*1.2,mass*1.2);
}

  }

  void costrain(float x0, float x1,float y0, float y1){
    pos.x=min(x1,max(x0,pos.x));
    pos.y=min(y1,max(y0,pos.y));
  }
  String toString(){
    return pos+"";
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Node4{
  Vector2D pos;
  Vector2D disp;
  Vector2D[] oldpos;
  float mass;
  float newmass;
  color mycolor;
  color mycolor1;
  color mycolor2;
  boolean trail;
  boolean ball;
  boolean ball2;
  Node4(float _x, float _y,float _mass){
    pos=new Vector2D(_x,_y);
    disp=new Vector2D();
    mass=_mass;
    oldpos=new Vector2D[8];
    for(int i=0;i<oldpos.length;i++)
      oldpos[i]=pos.clone();
    mycolor=color(#FC8E17);
    ball=true;
    trail=true;
  }
  void incrMass(float nm){
    newmass=mass+nm;
  }
  void setBall(boolean ball){
    this.ball=ball;
  }
  void setTrail(boolean trail){
    this.trail=trail;
  }
  void update(){
    for(int i=oldpos.length-1;i>0;i--)
      oldpos[i]=oldpos[i-1];
    oldpos[0]=pos.clone();  
    pos.addSelf(disp);
    disp.clear();
  }  
  void draw(){

    if (mass<newmass){
      mass+=.6;
  }

    if (ball)  {
      fill(#FC8E17);
      ellipse(pos.x,pos.y,mass*2,mass*2);

      fill(#F8B951);
      ellipse(pos.x+2,pos.y+2,mass*1.2,mass*1.2);
}

  }

  void costrain(float x0, float x1,float y0, float y1){
    pos.x=min(x1,max(x0,pos.x));
    pos.y=min(y1,max(y0,pos.y));
  }
  String toString(){
    return pos+"";
  }
}
