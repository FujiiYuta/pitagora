//pitagora
//3-4-47
import fisica.*;
FWorld world;
FCircle ball;
FCompound daisha;
FCompound ba;
PFont font;
int counter = 0;
//int counter2 = 0;

void setup() {
  size(1024, 576);
  font = loadFont("Serif-48.vlw");
  textFont(font, 35);
  Fisica.init(this);
  world = new FWorld();
  world.setEdges(this, color(120));
  world.setGravity(0, 800);
  smooth();
  //ここからものをおいて行く
  //1
  fline(700, 100, 1024, 20);
  //  //3
  //  settingBall(650, 40);

  //  //4
  //  fline(680, 40, 680, 150);

  //  //5
  //  FBox boxy = new FBox(90, 90);
  //  boxy.setP　　osition(680, 180);
  //  boxy.setStatic(true);
  //  world.add(boxy);

  //  //6
  //  fline(620, 40, 620, 250);

  //  //7
  //  ball(590, 230);

  //  //8
  //  fline(560, 260, 620, 250);

  //  //9
  //  fline(560, 100, 560, 260);

  //10
  fline(100, 100, 700, 100);
  fline(50,80, 100, 100);
  //11
  for (int i = 0; i < 18; i++) {
    domino(230+i*20, 57);
  }

  //12
  ball(170, 65, "ball1");

  //13
  //drawに移動

  //14
  //ball(30, 160, "ball2");
  ba = createBall();
  ba.setPosition(30, 170);
  ba.setRestitution(1);
  ba.setVelocity(0,100);
  ba.setBullet(true);

  
  
  
  //ba.setName("ball2");
  
  //ba.setBullet(true);
  world.add(ba);

  //15
  fline(20, 180, 400, 230);
  fline(400, 230, 470, 200);
  //16
  //draw

  //17
  FBox nomalBox = new FBox(60, 90);
  nomalBox.setPosition(550, 300);
  nomalBox.setFriction(0.0001);
  //nomalBox.setRestitution(0.5);
  nomalBox.setName("nomalBox");
  world.add(nomalBox);
  
  //special_line
  fline2(5, 0, 5, 576, 6, 0.1);
  //18
  fline(128, 400, 600, 320);
  
  //19
  daisha = createDaisha();
  daisha.setPosition(10, 480);
  //daisha.setForce(200,0);
  daisha.setBullet(true);
  daisha.setRestitution(10);
  //反発係数をつければ行けるんじゃない？
  daisha.setName("daisha");
  daisha.setVelocity(10,0);
  world.add(daisha);

  //20
  fline2(0, 550, 1000, 560, 0, 5.0);


  //21
  //draw
  //texto
  Texto t1 = new Texto("pi");
  t1.setPosition(460, 364);
  t1.setStatic(true);
  world.add(t1);
  Texto t2 = new Texto("ta");
  t2.setPosition(460,399);
  t2.setStatic(true);
  world.add(t2);
  Texto t3 = new Texto("go");
  t3.setPosition(460,435);
  t3.setStatic(true);
  world.add(t3);
}

void draw() {
  background(255);
  //println(counter);
  //boxStopだけdrawに入れる
  if (frameCount % 50 == 0) {
    if (counter < 1) {
      //13
      boxStop(90, 100, -3);
    }
    
    if (counter < 6) {
      //16
      boxStop(440, 240, 3);
    }
    
    
    if (counter < 4) {
      //25
      boxStop(780, 360, -3);
    }
    
  }

  world.draw(this);
  world.step();
  

  //箱の中にボールを入れる処理
  //if(ball1.getX() >= 630 && ball1.getX() <= 730 && ball1.getY() >= 130 && ball1.getY() <= 230){
  //  println("YES");
  //  //ball1.setPosition(680,180);
  //}
}

//2
void keyPressed() {
  if (key == 32) {
    ball(1000, -30, "ball");
  }
}

//void ball1(int x, int y) {
//  FCircle ball1 = new FCircle(60);
//  ball1.setPosition(x, y);
//  ball1.setFill(#ac75ac);
//  ball1.setRestitution(0.6);
//  world.add(ball1);
//  int _x = (int)ball1.getX();
//  int _y = (int)ball1.getY();
//  println(_x + "," + _y);
//}

void ball(int x, int y, String s) {
  FCircle ball = new FCircle(60);
  ball.setName(s);
  ball.setPosition(x, y);
  ball.setFill(0);
  ball.setVelocity(0,100);
  ball.setRestitution(0.6);
  world.add(ball);
}

