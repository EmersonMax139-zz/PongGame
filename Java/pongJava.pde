Ball ball;

Paddle left;
Paddle right;


// Uses processing: setup() creates canvas
// and runs once, draw() runs repeatedly as
// long as the program/webpage is running
void setup() {
  size(500, 350);
  ball = new Ball();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  background(0);

  ball.checkPaddleRight(right);
  ball.checkPaddleLeft(left);

  left.show();
  right.show();
  //left.update();
  //right.update();

  ball.update();
  ball.walls();
  ball.display();

}

//void keyReleased() {
//  left.move(0);
//  right.move(0);
//}

// Global function associated with processing,
//   -- does not need to be called
void keyPressed() {
  if (key == 'a') {
    left.move(-25);
  } else if (key == 'z') {
    left.move(25);
  }

  if (key == 'k') {
    right.move(-25);
  } else if (key == 'm') {
    right.move(25);
  }
}


class Ball {

  float x = width/2;
  float y = height/2;
  float xSpeed;
  float ySpeed;
  float r = 12;

  // CONSTRUCTOR
  Ball() {
    reset();
  }

  // Checks collision with leftPaddle/PlayerOne
  void checkPaddleLeft(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        // angle calculation for accurate bounce off paddle
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xSpeed = 3 * cos(angle);
        ySpeed = 3 * sin(angle);
        x = p.x + p.w/2 + r;
        //xspeed *= -1;
      }
    }
  }
  void checkPaddleRight(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        //xSpeed *= -1;
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xSpeed = 3 * cos(angle);
        ySpeed = 3 * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }



  void display() {
    fill(0, 255, 0);
    ellipse(x, y, r*2, r*2);
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  // ball resets with random trajectory
  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xSpeed = 3 * cos(angle);
    ySpeed = 3 * sin(angle);

    if (random(1) < 0.5) {
      xSpeed *= -1;
    }
  }

  // accounts for hitting top and bottom
  // hitting either side resets
  void walls() {
    if(y >= height || y <= 0) {
    ySpeed *= -1;
    }
    if(x >= width) {
      reset();
    }
    if(x <= 0){
      reset();
    }
  }


} // END BALL

class Paddle {
  float x;
  float y = height/2;
  float w = 10;
  float h = 100;
  float ySpeed;

  // float ychange = 0;

  Paddle(boolean left) {
    if (left) {
      x = w
    } else {
      x = width - w
    }
  }

  //  -- constrain() restricts paddle movement to
  //  -- top and bottom:
  //  -- function update() is commented out because
  //  -- the game glitches when it is called, and
  //  -- works fine without.
  //  void update() {
  //  y += ychange;
  //  y = constrain(y, h/2, height-h/2);
  // }

  void move(float speed) {
    ySpeed = speed
    y += ySpeed;
}

  void show() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
  }



} // PADDLE
