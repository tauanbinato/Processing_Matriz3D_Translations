PImage grid;
PVector p0 = new PVector(0,0); 
PVector p1 = new PVector(200,0); 
PVector p2 = new PVector(100,100); 
PVector pCenter = new PVector(0,0);

//Matriz
float [][] idMat = new float[][]
{
 {1,0,0,0},
 {0,1,0,0},
 {0,0,1,0},
 {0,0,0,1}
 };

void setup() 
{
  size(800, 600);
  //grid = loadImage("grid.jpg");
  
}

void draw() 
{
  fill(255);
  background(0);
  //image(grid, 0, 0);
  stroke(255);
  //line(p0.x, p0.y , p1.x,p1.y);
  //line(p1.x,p1.y , p2.x,p2.y);
  //line(p2.x,p2.y , p0.x,p0.y);
  m_PrintAtPosition(idMat , width/2,height/2);
}

/*
***************************************************************************************************************
***************************************************************************************************************
                                                 ALL ABOUT CONVERTIONS ========================================
***************************************************************************************************************
***************************************************************************************************************
*/

float c_ToRadius(float angle)
{
  //radians = degrees × π / 180°
  
  float result = angle * (PI/180);
  return result;
  
}

float[][] c_PVectorToMatriz2D(PVector v1)
{
  float[][] res = new float[][]{{v1.x},{v1.y},{v1.z}};
  return res;
}

float[][] c_PVectorToMatriz3D(PVector v1)
{
  float[][] res = new float[][]{{v1.x},{v1.y},{v1.z},{1}};
  return res;
}

//---------------------------------------------------------

/*
***************************************************************************************************************
***************************************************************************************************************
                                                 ALL ABOUT MATRIZ =============================================
***************************************************************************************************************
***************************************************************************************************************
*/



void m_PrintAtPosition(float[][] matriz , float x , float y){
  
  int xStep = 30;
  int yStep = 50;
  
  for(int i = 0 ; i < matriz.length ; i++)
  {
      for(int j = 0 ; j < matriz[i].length ; j++)
    {
      text(nf(matriz[i][j] , 1 ,1), x + xStep*j , y + yStep*i);
    }
    
  }
  
}

//MATRIZ TRANSLATION-------------------------------------

void m_TranslatePoint(float[][] p, float x, float y)
{
  
  /*
  T(a,b) =  [1,0,0,a]
            [0,1,0,b]
            [0,0,1,z]
            [0,0,0,1]
  */
  
  
  
  //Creating the matriz with the coords to be multiplied by the PVector
  float[][] matriz = new float[3][3];
  matriz[0][3] = x;
  matriz[1][3] = y;
  
  
  
  return;
}

//-------------------------------------------------------

//MATRIZ ROTATION----------------------------------------

void m_RotateMatriz(float[][] matriz, float angle)
{
  /*
  R(ang) =  [cos(ang),-sin(ang),0,0]
            [sin(ang),cos(ang) ,0,0]
            [0       ,0        ,1,0]
            [0       ,0        ,0,1]
  */
  
  matriz[0][0] =  cos(c_ToRadius(angle));
  matriz[0][1] = -sin(c_ToRadius(angle));
  matriz[1][0] =  sin(c_ToRadius(angle));
  matriz[1][1] =  cos(c_ToRadius(angle));
  
   return;
}
//-------------------------------------------------------


//MATRIZ Scaling-----------------------------------------

void m_ScaleMatriz(float[][] matriz, float s , float t)
{
  /*
  Scale s represents x and t - y
  R(s(x),t(y)) =  [s,0,0,0]
                  [0,t,0,0]
                  [0,0,1,0]
                  [0,0,0,1]
  */
  
  matriz[0][0] = s * matriz[0][0];
  matriz[1][1] = t * matriz[1][1];
  
  return;
}

//-----------------------------------------------------------

//MATRIZ REFLECTIONS-----------------------------------------

void m_ReflectMatriz(float[][] matriz, String xy)
{
  /*
  Reflects the point
  R(-s) =        [-s,0,0,0]
                 [ 0,t,0,0]
                 [ 0,0,1,0]
                 [ 0,0,0,1]
  */
  if(xy == "x")
  {
    matriz[0][0] = -matriz[0][0];
  }
  else if(xy == "y")
  {
    matriz[1][1] = -matriz[1][1];
  }
  else
  {
   exit(); 
  }
  
  return;
}

//---------------------------------------------------------