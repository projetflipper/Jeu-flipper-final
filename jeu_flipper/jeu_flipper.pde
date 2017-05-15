//Variables d'états pour les différents menus
final int stateMenu = 0;       //Menu Principal
final int stateSeeRecords = 1; //Menu des Records
final int statePerso = 2;      //Menu de Prsonnalisation
final int stateJeu = 3;        //L'utilisateur joue au jeu
final int statePause = 4;      //Menu Pause
final int stateGameOver = 5;   //Menu de Fin de Partie
int state = stateMenu; //Initialisation de la variable "state"
String Nom = "";             //Nom d'utilisateur
int n = 0;
PImage img;        
PFont  Font;
String a= "lk";  //Variables de nom d'utilisateur pour les 10 records
String b= "l";
String c="l";
String d="l";
String e="l";
String f="l";
String g="l";
String h="l";
String i="l";
String j="l";
int r1=0;                      //Variables des 10 records
int r2=0;
int r3=0;
int r4=0;
int r5=0;
int r6=0;
int r7=0;
int r8=0;
int r9=0;
int r10=0;
color couleur;
Balle Bille = new Balle(665,835, color(237,127,7));
FlipperL Gauche = new FlipperL();
FlipperR Droit = new FlipperR();
float mov;
int N1,N2,N3;
int score;
PrintWriter Name;
PrintWriter Points;
//BufferedReader reader;
BufferedReader readerS;
BufferedReader readerN;
String lineN;
String lineS;
int vie=3;
void setup(){
size(900,900);
  Name = createWriter("noms.txt"); 
  Points = createWriter("score.txt"); 
  couleur = color(255, 255, 255);
  N1=200;
N2=200;
N3=300;
  readerS = createReader("score.txt");
  readerN = createReader("noms.txt");
    
}

