void etoile1(){
   


pushMatrix();
strokeWeight(2);// epaisseur des traits
translate(350,270);//déplacement de l'origine au centre de l'étoile1
fill(#FFFF00);  
rotate(radians(N1*PI));//rotation en fonction de N1
 beginShape();//étoile 1
   vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();


  
}