//void settingBall(int x, int y) {
//  FCircle settingBall = new FCircle(60);
//  settingBall.setStatic(true);
//  settingBall.setPosition(x, y);
//  //一箇所でしか使わなかったわ
//  world.add(settingBall);
//}

void fline(int x1, int y1, int x2, int y2) {
  FLine fline = new FLine(x1, y1, x2, y2);
  fline.setRestitution(0.6);
  fline.setStrokeWeight(5.0);
  fline.setStatic(true);
  fline.setRestitution(0.6);
  world.add(fline);
}
void fline2(int x1, int y1, int x2, int y2, int r, float w){
  
  FLine fline2 = new FLine(x1, y1, x2, y2);
  fline2.setRestitution(r);
  fline2.setStrokeWeight(w);
  fline2.setFriction(0.002);
  world.add(fline2);
}
void boxStop(int x, int y, float r) {
  FBox boxStop = new FBox(20, 80);
  boxStop.setName("boxStop");
  boxStop.setFill(172,117,172);
  boxStop.setRotation(r);
  boxStop.setRotatable(true);
  boxStop.setStatic(true);
  boxStop.setPosition(x, y);
  world.add(boxStop);
}

void smallBall(int x, int y) {
  FCircle smallBall = new FCircle(20);
  smallBall.setPosition(x, y);
  world.add(smallBall);
}

void domino(int x, int y) {
  //dominoの内部構造
  FBox myBox = new FBox(10, 80);
  myBox.setFill(0);
  myBox.setPosition(x, y);
  myBox.setFriction(0.5);
  world.add(myBox);
}

FCompound createDaisha() {
  FPoly b = new FPoly();
  //80,60
  
  
  
  b.vertex(0,0);
  b.vertex(0,60);
  b.vertex(100,60);
  b.vertex(100,0);
  b.vertex(90,0);
  b.vertex(90,50);
  b.vertex(10,50);
  b.vertex(10,0);
  b.setPosition(0, 0);
  
  FCircle c1 = new FCircle(20);
  FCircle c2 = new FCircle(20);
  //反発係数
  //c1.setRestitution(10);
  //c2.setRestitution(10);
  //欲しいのは摩擦なのでは？
  c2.setPosition(20, 60);
  c1.setPosition(80, 60);
  

  FCompound result = new FCompound();
  
  result.addBody(b);
  result.addBody(c1);
  result.addBody(c2);
  
  return result;
}

FCompound createBall() {
  FCircle ball = new FCircle(60);
  ball.setPosition(0, 0);
  ball.setName("ball2");
  ball.setFill(230, 190, 0);
  ball.setRestitution(0.83);
  ball.setVelocity(0,100);
  Texto t1 = new Texto("ra");
  t1.setPosition(0, 0);
  
  FCompound result = new FCompound();
  result.addBody(ball);
  result.addBody(t1);
  return result;
}


void contactStarted(FContact c){
  FBody b = null;
  //println("Body1 : "+c.getBody1().getName()+" Body2 : "+c.getBody2().getName());
  
  if((c.getBody1().getName() == "ball1" && c.getBody2().getName() == "boxStop") || (counter > 5 && c.getBody1().getName() == "ball2" && c.getBody2().getName() == "boxStop")){
    //println("1"); 
    //println(boxStop.getHeight());
    b = c.getBody2();
    
    if(c.getBody1().getName() == "ball1"){
      
      counter ++;
      world.remove(b);
    }else if(c.getBody1().getName() == "ball2"){
       
      //counter2 ++;
      world.remove(b);
    }
  }else if((c.getBody2().getName() == "ball1" && c.getBody1().getName() == "boxStop") || (counter > 5 && c.getBody2().getName() == "ball2" && c.getBody1().getName() == "boxStop")){
    //println("2");
    b = c.getBody1();
    
    
    if(c.getBody2().getName() == "ball1"){
      
      counter ++;
      world.remove(b);
    }else if(c.getBody2().getName() == "ball2"){
      //b2 = c.getBody2();
      //counter2++;
      world.remove(b);
    }  
  }else if((c.getBody1().getName() == "daisha" && c.getBody2().getName() == "nomalBox") || (c.getBody1().getName() == "nomalBox" && c.getBody2().getName() == "daisha")){
    //println("OK");
    
    //途中から速度は変えられない、、、
    //ball_skel(-60, 500);
  }
  if(b == null){
    //ここでエラー出てる
    //println("3");
    //println(counter);
    //boxStop.setHeight(80);
    return;
  }

     

   
   
  //boxStop(350, 200, 80);
  //if(counter2 == 0){
  //  println("counter : " +counter);
  //}else{
  //  println("counter2 : "+counter2);
  //}
  
}
