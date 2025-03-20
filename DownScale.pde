

void downscaleScript(){   // Script feito para diminuir a resolução da imagem por 8
  Downscaled.beginDraw();
    Downscaled.pushMatrix();
     Downscaled.scale (0.125);  //Aqui dentro ele diminui a escala por 8
     Downscaled.image (stream, 0, 0);  // Desenha a Stream na tela reduzida
    Downscaled.popMatrix();  
   Downscaled.endDraw();
}

void upscaleScript(){  // Script feito para voltar a escala para 1280 x 720 com a resolução reduzida
 Upscaled.beginDraw();  //a compressão do video faz com que onde numa area que eram 8x8 pixeis vire só uma coisa
   Upscaled.pushMatrix();
     Upscaled.scale (8);  //Aqui dentro ele retorna a escala para o normal
     Upscaled.image(Downscaled,0,0); //Desenha a Stream na tela padrão
   Upscaled.popMatrix();
 Upscaled.endDraw();
}
