class Snake {
  PVector pos;
  PVector vel;
  ArrayList<PVector> hist;
  int len;
  int moveX = 0;
  int moveY = 0;

  Snake() {
    pos = new PVector(0, 0);
    vel = new PVector();
    hist = new ArrayList<PVector>();
    len = 0;
  }

  void updateComponents() {
    hist.add(pos.copy());
    pos.x += vel.x*grid;
    pos.y += vel.y*grid;
    moveX = int(vel.x);
    moveY = int(vel.y);

    pos.x = (pos.x + width) % width;
    pos.y = (pos.y + height) % height;

    if (hist.size() > len) {
      hist.remove(0);
    }

    for (PVector p : hist) {
      if (p.x == pos.x && p.y == pos.y) {
        dead = true;
        if (len > highscore) highscore = len;
      }
    }
  }

  void eat() {
    if (pos.x == food.x && pos.y == food.y) {
      len++;
      if (speed > 5) speed--;
      newFood();
    }
  }

  void showComponents() {
    noStroke();
    fill(250);
    rect(pos.x, pos.y, grid, grid);
    for (PVector p : hist) {
      rect(p.x, p.y, grid, grid);
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT && snakeSolid.moveX != 1) {
    snakeSolid.vel.x = -1;
    snakeSolid.vel.y = 0;
  } else if (keyCode == RIGHT && snakeSolid.moveX != -1) {
    snakeSolid.vel.x = 1;
    snakeSolid.vel.y = 0;
  } else if (keyCode == UP && snakeSolid.moveY != 1) {
    snakeSolid.vel.y = -1;
    snakeSolid.vel.x = 0;
  } else if (keyCode == DOWN && snakeSolid.moveY != -1) {
    snakeSolid.vel.y = 1;
    snakeSolid.vel.x = 0;
  }
}
