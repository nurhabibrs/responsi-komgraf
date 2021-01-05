class makeStarfield { //class untuk membuat Starfield
  //inisialisasi global variabel x, y, dan z
  float x;
  float y;
  float z;
  makeStarfield() { //construtor method untuk kelas makeStarfield
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }
  
  void update() { //method update untuk menambah banyaknya bintang dan mengatur pergerakan bintang
    z -= tSpeed;
    if(z < 1){
      z = width;
      x = random(-width, width);
      y = random(-height, height);
    }
  }
  
  void show() { //method untuk menampilkan starfield
    fill(255);
    float a = map(x/z, 0, 1, 0, width);
    float b = map(y/z, 0, 1, 0, height);
    stroke(255);
    strokeWeight(3);
    point(a, b);
  }
}
