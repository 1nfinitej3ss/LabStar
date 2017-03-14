void splashDraw(){

  background(#F8B951);
  
  strand0();
  strand1();
  strand2();
  strand3();
  strand4();

//  credit = "credit";  
//  if(serialInput.equals(credit) == true) {
//    flashGO=false;
//  }    
  
  startButton = "start";  
  if(serialInput.equals(startButton) == true && serial == 1) {  
    flashGO=false;
    
  }      
  
if (flashGO){
  fill(255,255,255,flash);
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  textFont(fontA, 55);
  textAlign(CENTER);
  text("I N S E R T   1   C R E D I T", width/2, height/2);
  noFill();


if (flashUP==false){
  flash-=10;
  if (flash==0){
        flashUP=true;
  }
}

if (flashUP==true){
  flash+=10;
  if (flash==300){
        flashUP=false;
  }
 }
}

  //    popMatrix();  
  //
  //    //replace if statement with loop and boolean shit
  //    if (translateY<height) {
  //      translateY+=.1;
  //    }

  //serious repel
  curMass=100;
  tMass=500;
  redraw();
 
   if (!flashGO){
         selectStart=true;
 } 
 
}

 //check for insert credit, eventually replace with quarter slot lookout
void keyReleased() {
  if (key == 'c' || key == 'C') {
      flashGO=false;
  }

 }

void prepare() {

  ns.clear();
  ns1.clear();
  ns2.clear();
  ns3.clear();
  ns4.clear();
  as.clear();
  as1.clear();
  as2.clear();
  as3.clear();
  as4.clear();
  nn=255;
  k=sqrt(min(width, height)/nn)*.05;

  ns.add(new Node(200, 600, 4));
  ns1.add(new Node1(width/2, 100, 4));
  ns2.add(new Node2((width-100), 300, 4));
  ns3.add(new Node3((width/2+150), height-300, 4));
  ns4.add(new Node4(100, 100, 4));

  curn=0;
}


float fa(float m1, float m2, float z) {
  return .0001*pow(k-m1-m2-z, 2);    
  //return .1*pow(m1*m2,2)/pow(z,2);
}
float fr(float m1, float m2, float z) {
  return .5*pow(m1+m2+k, 2)/pow(z, 2);    
  //return 20*(m1*m2)/pow(z,2);
}


void strand0() {

  if ((t++%vel)==0 && curn<nn) { 
    curn++;
    int r=(int)(random(1, ns.size()-1))-1;
    int s=0;
    boolean gen=false;
    //    if (random(1)<.1)
    //      gen=true;
    if (ns.size()>5 && gen) {
      s=(int)(random(1, ns.size()-1))-1;
      while (r==s)
        s=(int)(random(1, ns.size()-1))-1;
    }


    Node nr=(Node)ns.get(r);
    Node ss=(Node)ns.get(s);

    Node newn=null;

    newn=new Node(nr.pos.x+random(nr.mass, nr.mass+10), nr.pos.y+random(nr.mass, nr.mass+10), 4);

    ns.add(newn);
    as.add(new Arc(newn, nr));
    newn.incrMass(random(18));
    nr.incrMass(random(4));
    if (ns.size()>5 && gen) {
      as.add(new Arc(newn, ss));
      newn.incrMass(2);
      ss.incrMass(2);
    }
  }
  if (tMass<1) {
    tMass+=.1;
    curMass=sin(PI*tMass)*600*(1-tMass);
    //
  }

  curMass=max(curMass, mouseMass);

  noStroke();
  for (Iterator it=ns.iterator();it.hasNext();) {
    Node u=(Node)it.next();
    for (Iterator it2=ns.iterator();it2.hasNext();) {
      Node v=(Node)it2.next();      
      if (u!=v) {
        Vector2D delta=v.pos.sub(u.pos);
        if (delta.norm()!=0) {
          v.disp.addSelf( delta.versor().mult( fr(v.mass, u.mass, delta.norm()) ) );
          //        System.out.println(vpos);
        }
      }
    }
  }
  for (Iterator it=as.iterator();it.hasNext();) {
    Arc e=(Arc)it.next();
    Vector2D delta=e.v.pos.sub(e.u.pos);
    if (delta.norm()!=0) {
      e.v.disp.subSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
      e.u.disp.addSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
    }
  }  
  for (Iterator it=ns.iterator();it.hasNext();) {
    Node u=(Node)it.next();

    //mouse repel below
    Vector2D mousepos=new Vector2D(mouseX, mouseY);  
    Vector2D delta=u.pos.sub(mousepos);
    if (delta.norm()<curMass+u.mass+10) {
      u.disp.addSelf( delta.versor().mult( fr(u.mass, curMass, delta.norm()) ) );
      //mouse repel above
    }
    u.update();   
    u.costrain(0, width, 0, height);
  }
  for (Iterator it=as.iterator();it.hasNext();) {
    Arc a=(Arc)it.next();
    a.draw();
  }  
  for (Iterator it=ns.iterator();it.hasNext();) {
    Node u=(Node)it.next();
    u.setBall(true);  
    u.draw();
  }
}

void strand1() {

    //subtract from nn below to get smaller strands
  if ((t++%vel)==0 && curn<nn+25) { 
    curn++;
    int r=(int)(random(1, ns1.size()-1))-1;
    int s=0;
    boolean gen=false;
    //    if (random(1)<.1)
    //      gen=true;
    if (ns1.size()>55 && gen) {
      s=(int)(random(1, ns1.size()-1))-1;
      while (r==s)
        s=(int)(random(1, ns1.size()-1))-1;
    }

    Node1 nr=(Node1)ns1.get(r);
    Node1 ss=(Node1)ns1.get(s);

    Node1 newn=null;

    newn=new Node1(nr.pos.x+random(nr.mass, nr.mass+10), nr.pos.y+random(nr.mass, nr.mass+10), 4);

    ns1.add(newn);
    as1.add(new Arc1(newn, nr));
    newn.incrMass(random(18));
    nr.incrMass(random(4));
    if (ns1.size()>5 && gen) {
      as1.add(new Arc1(newn, ss));
      newn.incrMass(2);
      ss.incrMass(2);
    }
  }
  if (tMass<1) {
    tMass+=.1;
    curMass=sin(PI*tMass)*100*(1-tMass);
    //
  }

  curMass=max(curMass, mouseMass);


  noStroke();
  for (Iterator it=ns1.iterator();it.hasNext();) {
    Node1 u=(Node1)it.next();
    for (Iterator it2=ns1.iterator();it2.hasNext();) {
      Node1 v=(Node1)it2.next();      
      if (u!=v) {
        Vector2D delta=v.pos.sub(u.pos);
        if (delta.norm()!=0) {
          v.disp.addSelf( delta.versor().mult( fr(v.mass, u.mass, delta.norm()) ) );
          //        System.out.println(v.pos);
        }
      }
    }
  }

  for (Iterator it=as1.iterator();it.hasNext();) {
    Arc1 e=(Arc1)it.next();
    Vector2D delta=e.v.pos.sub(e.u.pos);
    if (delta.norm()!=0) {
      e.v.disp.subSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
      e.u.disp.addSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
    }
  }  
  for (Iterator it=ns1.iterator();it.hasNext();) {
    Node1 u=(Node1)it.next();

    //mouse repel below
    Vector2D mousepos=new Vector2D(mouseX, mouseY);  
    Vector2D delta=u.pos.sub(mousepos);
    if (delta.norm()<curMass+u.mass+100) {
      u.disp.addSelf( delta.versor().mult( fr(u.mass, curMass, delta.norm()) ) );
      //mouse repel above
    }
    u.update();   
    u.costrain(0, width, 0, height);
  }
  for (Iterator it=as1.iterator();it.hasNext();) {
    Arc1 a=(Arc1)it.next();
    a.draw();
  }  
  for (Iterator it=ns1.iterator();it.hasNext();) {
    Node1 u=(Node1)it.next();
    u.setBall(true);  
    u.draw();
  }
}

void strand2() {

  if ((t++%vel)==0 && curn<nn+25) { 
    curn++;
    int r=(int)(random(1, ns2.size()-1))-1;
    int s=0;
    boolean gen=false;
    if (ns2.size()>55 && gen) {
      s=(int)(random(1, ns2.size()-1))-1;
      while (r==s)
        s=(int)(random(1, ns2.size()-1))-1;
    }

    Node2 nr=(Node2)ns2.get(r);
    Node2 ss=(Node2)ns2.get(s);

    Node2 newn=null;

    newn=new Node2(nr.pos.x+random(nr.mass, nr.mass+10), nr.pos.y+random(nr.mass, nr.mass+10), 4);

    ns2.add(newn);
    as2.add(new Arc2(newn, nr));
    newn.incrMass(random(18));
    nr.incrMass(random(4));
    if (ns2.size()>5 && gen) {
      as2.add(new Arc2(newn, ss));
      newn.incrMass(2);
      ss.incrMass(2);
    }
  }
  if (tMass<1) {
    tMass+=.1;
    curMass=sin(PI*tMass)*100*(1-tMass);
    //
  }

  curMass=max(curMass, mouseMass);


  noStroke();
  for (Iterator it=ns2.iterator();it.hasNext();) {
    Node2 u=(Node2)it.next();
    for (Iterator it2=ns2.iterator();it2.hasNext();) {
      Node2 v=(Node2)it2.next();      
      if (u!=v) {
        Vector2D delta=v.pos.sub(u.pos);
        if (delta.norm()!=0) {
          v.disp.addSelf( delta.versor().mult( fr(v.mass, u.mass, delta.norm()) ) );
          //        System.out.println(v.pos);
        }
      }
    }
  }

  for (Iterator it=as2.iterator();it.hasNext();) {
    Arc2 e=(Arc2)it.next();
    Vector2D delta=e.v.pos.sub(e.u.pos);
    if (delta.norm()!=0) {
      e.v.disp.subSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
      e.u.disp.addSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
    }
  }  
  for (Iterator it=ns2.iterator();it.hasNext();) {
    Node2 u=(Node2)it.next();

    //mouse repel below
    Vector2D mousepos=new Vector2D(mouseX, mouseY);  
    Vector2D delta=u.pos.sub(mousepos);
    if (delta.norm()<curMass+u.mass+100) {
      u.disp.addSelf( delta.versor().mult( fr(u.mass, curMass, delta.norm()) ) );
      //mouse repel above
    }
    u.update();   
    u.costrain(0, width, 0, height);
  }
  for (Iterator it=as2.iterator();it.hasNext();) {
    Arc2 a=(Arc2)it.next();
    a.draw();
  }  
  for (Iterator it=ns2.iterator();it.hasNext();) {
    Node2 u=(Node2)it.next();
    u.setBall(true);  
    u.draw();
  }
}


void strand3() {

  if ((t++%vel)==0 && curn<nn+50) { 
    curn++;
    int r=(int)(random(1, ns3.size()-1))-1;
    int s=0;
    boolean gen=false;
    if (ns3.size()>55 && gen) {
      s=(int)(random(1, ns3.size()-1))-1;
      while (r==s)
        s=(int)(random(1, ns3.size()-1))-1;
    }

    Node3 nr=(Node3)ns3.get(r);
    Node3 ss=(Node3)ns3.get(s);

    Node3 newn=null;

    newn=new Node3(nr.pos.x+random(nr.mass, nr.mass+10), nr.pos.y+random(nr.mass, nr.mass+10), 4);

    ns3.add(newn);
    as3.add(new Arc3(newn, nr));
    newn.incrMass(random(18));
    nr.incrMass(random(4));
    if (ns3.size()>5 && gen) {
      as3.add(new Arc3(newn, ss));
      newn.incrMass(2);
      ss.incrMass(2);
    }
  }
  if (tMass<1) {
    tMass+=.1;
    curMass=sin(PI*tMass)*100*(1-tMass);
    //
  }

  curMass=max(curMass, mouseMass);


  noStroke();
  for (Iterator it=ns3.iterator();it.hasNext();) {
    Node3 u=(Node3)it.next();
    for (Iterator it2=ns3.iterator();it2.hasNext();) {
      Node3 v=(Node3)it2.next();      
      if (u!=v) {
        Vector2D delta=v.pos.sub(u.pos);
        if (delta.norm()!=0) {
          v.disp.addSelf( delta.versor().mult( fr(v.mass, u.mass, delta.norm()) ) );
          //        System.out.println(v.pos);
        }
      }
    }
  }

  for (Iterator it=as3.iterator();it.hasNext();) {
    Arc3 e=(Arc3)it.next();
    Vector2D delta=e.v.pos.sub(e.u.pos);
    if (delta.norm()!=0) {
      e.v.disp.subSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
      e.u.disp.addSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
    }
  }  
  for (Iterator it=ns3.iterator();it.hasNext();) {
    Node3 u=(Node3)it.next();

    //mouse repel below
    Vector2D mousepos=new Vector2D(mouseX, mouseY);  
    Vector2D delta=u.pos.sub(mousepos);
    if (delta.norm()<curMass+u.mass+100) {
      u.disp.addSelf( delta.versor().mult( fr(u.mass, curMass, delta.norm()) ) );
      //mouse repel above
    }
    u.update();   
    u.costrain(0, width, 0, height);
  }
  for (Iterator it=as3.iterator();it.hasNext();) {
    Arc3 a=(Arc3)it.next();
    a.draw();
  }  
  for (Iterator it=ns3.iterator();it.hasNext();) {
    Node3 u=(Node3)it.next();
    u.setBall(true);  
    u.draw();
  }
}


void strand4() {

  if ((t++%vel)==0 && curn<nn) { 
    curn++;
    int r=(int)(random(1, ns4.size()-1))-1;
    int s=0;
    boolean gen=false;
    if (ns4.size()>55 && gen) {
      s=(int)(random(1, ns4.size()-1))-1;
      while (r==s)
        s=(int)(random(1, ns4.size()-1))-1;
    }

    Node4 nr=(Node4)ns4.get(r);
    Node4 ss=(Node4)ns4.get(s);

    Node4 newn=null;

    newn=new Node4(nr.pos.x+random(nr.mass, nr.mass+10), nr.pos.y+random(nr.mass, nr.mass+10), 4);

    ns4.add(newn);
    as4.add(new Arc4(newn, nr));
    newn.incrMass(random(18));
    nr.incrMass(random(4));
    if (ns4.size()>5 && gen) {
      as4.add(new Arc4(newn, ss));
      newn.incrMass(random(18));    //hmm
      ss.incrMass(random(4));      //hmm
    }
  }
  if (tMass<1) {
    tMass+=.1;
    curMass=sin(PI*tMass)*100*(1-tMass);
    //
  }

  curMass=max(curMass, mouseMass);


  noStroke();
  for (Iterator it=ns4.iterator();it.hasNext();) {
    Node4 u=(Node4)it.next();
    for (Iterator it2=ns4.iterator();it2.hasNext();) {
      Node4 v=(Node4)it2.next();      
      if (u!=v) {
        Vector2D delta=v.pos.sub(u.pos);
        if (delta.norm()!=0) {
          v.disp.addSelf( delta.versor().mult( fr(v.mass, u.mass, delta.norm()) ) );
          //        System.out.println(v.pos);
        }
      }
    }
  }

  for (Iterator it=as4.iterator();it.hasNext();) {
    Arc4 e=(Arc4)it.next();
    Vector2D delta=e.v.pos.sub(e.u.pos);
    if (delta.norm()!=0) {
      e.v.disp.subSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
      e.u.disp.addSelf( delta.versor().mult( fa(e.v.mass, e.u.mass, delta.norm()) ) );
    }
  }  
  for (Iterator it=ns4.iterator();it.hasNext();) {
    Node4 u=(Node4)it.next();

    //mouse repel below
    Vector2D mousepos=new Vector2D(mouseX, mouseY);  
    Vector2D delta=u.pos.sub(mousepos);
    if (delta.norm()<curMass+u.mass+100) {
      u.disp.addSelf( delta.versor().mult( fr(u.mass, curMass, delta.norm()) ) );
      //mouse repel above
    }
    u.update();   
    u.costrain(0, width, 0, height);
  }
  for (Iterator it=as4.iterator();it.hasNext();) {
    Arc4 a=(Arc4)it.next();
    a.draw();
  }  
  for (Iterator it=ns4.iterator();it.hasNext();) {
    Node4 u=(Node4)it.next();
    u.setBall(true);  
    u.draw();
  }
}



