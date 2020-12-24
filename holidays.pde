//Gabriel Weng
PImage santa; //declaring a lot of  image variables
PImage cookie;
PImage santa2;
PImage bg1;
PImage map;
PImage mushroom;
PImage mushroom2;
PImage toytrain;
PImage toycar;
PImage toyplane;
PImage coal;
PImage mintymushroom;
PImage gingerymushroom;
PImage meatymushroom;
PImage open;
PImage closed;
PImage carrot;
PImage reindeer;
PImage reindeer2;
float mushY = 100; //in case i want to change this
float[] msX = new float[3];
float[] msY = new float[3];
float cookieX=1000;
float cookieY=-100;
float reindeerX;
float direction=1;
int scene = 1;
int stage = 0; //in case i want to add multiple parts to each scene
int timer;
int list = 0;
int number = 0;
//int list=600;
int mode = 0;
int mapPos=600;
int attached = 0;
boolean correct;
boolean minty=false;
boolean gingery=false;
boolean meaty=false;
float indX; //the circle on the map
float indY;
String text = "Santa has eaten a magical cookie and has fallen asleep. Collect mushrooms and do tasks to make a special potion that will wake him up before Christmas!";
String quest1 = "Give the appropriate gift for each child based off of the naughty or nice list!"; //these strings are just to make the lines a bit shorter
String quest2 = "Open all of the letters that come in for Santa!";
String quest3 = "Feed the reindeer with carrots!";
String[] first;
String[] last;
String[] f = new String[]{"James", "John", "Robert", "Michael", "William", "Mary", "Patricia", "Jennifer", "Linda", "Elizabeth"};
String[] l = new String[]{"Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Wilson"};
boolean[] nice; //true = nice false = naughty
int[] want; //1 is train 2 is car 3 is plane
boolean[] envelope;

void setup() {
  size(800, 600);
  santa = loadImage("santa.png"); //load all images
  cookie = loadImage("cookie.png");
  santa2 = loadImage("santa2.png");
  bg1 = loadImage("bg1.jpg");
  map = loadImage("map.jpg");
  mushroom = loadImage("mushroom.png");
  mushroom2 = loadImage("mushroom2.png");
  toytrain = loadImage("toytrain.png");
  toycar = loadImage("toycar.png");
  toyplane = loadImage("toyplane.png");
  coal = loadImage("coal.png");
  mintymushroom = loadImage("mintymushroom.png");
  gingerymushroom = loadImage("gingerymushroom.png");
  meatymushroom = loadImage("meatymushroom.png");
  open = loadImage("open.png");
  closed = loadImage("closed.png");
  carrot = loadImage("carrot.png");
  reindeer = loadImage("reindeer.png");
  reindeer2 = loadImage("reindeer2.png");
  indX = 344;
  indY = 384;
  first = new String[20];
  last = new String[20];
  nice = new boolean[20];
  want = new int[20];
  for (int i = 0; i < 20; i++) {
    first[i] = f[int(random(0, 10))];
    last[i] = l[int(random(0, 10))];
    nice[i] = boolean(int(random(0, 2)));
    want[i] = int(random(1, 4));
    println(first[i] + " " + last[i] + " " + nice[i]);
  }
  envelope = new boolean[10];
  for (int i = 0; i < 10; i++) {
    envelope[i] = false;
  }
}
void draw() {
  imageMode(CENTER);
  if (scene==1) {
    scene1();
  }
  if (cookieX<=(400+(santa.width/8))||cookieY>=(250-(santa.height/8))&&scene==1) {
    scene = 2;
    timer = 0;
  }
  if (scene == 2) {
    scene2();
  }
  if (timer>=240&&scene==2) {
    scene = 3;
    timer = 0;
  }
  if (scene==3) {
    scene3();
  }
  if (scene==4) {
    scene4();
  }
  if (scene==5) {
    scene5();
  }
  if (scene==6) {
    scene6();
  }
  if (scene==7) {
    scene7();
  }
  if (scene==8) {
    scene8();
  }
  if (scene==9) {
    scene9();
  }
}
void keyPressed() {
}

