makeStarfield[] stars = new makeStarfield[750]; //memanggil class makeStarfield
float tSpeed; //inisialisasi variabel global tSpeed bertipe float digunakan untuk mengatur kecepatan gerak starfield

void setup(){ //fungsi untuk menjalankan sekali
  size(1000, 700); //inisialisasi ukuran layar 1000 px x 700 px
  for(int i = 0; i < (stars.length); i++) { //perulangan untuk memunculkan objek starfield pertama kali sampai panjang dari array stars 
    stars[i] = new makeStarfield(); //objek baru disimpan dalam array stars
  }
}

void draw(){ //digunakan untuk infinity looping
  background(0); //background berwarna hitam
  smooth(); //menambahkan anti aliasing
  float distance = dist(mouseX, mouseY, (width-mouseX), (height-mouseY)); //variabel distance sebagai wadah jarak antara (mouseX, mouseY) dengan (width-mouseX, height-mouseY) 
  float xscaling = map(distance, 0, width, 0.7, 0.02); //mengkonversikan nilai dari variabel distance dalam rentang bilangan lain
  tSpeed = map(distance, 0, width, 0, 50); //mengkonversikan nilai dari variabel tSpeed dalam rentang bilangan lain
  
  //memunculkan starfield dari titik geser width/2, height/2
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < (stars.length); i++) {
    stars[i].update();
    stars[i].show();
  }
  popMatrix();
  
  pushMatrix();
  noStroke();
  translate((width-mouseX), (height-mouseY)); //mentranslasikan dengan arah mouse yang terbalik sehingga objek menjauh berlawanan arah ketika pointer mouse digeser ke kanan kiri atau atas bawah 
  scale(xscaling); //membuat objek semakin kecil apabila jauh dari pointer mouse sesuai dengan nilai variabel xscaling
    
    //membuat segi tujuh 7 buah, bentuk ditengah bintang segi delapan, pengaturan pergerakan memutarnya akan semakin cepat jika menjauh dari pointer mouse serta selang-seling rotasinya, dan pemberian warna
    pushMatrix();
    fill(148, 0, 211);
    rotate(frameCount/(xscaling*25));
    polygon(0, 0, 180, 7);
    popMatrix();
    
    pushMatrix();
    fill(75, 0, 130);
    rotate(-frameCount/(xscaling*25));
    polygon(0, 0, 160, 7);
    popMatrix();
    
    pushMatrix();
    fill(0, 0, 255);
    rotate(frameCount/(xscaling*25));
    polygon(0, 0, 140, 7);
    popMatrix();
  
    pushMatrix();
    fill(0,255,0);
    rotate(-frameCount/(xscaling*25));
    polygon(0, 0, 120, 7);
    popMatrix();
  
    pushMatrix();
    fill(255,255,0);
    rotate(frameCount/(xscaling*25));
    polygon(0, 0, 100, 7);
    popMatrix();
  
    pushMatrix();
    fill(255,127,0);
    rotate(-frameCount/(xscaling*25));
    polygon(0, 0, 80, 7);
    popMatrix();
    
    pushMatrix();
    fill(255,0,0);
    rotate(frameCount/(xscaling*25));
    polygon(0, 0, 60, 7);
    popMatrix();
  
    pushMatrix();
    fill(255, 0, 127);
    rotate(-frameCount/(xscaling*20));
    star(0, 0, 40, 30, 8);
    popMatrix();
  popMatrix();
} 

void polygon(float x, float y, float rad, int xpoints){ //fungsi untuk membuat bentuk polygon
  float angle = TWO_PI/xpoints;
  beginShape();
  for(float a = 0; a < TWO_PI; a+=angle){
    float sx = x + cos(a) * rad;
    float sy = y + sin(a) * rad;
    vertex(sx, sy);
  }
  endShape();
}

void star(float x, float y, float radius1, float radius2, int xpoints) { //fungsi untuk membuat bentuk bintang
  float angle = TWO_PI/xpoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
