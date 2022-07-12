PImage Mapa1, Mapa2, Regina, ReginaParada, ReginaFrente, ReginaCostas, ReginaEsquerdo, 
ReginaDireito, IdCard, EscondeItem1, Item, IconIdCard, LifeImage, DinoRegion1, 
DinoRegion2, DinoRegion3, DinoRegion4, GameOver;
PFont font;

int posX = 334; // POSIÇÃO X DA PERSONAGEM
int posY = 130; // POSIÇÃO Y DA PERSONAGEM

int initialPosX = 334; // POSIÇÃO X INICIAL DA PERSONAGEM
int initialPosY = 130; // POSIÇÃO Y INICIAL DA PERSONAGEM

int totalLifes = 4; // TOTAL DE VIDAS DA PERSONAGEM

int posBalaX = posX;
int posBalaY = posY;
int atira = 0;

int pose = 0; // CHECA PRA MOSTRAR DE QUE LADO A REGINA TA POSICIONADA
int pegaItem = 0; // CHECA PRA SABER SE O ITEM FOI RESGATADO

//VARIAVEIS QUE CONTROLAM SE OS DINOSSAUROS ESTAO APARECENDO OU JA MORRERAM
boolean existsDino1 = true;
boolean existsDino2 = true;
boolean existsDino3 = true;
boolean existsDino4 = true;

boolean canCountDino1 = true;
boolean canCountDino2 = true;
boolean canCountDino3 = true;
boolean canCountDino4 = true;
boolean canCountItem = false;
int timesToCountItem = 0;

int pontos = 0;

boolean isFase1 = true;
boolean isFase2 = true;

boolean clickTryAgain = false;
boolean clickEnd = false;

void draw() {
  criaMundo();
  showLifes();
  CreateDinos();
  Item1(735, 167, 0);
  Atira();
  Regina();
  ReginaDied();
  showPonctuation();
  CheckTotalPoints();
  GoToFase2();
  GameOver();
  checkClickGameOverButtons(mouseX, mouseY);
}

void setup() {
  size (1280, 720);  
}

