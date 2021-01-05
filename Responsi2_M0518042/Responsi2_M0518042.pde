float orbit; //inisialisasi variabel orbit untuk wadah rotasi planet
PImage sunTexture, red, yellow, blue; //variabel bertipe PImage untuk menyimpan gambar
PShape sun, rPlanet, yPlanet, bPlanet; //variable bertipe PShape untuk menyimpan bentuk 3D

void setup(){
  size(600,600,P3D); //inisialisasi layar berukuran 600 dikali 600 dan menjalankan rendering P3D
  smooth(); //mengaktifkan anti-aliasing
  
  //mengambil gambar yang telah disiapkan
  sunTexture = loadImage("gambar/orange.jpg");
  red = loadImage("gambar/red.jpg");
  yellow = loadImage("gambar/yellow.jpg");
  blue = loadImage("gambar/blue.jpg");
  
  //membuat bentuk matahari dengan dengan ukuran 50 px berbentuk SPHERE dan grid dihilangkan
  sun = createShape(SPHERE, 50);
  sun.setTexture(sunTexture);
  sun.setStroke(0);
  
  //membuat bentuk planet merah dengan dengan ukuran 15 px berbentuk SPHERE dan grid dihilangkan
  rPlanet = createShape(SPHERE, 15);
  rPlanet.setTexture(red);
  rPlanet.setStroke(0);
  
  //membuat bentuk planet kuning dengan dengan ukuran 15 px berbentuk SPHERE dan grid dihilangkan
  yPlanet = createShape(SPHERE, 15);
  yPlanet.setTexture(yellow);
  yPlanet.setStroke(0);
  
  //membuat bentuk planet biru dengan dengan ukuran 15 px berbentuk SPHERE dan grid dihilangkan
  bPlanet = createShape(SPHERE, 15);
  bPlanet.setTexture(blue);
  bPlanet.setStroke(0);
}

void draw(){
  
  pointLight(255, 255, 255, width/2, height/2, 150); //menjalankan pencahayaan pointLight berwarna putih pada koordinat x = width/2, y = height/2, dan z = 150
  background(0); //memberi warna background hitam
  orbit+=1; //increment orbit
  
  translate(width/2,height/2, 0); //menggeser objek dengan pertambahan koordinat (width/2, height/2, 0)
  shape(sun); //membuat bentuk matahari
  
  //Membuat bentuk planet merah dan digeser dengan pertambahan koordinat (150, 0, 0) dari (width/2, height/2, 0) dan merotasikan pada poros Y dengan nilai orbit/100
  pushMatrix();
  rotateY(orbit/100);
  translate(150, 0, 0); 
  shape(rPlanet);
  popMatrix();
  
  
  //Membuat bentuk planet kuning dan digeser dengan pertambahan koordinat (250, 0, 50) dari (width/2, height/2, 0) dan merotasikan pada poros Y dengan nilai -orbit/100
  pushMatrix();
  rotateY(-orbit/100);
  translate(250, 0, 50);
  shape(yPlanet);
  popMatrix();
  
  //Membuat bentuk planet biru dan digeser dengan pertambahan koordinat (350, 0, 100) dari (width/2, height/2, 0) dan merotasikan pada poros Y dengan nilai orbit/80
  pushMatrix();
  rotateY(orbit/80);
  translate(350, 0, 100);
  shape(bPlanet);
  popMatrix();
}