void draw(){
background(100);
Name.println(a + b + c + d + e + f + g + h + i + j);
Points.println(r1);
Points.println(r2);
Points.println(r3);
Points.println(r4);
Points.println(r5);
Points.println(r6);
Points.println(r7);
Points.println(r8);
Points.println(r9);
Points.println(r10);
if (state== 0)
{
  fill(255);
  textSize(40);                       //Définition de la position et des caractéristiques du texte
  textAlign(CENTER);                  //
  text("PINBALL GALAXY", 450, 100);   //
  
  textSize(24);
  textAlign(CENTER);
  text("Appuyez sur entrée pour commencer une partie", 450, 250);

  text("Appuyez sur espace pour voir les records", 450, 350);

  text("Appuyez sur echap pour quitter", 450, 700);
}
if (state == 1)
{
 textSize(40);
 textAlign(CENTER);
 text("Records", 450, 100);
 
 textSize(24);
 textAlign(LEFT); 
 text("1.", 300, 250);
 text(a, 325, 250);
 text(r1, 475, 250);

 text("2.", 300, 275);
 text(b, 325, 275);
 text(r2, 475, 275);

 text("3.", 300, 300); 
 text(c, 325, 300);
 text(r3, 475, 300);

 text("4.", 300, 325);
 text(d, 325, 325);
 text(r4, 475, 325);

 text("5.", 300, 350);
 text(e, 325, 350);
 text(r5, 475, 350);

 text("6.", 300, 375);
 text(f, 325, 375);
 text(r6, 475, 375);

 text("7.", 300, 400);
 text(g, 325, 400);
 text(r7, 475, 400);

 text("8.", 300, 425);
 text(h, 325, 425);
 text(r8, 475, 425);
  
 text("9.", 300, 450);
 text(i, 325, 450);
 text(r9, 475, 450);
  
 text("10.", 285, 475);
 text(j, 325, 475);
 text(r10, 475, 475);
 
  textAlign(CENTER);
  text("appuyez sur entrée pour quitter", 450, 700);
}
if (state == 2)
{ 

 fill(255);
 textSize(32);
 textAlign(CENTER);
 text("Entrez votre pseudo", 450, 100); 
 text("(10 caractères maximum)", 450, 130); 

 text(Nom, 450, 400);
 
 textSize(24);
 textAlign(CENTER);
 text("Appuyez sur Entrée pour valider", 450, 500);
 
 text("Appuyez sur les flèches pour choisir la couleur de la balle", 450, 625);

 
 text("Appuyez sur Entrée pour commencer la partie", 450, 700);
 
 text("appuyez sur control pour quitter", 450, 750);
 
 fill(couleur);
 ellipse(450,550,30,30);


}

if (state == 3)
{
background(100);
strokeWeight(2);// epaisseur des traits
fill(107,13,13);
stroke(0);
rect(20,20,660,860);//espace du jeu

line(650,100,650,850);//couloir de lancer
pushStyle();
stroke(255, 0, 0); //couleur 
line(280,850,380,850);//ligne du bas entre triangles
popStyle();

noFill();//pas de remplissage
triangle(20,750,20,850,280,850);//en bas à gauche
triangle(650,750,380,850,650,850);// en bas à droite



pushStyle();
noFill();
beginShape();// rampe basdroite flipper
vertex(600,550);
vertex(600,700);
vertex(440,785);
endShape();
beginShape();// rampe basgauche flipper
vertex(70,550);
vertex(70,700);
vertex(230,785);
endShape();
popStyle();

pushStyle();
fill(0);
strokeJoin(ROUND);           // Jointure arrondie
beginShape();                // triangle au dessus rampedroite
vertex(550,550);
vertex(550,675);
vertex(425,735);
endShape(CLOSE);


beginShape();// triangle au dessus rampegauche
vertex(120,550);
vertex(120,675);
vertex(235,735);
endShape(CLOSE);
popStyle();

line(650,415,600,475);                      //rampe milieudroite
line(20,415,70,475);                        //rampe milieugauche



line(630,20,680,70);

arc(300,95,30,30,PI,PI+PI);// couloir 1
pushStyle();
stroke(255,0,0);
line(285,95,285,170);
line(315,95,315,170);
popStyle();
arc(300,170,30,30,0,PI);

arc(380,95,30,30,PI,PI+PI);// couloir 2
pushStyle();
stroke(255,0,0);
line(365,95,365,170);
line(395,95,395,170);
popStyle();
arc(380,170,30,30,0,PI);

arc(460,95,30,30,PI,PI+PI);// couloir 3
pushStyle();
stroke(255,0,0);
line(445,95,445,170);
line(475,95,475,170);
popStyle();
arc(460,170,30,30,0,PI);

arc(540,95,30,30,PI,PI+PI); //couloir 4
pushStyle();
stroke(255,0,0);
line(525,95,525,170);
line(555,95,555,170);
popStyle();
arc(540,170,30,30,0,PI);


pushStyle();
stroke(0,0,255);
ellipse(350,270,100,100);// bumper 1
popStyle();
ellipse(350,270,90,90);


pushStyle();
stroke(136,6,206);
ellipse(520,270,100,100);// bumper 2
popStyle();
ellipse(520,270,90,90);


pushStyle();
stroke(253,108,158);
ellipse(435,390,100,100);// bumper 3
popStyle();
ellipse(435,390,90,90);




  
  pushStyle();   //portails
fill(0); //couleur 
stroke(0,255,0);
ellipse(100,350,40,40);
ellipse(600,370,40,40);
popStyle();

pushStyle();
fill(#FFFF00);  
  beginShape();//étoile 1
  vertex(350, 220);
  vertex(364, 250);
  vertex(397, 255);
  vertex(373, 277);
  vertex(379, 310);
  vertex(350, 295);
  vertex(321, 310);
  vertex(327, 277);
  vertex(303, 255);
  vertex(336, 250);
  endShape(CLOSE);
  
  beginShape();//étoile 2
  vertex(520, 220);
  vertex(534, 250);
  vertex(567, 255);
  vertex(543, 277);
  vertex(549, 310);
  vertex(520, 295);
  vertex(491, 310);
  vertex(497, 277);
  vertex(473, 255);
  vertex(506, 250);
  endShape(CLOSE);
  
   beginShape();//étoile 3
  vertex(435, 340);
  vertex(449, 370);
  vertex(482, 375);
  vertex(458, 397);
  vertex(464, 430);
  vertex(435, 415);
  vertex(406, 430);
  vertex(412, 397);
  vertex(388, 375);
  vertex(421, 370);
  endShape(CLOSE);
popStyle();

N1=N1+1;// limitation de la rotation de l'etoile1
  if(N1<25){
    etoile1();
  };
  
  N2=N2+1;// limitation de la rotation de l'etoile2
  if(N2<25){
    etoile2();
  }
  N3=N3+1;// limitation de la rotation de l'etoile3
  if(N3<25){
    etoile3();
  }






 noStroke();
fill(255,255,255);
textSize(40); // affichage du score
text("Score:", 775,60);
text(score,775,100);
  //Déplacement et affichage de la bille
  Bille.mouvement();
  Bille.collision();
  Bille.affichage(); 
    Gauche.dessin();
  Gauche.mouv();
  Droit.dessin();
  Droit.mouv();
}

if (state == 4)
{
 fill(255);
 textSize(32);
 textAlign(CENTER);
 
 text("Pause",450,100);
 
 textSize(24);
 text("Appuyez sur entrée pour retourner au jeu", 450, 400);
 text("Appuyez sur control pour revenir au menu principal", 450, 500);
 text("Appuyez sur echap pour quitter", 450, 600);
}

if (state == 5)
{
  if (vie>0)
  {
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("Game Over", 450, 150);
  textSize(50);
  text("Score :",450,300);
  text(score, 450, 350);
  text("Vies :",450,400);
  text(vie,450,450);
  textSize(24);
  text("Appuyez sur entrée pour recommencer", 450, 600);
  text("Appuyez sur echap pour quitter", 450, 700);
  }
  else
  {
   
   fill(255);
  textSize(80);
  textAlign(CENTER);
  text("Game Over", 450, 150);
  textSize(50);
  text("Vous n'avez plus de vie", 450, 200);
  textSize(50);
  text("Score :",450,300);
  text(score, 450, 350);
  text("Vies :",450,400);
  text(vie,450,450);
  textSize(24);
  text("Appuyez sur entrée pour recommencer", 450, 600);
  text("Appuyez sur echap pour quitter", 450, 700);
    
  }
}
}

class FlipperL
{
  float x_mouvL=285;
  float y_mouvL=600;
  
void mouv()
{
  if (state == 3)
  {
  if (keyCode == LEFT && keyPressed == true)
  {
    x_mouvL=285;
    y_mouvL=685;

  }
  else
  {
    x_mouvL=285;
    y_mouvL=760;
  }
  }
 
}
  
void dessin()
{
beginShape();
vertex(233,733);
vertex(237,737);
vertex(x_mouvL+5,y_mouvL+5);
vertex(x_mouvL-5,y_mouvL-5);
endShape(CLOSE);
}
}

class FlipperR
{
  float x_mouvR=375;
  float y_mouvR=600;
  
void mouv()
{
  if (state == 3)
  {
  if (keyCode == RIGHT && keyPressed == true)
  {
    x_mouvR=375;
    y_mouvR=685;

  }
  else
  {
    x_mouvR=375;
    y_mouvR=760;
  }
  }
 
}
  
void dessin()
{
beginShape();
vertex(427,733);
vertex(423,737);
vertex(x_mouvR-5,y_mouvR+5);
vertex(x_mouvR+5,y_mouvR-5);
endShape(CLOSE);
}
}



class Balle {
  //Déclaration des paramètres de base de la bille
  float x_bille;
  float y_bille;
  float mouvement_sur_x = 6; 
  float mouvement_sur_y = 6; 

  //Construction de la bille
  Balle (float nouvx_bille, float nouvy_bille, color nouvCouleur) {
    x_bille          = nouvx_bille;
    y_bille          = nouvy_bille;
    couleur    = nouvCouleur;

//    mouvement_sur_x = 6; // Vitesse de la balle sur l'axe x
//    mouvement_sur_y = 6; // Vitesse de la balle sur l'axe y
  }
  //Dessin de la bille
  void affichage() {
    fill(couleur);
    ellipse(x_bille, y_bille, 20, 20);  
  }

  void mouvement() {
   x_bille = x_bille + mouvement_sur_x;
   y_bille = y_bille + mouvement_sur_y;
}
void collision() {
    
    if (x_bille > 680 || x_bille < 30) // bord du terrain
    {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
    if (y_bille < 30) // bord du terrain
    {
      mouvement_sur_y = mouvement_sur_y * -1;
    }
 if(y_bille>860-10 && (x_bille>380+10 || x_bille<280-10))
    {
      mouvement_sur_y = mouvement_sur_y * -1;
    }
  if(x_bille>=280-10 && x_bille<=380+10 && y_bille>860-10) // ligne rouge
    {
      x_bille=660+5;
      y_bille=860-55;
      mouvement_sur_x=0;
      mouvement_sur_y=0;
      vie = vie-1;
      state = 5;
    }
     if(x_bille==665 && y_bille==835 )
    {
      if (key == ' ')
      {
        mouvement_sur_x=6;
         mouvement_sur_y=-6;
      }
      else
      {
        mouvement_sur_x=0;
         mouvement_sur_y=0;
      }
    }

    if (mouvement_sur_y>0 && x_bille<640)
    {
      mouvement_sur_y=10;
    }
    if (mouvement_sur_y<0 && x_bille<640)
    {
      mouvement_sur_y=-2;
    }
    
    
    if (state==3) // Flipper gauche
    {
    if (keyCode == LEFT && keyPressed == true)
    {
      if(x_bille>235-10 && x_bille<285+10 && y_bille>685-10 && y_bille<735+10 && y_bille>(-1*x_bille+970-5) && y_bille<(-1*x_bille+970+5))
      
      { if (mouvement_sur_y>0)
      {
        mouvement_sur_y = mouvement_sur_y *-1;
      }  
      if (mouvement_sur_y<0)
      {
        mouvement_sur_y = -10;
        delay(100);
        mouvement_sur_y = -2;
      }
  }
    }
    else
    {
      if(x_bille>235-10 && x_bille<285+10 && y_bille<760+10 && y_bille>735-10 && y_bille>(0.5*x_bille+617.5-5) && y_bille<(0.5*x_bille+617.5+5))
      {
        mouvement_sur_y = mouvement_sur_y *-1;
    }
    }
    }
    
      if (state==3) // Flipper droit
    {
    if (keyCode == RIGHT && keyPressed == true)
    {
      if(x_bille>375-10 && x_bille<425+10 && y_bille>685-10 && y_bille<735+10 && y_bille>(1*x_bille+310-5) && y_bille<(1*x_bille+310+5))
      
   
      {
        if (mouvement_sur_y>0)
      {
        mouvement_sur_y = mouvement_sur_y *-1;
      }  
      if (mouvement_sur_y<0)
      {
        mouvement_sur_y = -10;
        delay(100);
        mouvement_sur_y = -2;
      }
  }
    }
    else
    {
      if(x_bille>375-10 && x_bille<425+10 && y_bille<760+10 && y_bille>735-10 && y_bille>(-0.5*x_bille+947.5-5) && y_bille<(-0.5*x_bille+947.5+5))
      {
        mouvement_sur_y = mouvement_sur_y *-1;
    }
    }
    }
    
    
    
    
    
    
    if (x_bille<570+10 && x_bille>470-10 && y_bille<320+10 && y_bille>220-10 ) //bumper 2 violet
    { 
      
      if(mouvement_sur_x==0 || mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_x * -1;
      mouvement_sur_y = mouvement_sur_y * -1;
      }
      
       if(mouvement_sur_x>0 && mouvement_sur_y>0)
      {
          if(y_bille>220 && x_bille<470)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
          if(mouvement_sur_x>0 && mouvement_sur_y<0)
      {
          if(y_bille<320 && x_bille<470)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
          if(mouvement_sur_x<0 && mouvement_sur_y>0)
      {
          if(y_bille<220 && x_bille<570)
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        }
          if(mouvement_sur_x<0 && mouvement_sur_y<0)
      {
          if(y_bille<320 && x_bille>570)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
        score = score + 250;
        N2=0;
        
        etoile2();
    }
    
    
     
    
    if (x_bille<400+10 && x_bille>300-10 && y_bille<320+10 && y_bille>220-10 ) // bumper 1 bleu
    { 

      if(mouvement_sur_x==0 || mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_x * -1;
      mouvement_sur_y = mouvement_sur_y * -1;
      }
       if(mouvement_sur_x>0 && mouvement_sur_y>0)
      {
          if(y_bille>220 && x_bille<300)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
          if(mouvement_sur_x>0 && mouvement_sur_y<0)
      {
          if(y_bille<320 && x_bille<300 )
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
          if(mouvement_sur_x<0 && mouvement_sur_y>0)
      {
          if(y_bille<220 && x_bille<400)
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        }
          if(mouvement_sur_x<0 && mouvement_sur_y<0)
      {
          if(y_bille<320 && x_bille>400)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
        score = score + 150;
        N1=0;
        etoile1();
    }
     
     
     
     
 
     
     if (x_bille<485+10 && x_bille>385-10 && y_bille<440+10 && y_bille>340-10 ) // bumper 3 rose
    { 
  
      if(mouvement_sur_x==0 || mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_x * -1;
      mouvement_sur_y = mouvement_sur_y * -1;
      }
       if(mouvement_sur_x>0 && mouvement_sur_y>0)
      {
          if(y_bille>340 && x_bille<385)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
          if(mouvement_sur_x>0 && mouvement_sur_y<0)
      {
          if(y_bille<440 && x_bille<385)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
          if(mouvement_sur_x<0 && mouvement_sur_y>0)
      {
          if(y_bille<340 && x_bille<485)
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        }
          if(mouvement_sur_x<0 && mouvement_sur_y<0)
      {
          if(y_bille<440 && x_bille>485)
        {mouvement_sur_x = mouvement_sur_x * -1;
        mouvement_sur_y = mouvement_sur_y * 1;
        }
        else
        {mouvement_sur_x = mouvement_sur_x * 1;
        mouvement_sur_y = mouvement_sur_y * -1;
        }
        }
        score = score + 200;
        N3=0;
        etoile3();
    }
    
    
    
    
   
    
if(x_bille<=680 && x_bille>=630 && y_bille>=20 && y_bille<=70 && y_bille>(x_bille-630-5) && y_bille<(x_bille-630+5)) // ligne en haut à droite
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
     if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x*-1;
     }
      if(mouvement_sur_y<0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
}
     
     
   
           
            
 if (y_bille<=850 && y_bille>=100 ) //couloir de lancer
 {
   if ( x_bille<655 &&x_bille>645  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
 }
 
 
  
    if (y_bille<=675 && y_bille>=550 ) //triangle en bas à gauche
 {
   if ((x_bille > 120+8 && x_bille<120+12) || (x_bille < 120-8 && x_bille>120-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
 }

 if(x_bille<=230 && x_bille>=70 && y_bille>=700 && y_bille<=785 && y_bille>(0.53125*x_bille+662.8125-5) && y_bille<(0.53125*x_bille+662.8125+5)) // ligne en bas à droite
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
     
     if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x*-1;
     }
      if(mouvement_sur_y<0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}



 if(x_bille<=600 && x_bille>=440 && y_bille>=700 && y_bille<=785 && y_bille<=(-0.53125*x_bille+1018.75+5) && y_bille>=(-0.53125*x_bille+1018.75-5)) // ligne en bas à gauche
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
     if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y<0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}




 if(x_bille<=280 && x_bille>=20 && y_bille>=750 && y_bille<=850 && y_bille<=(0.384615*x_bille+742.3+5) && y_bille>=(0.384615*x_bille+742.3-5)) // ligne  du triangle en bas à gauche
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}



 if(x_bille<=650 && x_bille>=380 && y_bille>=750 && y_bille<=850 && y_bille<=(-0.37037*x_bille+990.74+5) && y_bille>=(-0.37037*x_bille+990.74-5)) // ligne du triangle en bas à droite
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}



 if(x_bille<=650 && x_bille>=600 && y_bille>=415 && y_bille<=475 && y_bille<=(-1.2*x_bille+1195+5) && y_bille>=(-1.2*x_bille+1195-5)) // rampe milieu droite
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}



 if(x_bille<=70 && x_bille>=20 && y_bille>=415 && y_bille<=475 && y_bille<=(1.2*x_bille+393) && y_bille>=(1.2*x_bille+391-5)) // rampe milieu gauche
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}



 if (y_bille<=700 && y_bille>=550 ) //couloir de lancer
 {
   if ((x_bille > 600+8 && x_bille<600+12) || (x_bille < 600-8 && x_bille>600-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
 }
 
  
  if (y_bille<=675 && y_bille>=550 ) //triangle en bas à droite
 {
   if ((x_bille > 550+8 && x_bille<550+12) || (x_bille < 550-8 && x_bille>550-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
 }


 if(x_bille<=550 && x_bille>=425 && y_bille>=675 && y_bille<=735 && y_bille<=(-0.48*x_bille+939+5) && y_bille>=(-0.48*x_bille+939-5)) // triangle bas droite
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
     
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}



  
  if (y_bille<=700 && y_bille>=550 ) //rampe basdroite flipper
 {
   if ((x_bille > 600+8 && x_bille<600+12) || (x_bille < 600-8 && x_bille>600-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
 }
 
 
   if (y_bille<=700 && y_bille>=550 ) //rampe basdroite flipper
 {
   if ((x_bille > 70+8 && x_bille<70+12) || (x_bille < 70-8 && x_bille>70-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
    }
 }

 

if(x_bille>285 && x_bille<315 && y_bille<100 && y_bille>90)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}
if(x_bille>285 && x_bille<315 && y_bille<175 && y_bille>165)
{
    mouvement_sur_y=mouvement_sur_y*-1;
 }
   if (y_bille<=170 && y_bille>=95 ) //couloir 1
 {
   if ((x_bille > 285+8 && x_bille<285+12) || (x_bille < 285-8 && x_bille>285-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }
    if (y_bille<=170 && y_bille>=95 ) //couloir 1
 {
   if ((x_bille > 315+8 && x_bille<315+12) || (x_bille < 315-8 && x_bille>315-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }
if(x_bille>365 && x_bille<395 && y_bille<100 && y_bille>90)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}
if(x_bille>365 && x_bille<395 && y_bille<175 && y_bille>165)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}

   if (y_bille<=170 && y_bille>=95 ) //couloir 2
 {
   if ((x_bille > 365+8 && x_bille<365+12) || (x_bille < 365-8 && x_bille>365-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }
    if (y_bille<=170 && y_bille>=95 ) //couloir 2
 {
   if ((x_bille > 395+8 && x_bille<395+12) || (x_bille < 395-8 && x_bille>395-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }

if(x_bille>445 && x_bille<475 && y_bille<100 && y_bille>90)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}
if(x_bille>445 && x_bille<475 && y_bille<175 && y_bille>165)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}
   if (y_bille<=170 && y_bille>=95 ) //couloir 3
 {
   if ((x_bille > 445+8 && x_bille<445+12) || (x_bille < 445-8 && x_bille>445-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }
    if (y_bille<=170 && y_bille>=95 ) //couloir 3
 {
   if ((x_bille > 475+8 && x_bille<475+12) || (x_bille < 475-8 && x_bille>475-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }

if(x_bille>525 && x_bille<555 && y_bille<100 && y_bille>90)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}
if(x_bille>525 && x_bille<555 && y_bille<175 && y_bille>165)
{
    mouvement_sur_y=mouvement_sur_y*-1;
}
 
    if (y_bille<=170 && y_bille>=95 ) //couloir 4
 {
   if ((x_bille > 525+8 && x_bille<525+12) || (x_bille < 525-8 && x_bille>525-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }
    if (y_bille<=170 && y_bille>=95 ) //couloir 4
 {
   if ((x_bille > 555+8 && x_bille<555+12) || (x_bille < 555-8 && x_bille>555-12)  ) 
     {
      mouvement_sur_x = mouvement_sur_x * -1;
      score = score + 100;
    }
 }
 

if (x_bille>60 && x_bille<140 && y_bille>310 && y_bille<390) // trou noir
{ 
  x_bille=600;
  y_bille=370;
  score = score + 50; 
}


 if(x_bille<=230 && x_bille>=70 && y_bille>=550 && y_bille<=785 && y_bille>(1.46875*x_bille+ 447.1875-5) && y_bille<(1.46875*x_bille+ 447.1875+5)) // rampe milieu gauche
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}
if(x_bille<=230 && x_bille>=70 && y_bille>=700 && y_bille<=785 && y_bille>(0.53125*x_bille+ 662.8125-5) && y_bille<(0.53125*x_bille+ 662.8125+5)) // triangle un peu bas gauche
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
     if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x*-1;
     }
      if(mouvement_sur_y<0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
}
 if(x_bille<=600 && x_bille>=440 && y_bille>=700 && y_bille<=785 && y_bille<=(-0.53125*x_bille+551.25+5) && y_bille>=(-0.53125*x_bille+551.25-5)) // triangle un peu bas droite
{
  if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}

if(x_bille<=600 && x_bille>=440 && y_bille>=550 && y_bille<=785 && y_bille>(-1.46875*x_bille+ 1431.25-5) && y_bille<(-1.46875*x_bille+ 1431.25+5)) // triangle un peu bas droite
{
   if(mouvement_sur_y==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      if(mouvement_sur_x==0 )
      {
      mouvement_sur_x = mouvement_sur_y;
      mouvement_sur_y = mouvement_sur_x;
      }
      
       if(mouvement_sur_y<0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x<0)
     {
       mouvement_sur_x=mouvement_sur_y*-1;
       mouvement_sur_y=mouvement_sur_x;
     }
      if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
       if(mouvement_sur_y>0 && mouvement_sur_x>0)
     {
       mouvement_sur_x=mouvement_sur_y;
       mouvement_sur_y=mouvement_sur_x;
     }
}
     
}
}




void keyPressed()       //Définit la variable state suivant l'état
{                       //et le menu dans lequel se trouve l'utilisateur
  if (state == 0) //Possibilités lorsque le menu principal est affiché
 
  {
    if (keyCode == ENTER) //Appui sur entrée 
    {
      state = 2;          //Affiche le menu de personnalisation
    }
    else if (key == ' ')  //Appui sur espace 
    {
      state=1;            //Affiche le menu des records
    }
    else                  //Pour n'importe quelle autre touche appuyée
    {
      state= 0;           //Laisse le menu principal affiché
    }
  } 

  if (state == 1) //Possibilités lorsque le menu des records est affiché
    {
      if(keyCode == ENTER) //Appui sur entrée
      {
        state =  0;  //Affiche le menu principal
      }
      else          //Pour n'importe quelle autre touche appuyée
      {
        state = 1;  //Laisse le menu des records affiché
      }
    }
  
  if (state == 2)  //Possibilités lorsque le menu de personnalisation est affiché
  
if (keyCode == BACKSPACE) //Appui sur retour arrière
  {
    Nom = "";             //Réinitialise le nom d'utilisateur
    n=0;
  }
  else if(keyCode == CONTROL)  //Appui sur control
    {
      state =  0;               //Affiche le menu principal
    }
      else if (keyCode == UP)     //Appui sur la flèche du haut
      {
        couleur = color(255,0,0);        //
      }
      else if (keyCode == RIGHT)  //Appui sur la flèche de droite
      {
        couleur = color(0,255,0);
      }
      else if (keyCode == DOWN)   //Appui sur la flèche du bas
      {
        couleur = color(0,0,255);
      }
      else if (keyCode == LEFT)   //Appui sur la flèche de gauche
      {
        couleur = color(255,255,0);
      }
     else if (keyPressed == true && key != CODED  && key != ENTER && key != TAB && key != DELETE && n<10) //Appui sur un caractère non spécial
  { 
    Nom = Nom + key;         //Ajoute la caractère à la variable nom pour créer le nom d'utilisateur
    n=n+1;
    }
else if(keyCode == ENTER && n>1) //Appui sur entrée après la rentrée d'un nom d'utilisateur
    {
      n = 11;                   
      state = 3;          //Affiche le jeu
    }
else
{
  state = 2;
}
 
  
if (state == 3)
{
  if(key == 'p') //Appui sur la touche p
  {
   state = 4;    //Affiche le menu pause
  }
  else           //Pour n'importe quelle autre touche appuyée
  {
    state = 3;   //Laisse le jeu affiché
  }
}
if (state == 4)
{
  if (keyCode == ENTER) //Appui sur entrée
  {
    state = 3;          //Affiche le jeu
  }
  else if (keyCode == CONTROL) //Appui sur control
  {
    state = 0;            //Affiche le menu principal
  }
  else                    //Pour n'importe quelle autre touche appuyée
  {
    state = 4;            //Laisse le menu pause affiché
  }
}

if (state == 5) 
{
    if(score > r10 && score <= r9)
  {
    Nom = j;
    score = r10;
  }
   else if(score > r9 && score <= r8)
  {
    
    j=i;
    r10=r9;
    Nom = i;
    score = r9;
  }
   else if(score > r8 && score <= r7)
  {
    
    j=i;
    r10=r9;
    i=h;
    r9=r8;
    Nom = h;
    score = r8;
  }
   else if(score > r7 && score <= r6)
  {

    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    Nom = g;
    score = r7;
  }
   else if(score > r6 && score <= r5)
  {

    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    g=f;
    r7=r6;
    Nom = f;
    score = r6;
  }
   else if(score > r5 && score <= r4)
  {

    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    g=f;
    r7=r6;
    f=e;
    Nom = e;
    score = r5;
  }
   else if(score > r4 && score <= r3)
  {
    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    g=f;
    r7=r6;
    f=e;
    r6=r5;
    e=d;
    Nom = d;
    score = r4;
  }
   else if(score > r3 && score <= r2)
  {
    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    g=f;
    r7=r6;
    f=e;
    r6=r5;
    e=d;
    r5=r4;
    d=c;
    Nom = c;
    score = r3;
  }
   else if(score > r2 && score <= r1)
  {
    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    g=f;
    r7=r6;
    f=e;
    r6=r5;
    e=d;
    r5=r4;
    d=c;
    r4=r3;
    c=b;
    Nom = b;
    score = r2;
  }
   else if(score > r1)
  {
    j=i;
    r10=r9;
    i=h;
    r9=r8;
    h=g;
    r8=r7;
    g=f;
    r7=r6;
    f=e;
    r6=r5;
    e=d;
    r5=r4;
    d=c;
    r4=r3;
    c=b;
    r3=r2;
    b=a;
    Nom = a;
    score = r1;
  }
  if (keyCode == ENTER)
  {
    state = 0;
  }
  else
  {
    state = 5;
  }
  
  Name.flush();
  Points.flush();
  Name.close();
  Points.close();
}
}