void GameOver() {
  if (totalLifes == 0) {
    background(0);
    GameOver = loadImage("TELA_GAMEOVER.png");
    image(GameOver, 0, 0);
    font = loadFont("DePixel-Breit-48.vlw");
    textFont(font, 60);
    fill(#9C2020);
    text("GAME OVER", 420, 350);
    
    fill(#3e3e3e);
    noStroke();
    rect(470, 420, 360, 40);    
    rect(590, 465, 110, 40);
    
    fill(255);
    textFont(font, 30);
    text("TENTAR DE NOVO", 480, 450);
    
    text("SAIR", 600, 500);
    checkClickGameOverButtons(mouseX, mouseY);
  }
}

void checkClickGameOverButtons(int x, int y) {
  if (x >= 470 && x <= 830 && y >= 420 && y <= 460) {
    clickTryAgain = true;
    clickEnd = false;
  } else if ( x >= 590 && x <= 700 && y >= 465 && y <= 505 ) {
    clickEnd = true;
    clickTryAgain = false;
  } else {
    clickTryAgain = clickEnd = false;
  }
}

void mousePressed() {
  if (clickTryAgain) {
    isFase1 = true;
    isFase2 = false;
    totalLifes = 4;
    pontos = 0;
  }
  if (clickEnd) {
    exit();
  }
}

void showPonctuation() {
  font = loadFont("DePixel-Breit-48.vlw");
  textFont(font, 38);
  fill(#E8E85C);
  text(pontos, 600, 60);
}

// MAPA1
void criaMundo() {
  if (isFase1) {
    background(0);
    Mapa1 = loadImage("MAPA1.png");
    image(Mapa1, 0, 0);
  }
}

//EXIBIR CONTADOR DE VIDAS
void showLifes() {
  LifeImage = loadImage("ICON-REGINA.png");
  int initialX = 280;
  for (int i = 0; i < totalLifes; i++) {
    image(LifeImage, initialX, 25);
    initialX = initialX + 50;    
  }  
}

void CheckTotalPoints() {  
  if (!existsDino1 && canCountDino1) {
    pontos = pontos + 10;
    canCountDino1 = false;
  }
  
  if (!existsDino2 && canCountDino2) {    
    pontos = pontos + 10;
    canCountDino2 = false;
  }
  
  if (!existsDino3 && canCountDino3) {
    pontos = pontos + 10;
    canCountDino3 = false;
  }
  
  if (!existsDino4 && canCountDino4) {
    pontos = pontos + 10;
    canCountDino4 = false;
  } 
  
  if (canCountItem && timesToCountItem == 1) {
    pontos = pontos + 20;
    canCountItem = false;
  } 
}

void CreateDinos() {
  if (existsDino1) {
    DinoRegion1 = loadImage("DINO-COSTAS.png"); 
    image(DinoRegion1, 400, 275);
  }
  
  if (existsDino2) {    
    DinoRegion2 = loadImage("DINO-ESQUERDA.png"); 
    image(DinoRegion2, 510, 610);
  }
  
  if (existsDino3) {
    DinoRegion3 = loadImage("DINO-FRENTE.png"); 
    image(DinoRegion3, 660, 370);
  }
  
  if (existsDino4) {
    DinoRegion4 = loadImage("DINO-COSTAS.png"); 
    image(DinoRegion4, 850, 380);
  }  
}

void ReginaDied() {
  if(existsDino1 && posX >= 365 && posX <= 468 && posY >= 205 && posY <= 350) {
    println("Regina Morreu");
    posX = initialPosX;
    posY = initialPosY;
    if (totalLifes > 0) {
      totalLifes--;
    }
  }
  
  if(existsDino2 && posX >= 459 && posX <= 559 && posY >= 585 && posY <= 625) {
    println("Regina Morreu");
    posX = initialPosX;
    posY = initialPosY;
    if (totalLifes > 0) {
      totalLifes--;
    }
  }

    if(existsDino3 && posX >= 649 && posX <= 690 && posY >= 345 && posY <= 445) {
    println("Regina Morreu");
    posX = initialPosX;
    posY = initialPosY;
    if (totalLifes > 0) {
      totalLifes--;
    }
  }
  
  if(existsDino4 && (posX >= 844 && posX <= 874 && posY >= 305) || (posX >= 824 && posX <= 839 && posY >= 330)) {
    println("Regina Morreu");
    posX = initialPosX;
    posY = initialPosY;
    if (totalLifes > 0) {
      totalLifes--;
    }
  }

}

//PERSONAGEM REGINA
void Regina() {

  ReginaParada = loadImage("REG-PARADA.png");
  ReginaFrente = loadImage("REG-FRENTE.png");
  ReginaCostas = loadImage("REG-COSTAS.png");
  ReginaEsquerdo = loadImage("REG-ESQUERDO.png");
  ReginaDireito = loadImage("REG-DIREITO.png");

// MOVIMENTAÇÃO DA PERSONAGEM E TROCA DE FRAME
  if ((keyPressed) && (keyCode == RIGHT)) {
    CheckMovementToRight();
  } 
  if ((keyPressed) && (keyCode == LEFT)) {
    CheckMovementToLeft();
  } 
  if ((keyPressed) && (keyCode == UP)) {
    CheckMovementToUp();
  } 
  if ((keyPressed) && (keyCode == DOWN)) {
    CheckMovementToDown();
  } 
  // AQUI É PRA DEIXAR FIXA A IMAGEM DA PERSONAGEM DIRECIONADA PRA UM DOS LADOS
  switch (pose) {
  case 0:
    image(ReginaParada, posX, posY);
    break;
  case 1:
    image(ReginaDireito, posX, posY);
    break;
  case 2:
    image(ReginaEsquerdo, posX, posY);
    break;
  case 3:
    image(ReginaCostas, posX, posY);
    break;
  case 4:
    image(ReginaFrente, posX, posY);
    break;
  }
}

// TENTATIVA FUSTRANTE DE FAZER A ARMA ATIRAR
void Atira() {
  if ((keyPressed) && (keyCode == SHIFT) && (pose == 0)) {
    for (int i = 0; i < 900; i ++) {
      circle (posX, posY + i, 10);
    }
  }
  if ((keyPressed) && (keyCode == SHIFT) && (pose == 1)) {
    for (int i = 0; i < 400; i ++) {
      int posCircleX = 0;
      int posCircleY = 0;
        
      posCircleX = (posX + 40) + i;
      posCircleY = posY + 30;
      circle (posCircleX, posCircleY, 10);
      //println("Pose 1 - posCircleX: " + posCircleX);
      //println("Pose 1 - posCircleY: " + posCircleY);
      
      if (posCircleX >= 365 && posCircleX <= 468 && posCircleY >= 205 && posCircleY <= 350) {
        existsDino1 = false;
        println("Morreu dino 1");
      }  

      if (posCircleX >= 499 && posCircleX <= 599 && posCircleY >= 615 && posCircleY <= 655) {
        existsDino2 = false;
        println("Morreu dino 2");
      }  
      
    }
  } 
  if ((keyPressed) && (keyCode == SHIFT) && (pose == 2)) {
    for (int i = 0; i < 900; i ++) {
      circle (posX - i, posY + 30, 10);
    }
  } 
  
  if ((keyPressed) && (keyCode == SHIFT) && (pose == 3)) {
    for (int i = 0; i < 400; i ++) {
      int posCircleX = 0;
      int posCircleY = 0;
        
      posCircleX = posX + 5;
      posCircleY = (posY + 30) - i;
      circle (posCircleX, posCircleY, 10);
      
      //println("Pose 3 - posCircleX: " + posCircleX);
      //println("Pose 3 - posCircleY: " + posCircleY);
      
      if (posCircleX >= 649 && posCircleX <= 690 && posCircleY >= 345 && posCircleY <= 445) {
        existsDino3 = false;
        println("Morreu dino 3");
      }
    }
  }  
  
  if ((keyPressed) && (keyCode == SHIFT) && (pose == 4)) {
  
    for (int i = 0; i < 400; i ++) {
      int posCircleX = 0;
      int posCircleY = 0;
        
      posCircleX = posX + 45;
      posCircleY = (posY + 30) + i;
      circle (posCircleX, posCircleY, 10);
      
      println("Pose 4 - posCircleX: " + posCircleX);
      println("Pose 4 - posCircleY: " + posCircleY);
      
      if ((posCircleX >= 889 && posCircleX <= 920 && posCircleY >= 335) || (posCircleX >= 870 && posCircleX <= 885 && posCircleY >= 360)) {
        existsDino4 = false;
        println("Morreu dino 4");
      }  
      
      if (posCircleX >= 365 && posCircleX <= 468 && posCircleY >= 205 && posCircleY <= 630) {
        existsDino1 = false;
        println("Morreu dino 1");
      }  

    }
  }
}

// ITEM 1
void Item1 (int x, int y, int tamanho) {

  IdCard = loadImage("ID-CARD.png");
  EscondeItem1 = loadImage("ESCONDE-ITEM1.png");
  IconIdCard = loadImage("ICON-IDCARD.png");

// ITEM SOME QUANDO ELA PASSA POR ESSAS COORDENADAS
  if ((posX >= 729) && (posY >= 114)) {
    pegaItem = 1;
    Item = EscondeItem1;
    image(EscondeItem1, x, y); // NA VERDADE NÃO SOME, É COLOCADA UMA IMAGEM POR CIMA ^^
    image (IconIdCard, 880, 35); // FAZ SURGIR O ÍCONE DE ITEM RESGATADO  
    canCountItem = true;
    timesToCountItem++;
  } else if (pegaItem == 1) {
    Item = EscondeItem1;
  } else {
    image(IdCard, x, y); // ITEM E POSIÇÃO DELE
  }

  //println("X = " + posX);
  //println("Y = " + posY);
  //println("tamanho = " + tamanho);
  //println("pega item = " + pegaItem);
}

void CheckMovementToRight() {
  //primeira parede
  if ((posX < 504 && posY <= 320)) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    //println("RIGHT 1 Regina X = " + posX);
    //println("RIGHT 1 Regina Y = " + posY);
  }
  
  //segunda parede 
  if (posY >=320 && posY <= 585 && posX >= 364 && posX < 430) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    //println("RIGHT 2 Regina X = " + posX);
    //println("RIGHT 2 Regina Y = " + posY);
  }
  
  //terceira parede
  if (posY >= 585 && posY <= 625 && posX < 704 && posX >= 369) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    //println("RIGHT 3 Regina X = " + posX);
    //println("RIGHT 3 Regina Y = " + posY);
  }
  
  //quarta parede
  if (posY >= 160 && posY <= 585 && posX < 704 && posX >= 630) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    //println("RIGHT 4 Regina X = " + posX);
    //println("RIGHT 4 Regina Y = " + posY);
  }
  
  //quinta parede
  if (posY <= 160 && posY >= 125 && posX >= 634 && posX < 890) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    //println("RIGHT 5 Regina X = " + posX);
    //println("RIGHT 5 Regina Y = " + posY);
  }
  
  //sexta parede
  if (posY > 160 && posY < 625 && posX >= 824 && posX <= 890) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    //println("RIGHT 6 Regina X = " + posX);
    //println("RIGHT 6 Regina Y = " + posY);
  }
  
  //setima parede
  if (posY > 585 && posY <= 625 && posX >= 824 && posX <= 950) {
    posX = posX + 5;
    pose = 1;
    Regina = ReginaDireito;
    image(Regina, posX, posY);
    println("RIGHT 7 Regina X = " + posX);
    println("RIGHT 7 Regina Y = " + posY);
  }    
}