void mousePressed() {
  if (scene==3) {
    if (mouseX>100&&mouseX<100+mushroom.width&&mouseY>mushY&&mouseY<mushY+mushroom.height) {
      mode=1;
    }
    if (mouseX>150&&mouseX<150+mushroom.width&&mouseY>mushY&&mouseY<mushY+mushroom.height) {
      mode=2;
    }
    if (mouseX>200&&mouseX<200+mushroom.width&&mouseY>mushY&&mouseY<mushY+mushroom.height) {
      mode=3;
    }
    if (mode!=0&&dist(mouseX, mouseY, 685, 115)<=10) {
      mode=0;
    }
    if (mode!=0&&mouseX>250&&mouseX<550&mouseY>200&&mouseY<380) {
      println(scene);
      scene=4;
      println(scene);
    }
  }
  if (scene==6) {
    if (mouseX>=600&&mouseX<=800) {
      if (mouseY>=0&&mouseY<130) {
        attached=1;
      }
      if (mouseY>=130&&mouseY<230) {
        attached=2;
      }
      if (mouseY>=230&&mouseY<380) {
        attached=3;
      }
      if (mouseY>=380&&mouseY<=540) {
        attached=4;
      }
    }
  }
}
void mouseReleased() {
  if (scene==6) {
    if (mouseX>=330&&mouseX<=550&&mouseY>=250&&mouseY<=350) {
      if (nice[number]) {
        if (attached==want[number]) {
          correct=true;
          number++;
        } else {
          correct=false;
        }
      } else {
        if (attached==4) {
          correct=true;
          number++;
        } else {
          correct=false;
        }
      }
    }
  }
  attached=0;
}
void mouseClicked() {
  if (scene==7) {
    if (mouseY>=275&&mouseY<=335) {
      envelope[int(mouseX/80)]=true;
    }
  }
}
void scene1() {
  background(bg1);
  image(santa, width/2, height/2, santa.width*2, santa.height*2);
  image(cookie, cookieX, cookieY);
  cookieX = 400 + 95*(cookieX-400)/100;
  cookieY = 250 + 95*(cookieY-250)/100;
}
void scene2() {
  background(bg1);
  image(santa, width/2, height/2, santa.width*2, santa.height*2);
  fill(43, 200, 58);
  if (timer%120>30) {
    textSize(20);
    text("z", 450, 175);
  }
  if (timer%120>60) {
    textSize(40);
    text("z", 470, 155);
  }
  if (timer%120>90) {
    textSize(80);
    text("z", 510, 115);
  }
  timer++;
}
void scene3() {
  background(bg1);
  image(santa2, width/2, 400-santa2.height/2, santa2.width*2, santa2.height*2);
  fill(0, 0, 0, 169);
  rectMode(CORNER);
  rect(385, 20, 385, 250);
  fill(255);
  textSize(40);
  text("OH NO!", 502, 67);
  textSize(20);
  text(text, 408, 80, 354, 235);
  imageMode(CORNER);
  if (mouseX>100&&mouseX<100+mushroom.width&&mouseY>mushY&&mouseY<mushY+mushroom.height) {
    image(mushroom2, 100, mushY); //if hovered over its gray
  } else {
    image(mushroom, 100, mushY);
  }
  if (mouseX>150&&mouseX<150+mushroom.width&&mouseY>mushY&&mouseY<mushY+mushroom.height) {
    image(mushroom2, 150, mushY);
  } else {
    image(mushroom, 150, mushY);
  }
  if (mouseX>200&&mouseX<200+mushroom.width&&mouseY>mushY&&mouseY<mushY+mushroom.height) {
    image(mushroom2, 200, mushY);
  } else {
    image(mushroom, 200, mushY);
  }
  if (minty) {
    image(mintymushroom, 100, mushY);
  }
  if (gingery) {
    image(gingerymushroom, 150, mushY);
  }
  if (meaty) {
    image(meatymushroom, 200, mushY);
  }
  if (mode==1) { //shows info about first task
    fill(255, 247, 0, 200);
    rectMode(CORNERS);
    rect(100, 100, 700, 500);
    fill(0, 0, 0);
    textSize(40);
    text("Gift Wrapping", 262, 160);
    textSize(20);
    text(quest1, 140, 200, 700, 500);
    text("Reward: Minty Mushroom", 140, 417, 700, 500);
    fill(192, 216, 217);
    rect(250, 300, 550, 380);
    fill(0, 0, 0);
    textSize(40);
    text("Start", 346, 351);
    fill(255, 0, 0);
    circle(685, 115, 20);
  }
  if (mode==2) { //shows info about second task
    fill(255, 247, 0, 200);
    rectMode(CORNERS);
    rect(100, 100, 700, 500);
    fill(0, 0, 0);
    textSize(40);
    text("Letter Opening", 262, 160);
    textSize(20);
    text(quest2, 140, 200, 700, 500);
    text("Reward: Gingery Mushroom", 140, 417, 700, 500);
    fill(192, 216, 217);
    rect(250, 300, 550, 380);
    fill(0, 0, 0);
    textSize(40);
    text("Start", 346, 351);
    fill(255, 0, 0);
    circle(685, 115, 20);
  }
  if (mode==3) { //shows info about third task
    fill(255, 247, 0, 200);
    rectMode(CORNERS);
    rect(100, 100, 700, 500);
    fill(0, 0, 0);
    textSize(40);
    text("Reindeer Feeding", 262, 160);
    textSize(20);
    text(quest3, 140, 200, 700, 500);
    text("Reward: Meaty Mushroom", 140, 417, 700, 500);
    fill(192, 216, 217);
    rect(250, 300, 550, 380);
    fill(0, 0, 0);
    textSize(40);
    text("Start", 346, 351);
    fill(255, 0, 0);
    circle(685, 115, 20);
  }
  if (minty&&gingery&&meaty) {
    timer=0;
    scene=9;
    msX[0] = 100;
    msX[1] = 150;
    msX[2] = 200;
    msY[0] = mushY;
    msY[1] = mushY;
    msY[2] = mushY;
  }
}
void scene4() {
  imageMode(CORNER);
  image(map, 0, mapPos);
  if (mapPos>0) {
    mapPos=mapPos-5;
  } else {
    fill(200, 200, 255);
    circle(indX, indY, 20);
    if (mode==1) {
      if (indX>=130||indY>=190) {
        indX=indX-((344-130)/60); //130 is x coord of workshop
        indY=indY-((384-190)/60); //190 is y coord of workshop
      } else {
        scene=5;
      }
    }
    if (mode==2) {
      if (indX>=360||indY>=125) {
        indX=indX-((344-360)/60); //360 is x coord of post office
        indY=indY-((384-125)/60); //125 is y coord of post office
      } else {
        scene=5;
      }
    }
    if (mode==3) {
      if (indX>=575||indY>=200) {
        indX=indX-((344-575)/60); //575 is x coord of stables
        indY=indY-((384-200)/60); //200 is y coord of stables
      } else {
        scene=5;
      }
    }
  }
}
void scene5() {
  stage = 1;
  switch(mode) {
  case 1:
    scene6();
    break;
  case 2:
    scene7();
    break;
  case 3:
    scene8();
    break;
  }
  imageMode(CORNER);
  image(map, 0, mapPos);
  if (mapPos<800) {
    mapPos=mapPos+5;
  } else {
    scene=mode+5;
  }
}
void scene6() {
  background(#695225);
  fill(#faf7c5);
  rect(0, list, 310, list+600);
  for (int i = 0; i < 20; i++) {
    textSize(15);
    fill(0, 0, 0);
    if (i==number) {
      fill(0, 0, 255);
    }
    text(first[i]+" "+last[i], 10, (30*i)+20);
    if (nice[i]) {
      text("Nice", 160, (30*i)+20);
    } else {
      text("Naughty", 160, (30*i)+20);
    }
    if (want[i]==1) {
      text("Toy Train", 230, (30*i)+20);
    }
    if (want[i]==2) {
      text("Toy Car", 230, (30*i)+20);
    }
    if (want[i]==3) {
      text("Toy Plane", 230, (30*i)+20);
    }
  }
  imageMode(CORNER);
  image(toytrain, 600, 0, 200, 130);
  image(toycar, 600, 130, 200, 100);
  image(toyplane, 600, 230, 200, 150);
  image(coal, 600, 380, 200, 160);
  rectMode(CORNERS);
  fill(0, 0, 255);
  if (correct) {
    fill(0, 255, 0);
  }
  if (!correct) {
    fill(255, 0, 0);
  }
  rect(330, 250, 550, 350);
  fill(0, 0, 0);
  textSize(40);
  text("Put in here", 340, 300);
  imageMode(CENTER);
  if (attached==1) {
    image(toytrain, mouseX, mouseY, 200, 130);
  }
  if (attached==2) {
    image(toycar, mouseX, mouseY, 200, 100);
  }
  if (attached==3) {
    image(toyplane, mouseX, mouseY, 200, 150);
  }
  if (attached==4) {
    image(coal, mouseX, mouseY, 200, 160);
  }
  if (number==20) {
    scene=3;
    mode=0;
    number=0;
    minty=true;
    indX = 344;
    indY = 384;
  }
}
void scene7() {
  background(#695225);
  imageMode(CORNER);
  number=0;
  for (int i = 0; i < 10; i++) {
    if (envelope[i]) {
      image(open, 80*i, 275, 80, 60);
      number++;
    } else {
      image(closed, 80*i, 275, 80, 60);
    }
  }
  if (number==10) {
    gingery=true;
    scene=3;
    mode=0;
    number=0;
    indX = 344;
    indY = 384;
  }
}
void scene8() {
  background(0);
  imageMode(CORNER);
  if (direction>0) {
    image(reindeer, reindeerX, 400, 150, 200);
  }
  if (direction<0) {
    image(reindeer2, reindeerX, 400, 150, 200);
  }
  fill(255);
  textSize(20);
  text(("Your score is " + number), 600, 100);
  reindeerX=reindeerX+direction;
  if (reindeerX>=800||reindeerX<=0) {
    direction*=-1;
  }
  if (mouseX>=reindeerX&&mouseX<=reindeerX+150&&mouseY>=400&&mouseY<=600) {
    number++;
    direction*=1.01;
    print(direction);
  }
  if (number>1000) {
    meaty=true;
    scene=3;
    mode=0;
    number=0;
    indX = 344;
    indY = 384;
  }
  imageMode(CENTER);
  image(carrot, mouseX, mouseY, 32, 32);
}
void scene9() {
  background(bg1);
  if (msX[0]<390){
    image(santa2, width/2, 400-santa2.height/2, santa2.width*2, santa2.height*2);
    fill(255);
    imageMode(CORNER);
    image(mintymushroom, msX[0], msY[0]);
    image(gingerymushroom, msX[1], msY[1]);
    image(meatymushroom, msX[2], msY[2]);
    for (int i = 0; i < 3; i++){
      msX[i] = 400 + 95*(msX[i]-400)/100;
      msY[i] = 300 + 95*(msY[i]-300)/100;
    }
    timer = 0;
  }
  if (msX[0]>390){
    if (timer<1000){
      circle(400,300,timer);
      timer=timer+5;
    }
    if (timer>=1000){
      image(santa, width/2, 400-santa.height/2, santa.width*2, santa.height*2);
    }
  }
  
}
