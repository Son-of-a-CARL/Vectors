//declare variables
int count = 5;
PVector []loc = new PVector [count];
PVector [] vel= new PVector [count];
PVector [] acc = new PVector [count]; 
float[] diam= new float [count];

void setup() {
  //set size of canvas
  size(800, 600);
  background(0);
  colorMode(HSB,360,100,100,100);

  //initialize variables  
  int i=0;
  while (i< count){
  loc[i] = new PVector (width/2, height/2);
  diam[i] = 80;
  vel[i]= PVector.random2D();
  vel[i].mult(1);
  acc[i] = PVector.random2D();
  acc[i].mult(.1);
  i++;
}
}
void draw() {
  //draw background to cover previous frame
  int i=0;
  for(i=0;i<count;i++) {

  acc[i] = PVector.random2D();
  acc[i].mult(.1);
  noStroke();
  fill(frameCount%360,100,100);
  //for (int i = 0; i < 360; i++) {
   // for (int j = 0; j < 360; j++) {
   //   stroke(i, j, 360);
   // }

    //draw ball
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    vel[i].add(acc[i]);
    vel[i].limit(5);
    loc[i].add(vel[i]);
    //wrap the ball's position
    if (loc[i].x >= width) {
      loc[i].x = 0;
    } else if (loc[i].x  <= 0) {
      loc[i].x = width;
    }
    if (loc[i].y/2 >= height) {
      loc[i].y =0;
    } else if (loc[i].y <= 0) {
      loc[i].y = height ;
    }
  }
  }