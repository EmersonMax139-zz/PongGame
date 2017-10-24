// TO DO:
//    - Figure out the distance problem
//    - Make scoreboard
//    - Replace values in collision functions with variables


var paddles = [];
var jawn; // <!-- jawn is the ball -->



function setup() {
  createCanvas(800,600);

  paddles[0] = new Paddle(10, 300);
  paddles[1] = new Paddle(780, 300);
  jawn = new Ball();
}




function draw() {
  background(0);


  for(i=0; i<paddles.length; i++) {
    paddles[i].display();
    paddles[0].moveOpponent();
    paddles[1].move();
    }


  jawn.display();
  jawn.move();
  jawn.bounce();
  jawn.collideMe(paddles[0].x , paddles[0].y);
  jawn.collideTwo(paddles[1].x, paddles[1].y);
  gameOver();




}

function gameOver() {
   if (jawn.x <= -10) {

     paddles[0] = new Paddle(10, 300);
     paddles[1] = new Paddle(780, 300);
     jawn = new Ball();
}

 if (jawn.x >= width + 10) {

     paddles[0] = new Paddle(10, 300);
     paddles[1] = new Paddle(780, 300);
     jawn = new Ball();

}

}
