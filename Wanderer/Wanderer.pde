//declare variables
PVector loc, vel, acc; 
float diam;

void setup() {
  //set size of canvas
  size(800, 600);
  background(0);

  //initialize variables                                                                       
  loc = new PVector (width/2, height/2);
  diam = 80;
  vel= PVector.random2D();
  vel.mult(5);
  acc = PVector.random2D();
  acc.mult(.1);
}
void draw() {
  //draw background to cover previous frame

  acc = PVector.random2D();
  acc.mult(.1);
  noStroke();
  colorMode(HSB, 360);
  for (int i = 0; i < 360; i++) {
    for (int j = 0; j < 360; j++) {
      stroke(i, j, 360);
    }

    //draw ball
    ellipse(loc.x, loc.y, diam, diam);

    //add velocity to position
    vel.add(acc);
    vel.limit(.5);
    loc.add(vel);
    //wrap the ball's position
    if (loc.x >= width) {
      loc.x = 0;
    } else if (loc.x  <= 0) {
      loc.x = width;
    }
    if (loc.y/2 >= height) {
      loc.y =0;
    } else if (loc.y <= 0) {
      loc.y = height ;
    }
  }
}