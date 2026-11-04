// Dear Data 100 football passes
// Each circle is one pass drawn where the pass ended.
// Green circle = successful pass and a red circle = unsuccessful pass.
// These are the first 25 passes from my data.

Pass[] passes = new Pass[25];

int successfulCount = 0;
int unsuccessfulCount = 0;

// The graph is a square. It starts at 80, 108 and is 480 wide and tall.
float graphX = 80;
float graphY = 108;
float graphSize = 480;


void setup() {
  size(900, 670);
  makePasses();

  // count all of the successful and unsuccessful passes
  for (int i = 0; i < passes.length; i++) {
    if (passes[i].successful) {
      successfulCount++;
    } else {
      unsuccessfulCount++;
    }
  }
}


void draw() {
  background(255);

  // title
  fill(0);
  textSize(24);
  text("Where 25 of my football passes ended", 80, 40);
  textSize(14);
  text("Each circle is one pass, placed at where it ended which is the End X and End Y. Both 0 to 100.", 80, 65);

  // box for the graph
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(graphX, graphY, graphSize, graphSize);

  // numbers
  fill(0);
  noStroke();
  textSize(13);
  text("0", 77, 606);
  text("50", 313, 606);
  text("100", 548, 606);
  text("End X (0 - 100): along the pitch", 200, 630);
  text("0", 60, 592);
  text("50", 52, 352);
  text("100", 46, 112);
  text("End Y (0 - 100): across the pitch", 40, 96);

  // this part is for drawing every pass
  for (int i = 0; i < passes.length; i++) {
    passes[i].display();
  }

  // key
  stroke(0);
  strokeWeight(1);
  fill(40, 160, 60);
  ellipse(630, 110, 16, 16);
  fill(220, 50, 50);
  ellipse(630, 140, 16, 16);

  fill(0);
  noStroke();
  textSize(15);
  text("Green circle = successful pass", 650, 115);
  text("Red circle = unsuccessful pass", 650, 145);

  // total
  text("Total passes: " + passes.length, 620, 220);
  text("Successful: " + successfulCount, 620, 245);
  text("Unsuccessful: " + unsuccessfulCount, 620, 270);
}


// makes the 25 passes
// new Pass(pass number, end x, end y, successful?)
void makePasses() {
  passes[0] = new Pass(1, 79, 14, true);
  passes[1] = new Pass(2, 22, 71, true);
  passes[2] = new Pass(3, 2, 12, true);
  passes[3] = new Pass(4, 90, 39, true);
  passes[4] = new Pass(5, 74, 68, true);
  passes[5] = new Pass(6, 18, 86, true);
  passes[6] = new Pass(7, 36, 17, false);
  passes[7] = new Pass(8, 98, 42, true);
  passes[8] = new Pass(9, 76, 30, true);
  passes[9] = new Pass(10, 38, 67, true);
  passes[10] = new Pass(11, 4, 23, true);
  passes[11] = new Pass(12, 82, 45, true);
  passes[12] = new Pass(13, 98, 98, true);
  passes[13] = new Pass(14, 29, 33, true);
  passes[14] = new Pass(15, 42, 98, true);
  passes[15] = new Pass(16, 2, 39, false);
  passes[16] = new Pass(17, 77, 45, false);
  passes[17] = new Pass(18, 76, 58, true);
  passes[18] = new Pass(19, 70, 50, true);
  passes[19] = new Pass(20, 8, 45, true);
  passes[20] = new Pass(21, 39, 42, true);
  passes[21] = new Pass(22, 12, 58, true);
  passes[22] = new Pass(23, 52, 24, false);
  passes[23] = new Pass(24, 33, 88, true);
  passes[24] = new Pass(25, 52, 20, true);
}


float toScreenX(float x) {
  return graphX + x / 100.0 * graphSize;
}

// y = 0 is at the bottom of the graph
float toScreenY(float y) {
  return graphY + graphSize - y / 100.0 * graphSize;
}


class Pass {
  int number;
  float endX;
  float endY;
  boolean successful;

  Pass(int n, float x, float y, boolean ok) {
    number = n;
    endX = x;
    endY = y;
    successful = ok;
  }

  // draws this pass as a circle
  void display() {
    if (successful) {
      fill(40, 160, 60);
    } else {
      fill(220, 50, 50);
    }
    stroke(0);
    strokeWeight(1);
    ellipse(toScreenX(endX), toScreenY(endY), 16, 16);
  }
}
