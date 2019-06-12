ArrayList<Vertice> vertices = new ArrayList<Vertice>();
ArrayList<Lineaa> lineas = new ArrayList<Lineaa>();
int c=0;
color b= color(0,0,225);
boolean comprobante=true;
//Definir cuadrado;
Vertice v1=new Vertice(50,100);
Vertice v2=new Vertice(50,250);
Vertice v3=new Vertice(350,250);
Vertice v4=new Vertice(350,100);

void setup(){
  size(600,600);
  Lineaa l= new Lineaa(30,210,200,160);
  Lineaa l2= new Lineaa(35,300,300,30);
  
  
  lineas.add(l);
  lineas.add(l2);

}
void draw(){
  background(200);
  if(comprobante==false){
    vertices.clear();
    vertices.add(v1);
    vertices.add(v2);
    vertices.add(v3);
    vertices.add(v4);
    Poligon2 p = new Poligon2(vertices);
    p.Graficar();
    Recorte r = new Recorte(lineas,vertices);
    r.recortar();
  }
  if(comprobante==true){
    for(int i=0;i<lineas.size();i++){
      lineas.get(i).Graficar();
    }
  }
}

void keyPressed(){
  if(key=='w' || key=='W'){
    v1.sety(int(v1.gety()-1));
    v2.sety(int(v2.gety()-1));
    v3.sety(int(v3.gety()-1));
    v4.sety(int(v4.gety()-1));
    println(v1.getx(),v1.gety(),v2.getx(),v2.gety(),v3.getx(),v3.gety(),v4.getx(),v4.gety());
  }
  if(key=='a' || key=='A'){
    v1.setx(int(v1.getx()-1));
    v2.setx(int(v2.getx()-1));
    v3.setx(int(v3.getx()-1));
    v4.setx(int(v4.getx()-1));
    println(v1.getx(),v1.gety(),v2.getx(),v2.gety(),v3.getx(),v3.gety(),v4.getx(),v4.gety());
  }
  if(key=='s' || key=='S'){
    v1.sety(int(v1.gety()+1));
    v2.sety(int(v2.gety()+1));
    v3.sety(int(v3.gety()+1));
    v4.sety(int(v4.gety()+1));
    println(v1.getx(),v1.gety(),v2.getx(),v2.gety(),v3.getx(),v3.gety(),v4.getx(),v4.gety());
  }
  if(key=='d' || key=='D'){
    v1.setx(int(v1.getx()+1));
    v2.setx(int(v2.getx()+1));
    v3.setx(int(v3.getx()+1));
    v4.setx(int(v4.getx()+1));
    println(v1.getx(),v1.gety(),v2.getx(),v2.gety(),v3.getx(),v3.gety(),v4.getx(),v4.gety());
  }
  if(key=='q' || key=='Q'){
    comprobante = false;
  }
  if(key=='e' || key=='E'){
    comprobante = true;
  }
  
}
