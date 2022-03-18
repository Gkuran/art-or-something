float r1 = 200;
float r2 = 200;
float m1 = 15;
float m2 = 15;
float theta1 = PI/2;
float theta2 = PI/2;
float v1 = 0;
float v2 = 0;
float g = 1;

float px2 = -1;
float py2 = -1;
float cx, cy;

PGraphics canvas;

void setup(){
  size(900, 600);
  cx = width/2;
  cy = 50;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw(){
  
  float num1 = -g*(2*m1+m2)*sin(theta1);
  float num2 = -m2*g*sin(theta1-2*theta2);
  float num3 = -2*sin(theta1-theta2)*m2;
  float num4 = v2*v2*r2+v1*v1*r1*cos(theta1-theta2);
  float den = r1*(2*m1+m2-m2*cos(2*theta1-2*theta2));
  
  float a1 = (num1 + num2 + num3*num4)/den;
  
  num1 = 2*sin(theta1-theta2);
  num2 = (v1*v1*r1*(m1+m2));
  num3 = g*(m1+m2)*cos(theta1);
  num4 = v2*v2*r2*m2*cos(theta1-theta2);
  den = r2*(2*m1+m2-m2*cos(2*theta1-2*theta2));
  
  float a2 = (num1*(num2+num3+num4))/den;
  
  
  //background(255);
  image(canvas,0,0);
  stroke(0);
  strokeWeight(2);
  translate(cx, cy);
  
  float x1 = r1 * sin(theta1);
  float y1 = r1 * cos(theta1);
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1, y1, m1, m1);
  
  float x2 = x1 + r2*sin(theta2);
  float y2 = y1 + r2*cos(theta2);
  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);
  
  v1 += a1;
  v2 += a2;
  theta1 += v1;
  theta2 += v2;
  
  canvas.beginDraw();
  canvas.translate(cx, cy);
  canvas.strokeWeight(1);
  canvas.stroke(0);
  if(frameCount>1){
    canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();
  
  px2 = x2;
  py2 = y2;
  
  //saveFrame("frames//###.png");
  
}
