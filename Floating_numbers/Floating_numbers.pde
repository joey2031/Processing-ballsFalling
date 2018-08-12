
ArrayList<Ball> balls;
int ballWidth = 40;
float r;
void setup() {
  size(640, 360);
  noStroke();

  // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();
  
  // Start by adding one element
  balls.add(new Ball(r, 0, ballWidth)); // X pos, y Pos width
}

void draw() {
  background(255);

  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) { // if its done falling remove it from the list
      // Items can be deleted with remove()
      balls.remove(i);
    }
    
  }  
  
}

void mouseReleased() {
  // A new ball object is added to the ArrayList (by default to the end)
   r = random(1, 300);
  balls.add(new Ball(r, 0, ballWidth)); // cookie will be drawen in a random spot everytime.
}




// Simple ball class

class Ball {
  
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
  }
  
    void move() {
    // Add gravity to speed
    speed = speed + gravity; // like that y equation I had in testing.
    // Add speed to y location
    y = y + speed;
  }
  
  boolean finished() {
      return false; // meaning it is off the screen
  }
  
  void display() {
    // Display the circle
    fill(45); // colour of the ball
    ellipse(x,y,w,w);
  }
}  // so where is this redrawing the background??