void CheckMovementToLeft() {
  //primeira parede
    if ((posX > 290 && posX <= 504 && posY <= 320)) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 1 Regina X = " + posX);
    //println("LEFT 1 Regina Y = " + posY);
  }
  
  //segunda parede 
  if (posY >=350 && posY <= 625 && posX > 369 && posX < 435) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 2 Regina X = " + posX);
    //println("LEFT 2 Regina Y = " + posY);
  }
  
  //terceira parede 
  if (posY >=585 && posY <= 625 && posX > 369 && posX < 705) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 3 Regina X = " + posX);
    //println("LEFT 3 Regina Y = " + posY);
  }
    
  //quarta parede
  if (posY >= 160 && posY <= 610 && posX >= 640 && posX <= 704) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 4 Regina X = " + posX);
    //println("LEFT 4 Regina Y = " + posY);
  }
  
  //quinta parede
  if (posY >= 125 && posY <= 165 && posX >= 635 && posX < 895) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 5 Regina X = " + posX);
    //println("LEFT 5 Regina Y = " + posY);
  }
  
  //sexta parede
  if (posY > 160 && posY <= 625 && posX >= 827 && posX <= 894) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 6 Regina X = " + posX);
    //println("LEFT 6 Regina Y = " + posY);
  }
  
  //setima parede
  if (posY >= 585 && posY <= 625 && posX > 825 && posX <= 954) {
    posX = posX - 5;
    Regina = ReginaEsquerdo;
    pose = 2;
    image(Regina, posX, posY);
    //println("LEFT 7 Regina X = " + posX);
    //println("LEFT 7 Regina Y = " + posY);
  }    
}

