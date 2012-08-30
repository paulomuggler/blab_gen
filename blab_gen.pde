// colors are #AARRGGBB
// light yellow: 0xFFF6F16F
// petrol green: 0x9934A89B
// olive green:  0xFF77B794
static final int BGND_COLOR = 0xFFF6F16F;
static final int TEXT_COLOR = 0xFF000000;
static final int TRI0_COLOR = 0x9934A89B;
static final int TRI1_COLOR = 0xFF77B794;

static final int CANVAS_SIZE = 500;
static final int FONT_SIZE = 256;


void generate() {

  background(BGND_COLOR);

  int qx = 1;
  int qy = 1;
  int qteta = 1;

  int offsetX = 0;
  int offsetY = 0;

  switch(int(random(0, 4))) {
  case 0:
    qteta = -1;
    break;
  case 1:
    offsetX = CANVAS_SIZE; 
    qx = -1;
    break;
  case 2:
    qteta = -1;
    offsetX = CANVAS_SIZE; 
    qx = -1;
    offsetY = CANVAS_SIZE; 
    qy = -1;
    break;
  case 3:
    offsetY = CANVAS_SIZE; 
    qy = -1;
    break;
  }

  float x1 = offsetX + qx*random(CANVAS_SIZE/12, 2*CANVAS_SIZE/12);
  float y1 = offsetY+ qy*random(CANVAS_SIZE/12, 2*CANVAS_SIZE/12);

  float xB1 = (CANVAS_SIZE-offsetX)-qx*random(CANVAS_SIZE/4, 2*CANVAS_SIZE/4);
  float yB1 = (CANVAS_SIZE-offsetY)-qy*random(CANVAS_SIZE/4, 2*CANVAS_SIZE/4);


  float base1 = 150;
  float teta1 = qteta*random(0, PI/2);

  float base2 = 200f;
  float teta2 = qteta*random(0, PI/2);

  project_triangle(new PVector(x1, y1), 
  new PVector(xB1, yB1), base1, teta1);

  project_triangle(new PVector(x1, y1), 
  new PVector(xB1-(base1/2)*cos(teta1), 
  (yB1-(base1/2)*sin(teta1))), base2, teta2);

  fill(0);
  textSize(96);  
  text("b lab", 60, 540);
}

void project_triangle(PVector p, PVector base_ctr, float base_sz, float base_teta) {

  fill(TRI0_COLOR);
  stroke(TRI0_COLOR);

  PVector p2 = new PVector(base_ctr.x+(base_sz/2)*cos(base_teta), base_ctr.y+(base_sz/2)*sin(base_teta));
  PVector p3 = new PVector(base_ctr.x-(base_sz/2)*cos(base_teta), base_ctr.y-(base_sz/2)*sin(base_teta));

  triangle(p.x, p.y, p2.x, p2.y, p3.x, p3.y);
}

void setup() {
  size(CANVAS_SIZE, CANVAS_SIZE);
}

void draw() {
  if (millis() <= 2000.0) {
    generate();
  }
}

void keyReleased() {
  generate();
}

void mouseClicked() {
  generate();
}

