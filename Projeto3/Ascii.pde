int intervalo = 8;    //Define o valor de intervalo entre as letras
void Ascii(){

char t = ' ';
  for(int y = 0; y < Upscaled.height; y+= intervalo){  //Para cada coluna leia a linha
    for(int x = 0; x < Upscaled.width; x+= intervalo){  //e para cada linha
      int loc = x + y * Upscaled.width; // Index
     
      color c = Upscaled.pixels[loc];  //Brilho é baseado nos pixels da imagem com a qualidade reduzida
      float r = red (Upscaled.pixels[loc]);   //Captura as cores relacionadas aos pixels
      float g = green (Upscaled.pixels[loc]); 
      float b = blue (Upscaled.pixels[loc]);  
      float l = brightness(c);
      int sombra = int(map(l, 0, 255, 0, 9)); //Associa o Brilho a 10 valores proporcionais
       
      if (sombra == 0) t = ' ';
      if (sombra == 1) t = '.';
      if (sombra == 2) t = ';';
      if (sombra == 3) t = 'c';
      if (sombra == 4) t = 'o';
      if (sombra == 5) t = 'P';
      if (sombra == 6) t = 'O';
      if (sombra == 7) t = '?';
      if (sombra == 8) t = '@';
      if (sombra == 9) t = '■';
   
     tinta(r,g,b);  // define a cor do texto

      noStroke();
      text(t, x +intervalo, y+intervalo); //Coloca o texto baseado nesse valor de 0 a 9
      
    }
  }
}

void tinta(float r1, float g1, float b1){
 switch (m){
      case 0:
        fill(r1,g1,b1);  //Pinta o texto com a cor do pixel que está por baixo
      break;
      case 1:
        fill(255,0,0);  //Pinta o texto com de vermelho
      break;
      case 2:
        fill(0,255,0);  //Pinta o texto com de verde
      break;
      case 3:
        fill(0,0,255);  //Pinta o texto com de azul
      break;
      case 4:
        fill(255,255,0);  //Pinta o texto com de amarelo
      break;
      case 5:
        fill(255,0,255);  //Pinta o texto com de rosa
      break;
      case 6:
        fill(0,255,255);  //Pinta o texto com de ciano
      break;
      case 7:
        fill(255,255,255);  //Pinta o texto com de branco
      break;
      case 8:
        fill(0,g1,b1);  //Pinta o texto com a cor do pixel que está por baixo menos vermelho
      break;
      case 9:
        fill(r1,0,b1);  //Pinta o texto com a cor do pixel que está por baixo menos verde
      break;
      case 10:
        fill(r1,g1,0);  //Pinta o texto com a cor do pixel que está por baixo menos azul
      break;
      }
}
