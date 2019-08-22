final float COMPRIMENTO_SEGUNDOS_MAO = 250.0; //Comprimento da mão de segundos; os outros tamanhos escalam baseados nesse aqui
//final é usado  para afirmar que um valor, classe ou metodo nao podem ser mudados
//https://www.youtube.com/watch?v=jRMv6UExvXA&list=PLkJ4kBc8wVkUUUYwkd0ip_axkEPEINnPG

final int APP_LARGURA =int( 2 * COMPRIMENTO_SEGUNDOS_MAO + 30.0);  //LARGURA e tamanho do aplicativo

final float APP_CENTRO = APP_LARGURA /2.0; //CENTRO X E Y COORDENADAS DO DISPLAY JANELA

final float FACE_DIAMETRO = APP_LARGURA - 5.0; //DIAMETRO DA FACE DO RELOGIO

final float COMPRIMENTO_MINUTOS_MAO = 7.0 / 8.0 * COMPRIMENTO_SEGUNDOS_MAO; // comprimento da mão de minutos

final float COMPRIMENTO_HORAS_MAO = 3.0 / 4.0 * COMPRIMENTO_MINUTOS_MAO; //comprimento da mão de horas

void setup() {
  //tamanho do app
  surface.setSize(APP_LARGURA, APP_LARGURA);
  
  
  //carrega e configura a fonte para os numeros do relogio
 // PFont font = loadFont("SansSerif-12.vlw");
  //textFont(font);
  //textAlign(CENTER, CENTER);
  
  // configura a linha e a forma do relogio
  stroke(255);
  smooth();
  noFill();
  
}

PVector convertAndTranslate(float theta, float r) {
  
  theta -= HALF_PI;
  
  return new PVector(r * cos(theta) + APP_CENTRO,
    r * sin(theta) + APP_CENTRO);
  // coloca o numero 12 no topo do relogio
  // theta  é o angulo polar, com 0 assumidamente sendo o topo
  //r é o radiano do raio
  // PVector contem as coordenadas x e y
  // converter de coordenadas polares para plano cartesiano para que a origem seja o centro da face do relogio
}
  //desenha a face, mãos e numeros do relogio
  void draw() {
    background(0); // um blackground preto
    //desenha a face do relogio
    strokeWeight(1);
    ellipse(APP_CENTRO, APP_CENTRO , FACE_DIAMETRO, FACE_DIAMETRO);
    float theta = TWO_PI * second() /60.0;
    PVector endPoint = convertAndTranslate(theta, COMPRIMENTO_SEGUNDOS_MAO);
    line(APP_CENTRO, APP_CENTRO, endPoint.x, endPoint.y);
    
    //faz uma mão de minuto, mas um pouco mais grossa
    strokeWeight(2);
    theta = TWO_PI * minute() / 60.0;
    endPoint = convertAndTranslate(theta, COMPRIMENTO_MINUTOS_MAO);
    line(APP_CENTRO, APP_CENTRO, endPoint.x, endPoint.y);
    
    // mão de hora
    strokeWeight(4);
    theta = TWO_PI * ((hour() % 12 + minute() / 60.0) / 12.0);
    endPoint = convertAndTranslate(theta, COMPRIMENTO_HORAS_MAO);
    line(APP_CENTRO, APP_CENTRO, endPoint.x, endPoint.y);
    
    //desenha os numeros do relogio
    //convertandtranslate converte de coordenada polar para plano cartesiano
    for(int number =1; number <= 12; number++){
      theta = TWO_PI * (number / 12.0);
      endPoint = convertAndTranslate(theta, COMPRIMENTO_SEGUNDOS_MAO);
      textAlign(CENTER);
      text(Integer.toString(number), endPoint.x, endPoint.y);
    }
  
  
  }
