int grid = 20; //How big each grid square will be
PVector food;
int speed = 10;
boolean dead = true;
int highscore = 0;
Snake snakeSolid;

void setup() {
  size(600, 600);
  snakeSolid = new Snake();
  food = new PVector();
  newFood();
  //frameRate(8);
}

void draw() {
  background(600);
  fill(255);
  if (!dead) {

    if (frameCount % speed == 0) {
      snakeSolid.updateComponents();
    }
    snakeSolid.showComponents();
    snakeSolid.eat();
    fill(255, 255, 0);
    rect(food.x, food.y, grid, grid);
    textAlign(LEFT);
    textSize(25);
    fill(255);
    text("Score: " + snakeSolid.len, 10, 20);
  } else {
    textSize(20);
    textAlign(CENTER, CENTER);
    text("UTA Eduard & TUDORASCU SORIN\nSnake Game\nClick to start" + "\nHighscore: " + highscore, width/2, height/2);
  }
}

void newFood() {
  food.x = floor(random(width));
  food.y = floor(random(height));
  food.x = floor(food.x/grid) * grid;
  food.y = floor(food.y/grid) * grid;
}

void mousePressed() {
  if (dead) {
    snakeSolid = new Snake();
    newFood();
    speed = 10;
    dead = false;
  }
}
