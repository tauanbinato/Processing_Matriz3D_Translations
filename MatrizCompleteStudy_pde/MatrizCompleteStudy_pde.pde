PImage grid;
PVector p0 = new PVector(0,0); 
PVector p1 = new PVector(200,50); 
PVector p2 = new PVector(100,100); 
PVector pCenter = new PVector(0,0);

//Matriz
float [][] idMat = new float[][]
{
 {1,0,0,2},
 {0,1,0,2},
 {0,0,1,0},
 {0,0,0,1}
 };

float [][] pMatriz = new float[0][3];

void setup() 
{
  size(800, 600);
  //grid = loadImage("grid.jpg");
  pMatriz = c_PVectorToMatriz2D(p1);
  m_TranslatePoint(idMat, pMatriz , 30 , 30);
  
}

void draw() 
{
  fill(255);
  background(0);
  //image(grid, 0, 0);
  stroke(255);
  
  m_PrintAtPosition(idMat , width/2,height/2);
  m_PrintAtPosition(pMatriz , width/2 - 100,height/2 -100);
  
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
                                                 ALL ABOUT CHECKERS ========================================
***************************************************************************************************************
***************************************************************************************************************
*/


/*
***************************************************************************************************************
***************************************************************************************************************
                                                 ALL ABOUT MATRIZ =============================================
***************************************************************************************************************
***************************************************************************************************************
*/

//MATRIZ PRINTER-------------------------------------
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

void m_TranslatePoint(float[][] mId, float[][] p , float x, float y)
{
  /*
  T(a,b) =  [1,0,0,a]
            [0,1,0,b]
            [0,0,1,z]
            [0,0,0,1]
  */
  
  
  //Checking if is 2D OR 3D
  if(p.length == 3 && mId.length == 3)
  {
     
    
    mId[0][2] = x;
    mId[1][2] = y;
    mId[1][2] = 1;
    
    for(int i =0 ; i < mId.length ; i++)
    {
        for(int j =0 ; j < mId[i].length ; j++)
        {
         p[0][j] = mId[i][j] * p[0][j];
        }
      
    }
    
    
    
  }
  /*
  else if(p.length == 4)
  {
    
    float[][]result = new float[0][4];
    
    mId[0][3] = x;
    mId[1][3] = y;
    mId[1][3] = 1;
    
    for(int i =0 ; i < mId.length ; i++)
    {
        for(int j =0 ; j < mId[i].length ; j++)
        {
         result[0][j] = mId[i][j] * p[0][j];
        }
      
    }
    
    return result;
  }
  
  else
  {
    exit();
  }
  
  float[][] a = new float[0][0];
  return a;
  */
 
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