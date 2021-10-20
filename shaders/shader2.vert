attribute vec4 vPosition;

uniform float table_width;
uniform float table_height;

const int MAX_CHARGES=100;
uniform vec2 eletronPos[MAX_CHARGES];
uniform vec2 protonPos[MAX_CHARGES];

const float charge = 0.1;
const float COULOUMB_CONSTANT = 8.99 * pow(10.0, 9.0);

vec2 total = vec2(0.0, 0.0);

float calculateDistance(vec2 pos){
   float xDiff = vPosition.x - pos.x; 
   float yDiff = vPosition.y - pos.y;

   return sqrt(xDiff*xDiff + yDiff*yDiff);
}


void calculate(){
    for(int i = 0; i < ; i++){
        float radius = calculateDistance(protonPos[i]);
        float e = COULOUMB_CONSTANT * charge / pow(radius, 2);

        vec2 curr = vec2( e * (protonPos[i][0] - vPosition.x)/radius, e * (protonPos[i][1] - vPosition.y) / radius);
        total += curr;
    }
    
}


void main()
{
    gl_PointSize = 4.0;
    gl_Position = vPosition;
    gl_Position.x = gl_Position.x / (table_width/2.0);
    gl_Position.y = gl_Position.y / (table_height/2.0);    
}
