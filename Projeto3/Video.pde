// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= **
//                                                   PLANO DE VOO:                                                     \\
//                                                                                                                     \\
//  [X] > Downscale no video pra um pixel ficar do tamanho do texto na imagem;                                         \\
//  [X] > Filtro Ascii;                                                                                                \\ 
//  [X] > Trazer a cor de volta utilizando um multiply da cor base no branco do texto;                                 \\
//  [X] > Comentar e explicar o codigo;                                                                                \\
//                                                                                                                     \\
// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= **

import processing.video.*;   //  Biblioteca para mexer com a camera
PGraphics Downscaled, Upscaled;   // Canvas diferentes

int n = 0;
int m = 0;

Capture stream;
boolean pausa = false;


void setup() {  
  size(1280 , 720);  
  stream = new Capture (this, 1280, 720);
  stream.start();
   background(0);
   Downscaled = createGraphics (1280,720);  // Criação de diferentes telas para o filtro funcionar dentro dela
   Upscaled = createGraphics (1280,720);
}

void captureEvent(Capture stream){
  stream.read();  
}

void draw() {
 background(0);
 switch (n){
   case 0:
     downscaleScript();  
     upscaleScript();  //Reduz a qualidade da imagem, assim 1 pixel na qualidade reduzida fica do tamanho de uma letra (8x8)
     Ascii(); //Passa o filtro de Ascii por cima da imagem
   break;
   case 1:
     downscaleScript();  
     upscaleScript();
     image(Upscaled, 0, 0);
   break;
   case 2:
     image(stream, 0, 0);
   break;
 }
}


void keyPressed(){
  switch (key){
    case 'p':  //Pausa a stream com P
      if(pausa) stream.start();
      if(!pausa) stream.stop();
      pausa = !pausa;
    break;
    
    case 'n':  //Vai tirando os filtros
      n++;
      if (n > 2) n = 0;
    break;
    
    case 'm':  //Troca a cor de filtro do texto
      m++;
      if (m > 9) m = 0;
      println(m);
    break;
  }
}