void CheckMovementToUp() {
  //primeira parede
    if ((posX >= 289 && posX <= 504 && posY >= 130 && posY < 325)) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 1 Regina X = " + posX);
    //println("UP 1 Regina Y = " + posY);
  }
  
  //segunda parede 
  if (posY >=325 && posY <= 625 && posX >= 369 && posX < 435) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 2 Regina X = " + posX);
    //println("UP 2 Regina Y = " + posY);
  }
  
  //terceira parede 
  if (posY >=589 && posY <= 625 && posX >= 435 && posX < 634) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 3 Regina X = " + posX);
    //println("UP 3 Regina Y = " + posY);
  }
    
  //quarta parede
  if (posY > 130 && posY <= 625 && posX >= 640 && posX <= 704) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 4 Regina X = " + posX);
    //println("UP 4 Regina Y = " + posY);
  }
  
  //quinta parede
  if (posY > 125 && posY <= 165 && posX >= 694 && posX < 895) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 5 Regina X = " + posX);
    //println("UP 5 Regina Y = " + posY);
  }
  
  //sexta parede
  if (posY > 160 && posY <= 625 && posX >= 824 && posX <= 894) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 6 Regina X = " + posX);
    //println("UP 6 Regina Y = " + posY);
  }
  
  //setima parede
  if (posY >= 585 && posY <= 625 && posX > 884 && posX <= 954) {
    posY = posY - 5;
    pose = 3;
    Regina = ReginaCostas;
    image(Regina, posX, posY);
    //println("UP 7 Regina X = " + posX);
    //println("UP 7 Regina Y = " + posY);
  }    
}

void CheckMovementToDown() {
  //primeira parede
  if ((posX >= 289 && posX <= 364 && posY >= 125 && posY <= 318)) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 1 Regina X = " + posX);
    //println("DOWN 1 Regina Y = " + posY);
  }
  
  //segunda parede
  if ((posX >= 364 && posX <= 434 && posY >= 125 && posY < 625)) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 2 Regina X = " + posX);
    //println("DOWN 2 Regina Y = " + posY);
  }
  
  //terceira parede 
  if (posY >= 125 && posY <= 318 && posX >= 434 && posX <= 504) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 3 Regina X = " + posX);
    //println("DOWN 3 Regina Y = " + posY);
  }
    
  //quarta parede
  if (posY >= 585 && posY < 625 && posX >= 434 && posX <= 639) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 4 Regina X = " + posX);
    //println("DOWN 4 Regina Y = " + posY);
  }
  
  //quinta parede
  if (posY >= 125 && posY < 160 && posX >= 704 && posX <= 824) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 5 Regina X = " + posX);
    //println("DOWN 5 Regina Y = " + posY);
  }
  
  //sexta parede
  if (posY > 125 && posY < 625 && posX >= 824 && posX <= 894) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 6 Regina X = " + posX);
    //println("DOWN 6 Regina Y = " + posY);
  }
  
  //setima parede
  if (posY >= 585 && posY < 625 && posX > 884 && posX <= 954) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 7 Regina X = " + posX);
    //println("DOWN 7 Regina Y = " + posY);
  }   
  
  //oitava parede
  if (posY > 125 && posY < 625 && posX >= 634 && posX <= 704) {
    posY = posY + 5;
    Regina = ReginaFrente;
    pose = 4;
    image(Regina, posX, posY);
    //println("DOWN 8 Regina X = " + posX);
    //println("DOWN 8 Regina Y = " + posY);
  }
}

void GoToFase2() {  
  if (posX > 940 && posY > 585) {
    background(0);
    Mapa2 = loadImage("MAPA2.png");
    image(Mapa2, 0, 0);
    isFase1 = false;
    isFase2 = true;
    
    existsDino1 = true;
    existsDino2 = true;
    existsDino3 = true;
    existsDino4 = true;
    
    posX = 315; // POSIÇÃO X DA PERSONAGEM
    posY = 595; // POSIÇÃO Y DA PERSONAGEM
    showLifes();
    CreateDinos();
    Regina();
    showPonctuation();
  }
  
}
