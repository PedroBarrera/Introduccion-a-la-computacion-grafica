class Recorte{
  ArrayList<Lineaa> lines;
  ArrayList<Vertice> cuadro;
  float t1,t0;
  float xi,yi,xf,yf;
  float izquierda,derecha,arriba,abajo;
  float xri,xrf,yri,yrf;
  float p,q;
  float r,dx,dy;
  
  Recorte(ArrayList<Lineaa> l,ArrayList<Vertice> cuad){
    
    lines= new ArrayList<Lineaa>();
    cuadro=new ArrayList<Vertice>();
    
    lines=l;
    cuadro=cuad;
    
    izquierda=cuadro.get(1).getx();
    derecha=cuadro.get(2).getx();
    abajo=cuadro.get(0).gety();
    arriba=cuadro.get(2).gety();
    
    t0=0;t1=1;
    
    
  }
  
  void recortar(){
    
    for(int k=0;k<lines.size();k++){
      xi=lines.get(k).getxi();
      yi=lines.get(k).getyi();
      xf=lines.get(k).getxf();
      yf=lines.get(k).getyf();
    
      dx=xf-xi;
      dy=yf-yi;
    
      int comprobante=0;
    
      for(int i=0;i<4;i++){
        if(i==0){p=-dx; q=-(izquierda-xi);}
        if(i==1){p=dx; q=(derecha-xi);}
        if(i==2){p=-dy; q=-(abajo-yi);}
        if(i==3){p=dy; q=(arriba-yi);}
        r=q/p;
        if(p==0 && q<0){
          return;
          //comprobante=1;
        }
        if(p<0){
          if(r>t1){
            return;
            //comprobante=1;
          }else if(r>t0){
            t0=r;
          }
        }else if(p>0){
          if(r<t0){
            return;
            //comprobante=1;
          }else if(r<t1){
            t1=r;
          }
        }
      }
    
      xri=xi+t0*dx;
      yri=yi+t0*dy;
      xrf=xi+t1*dx;
      yrf=yi+t1*dy;
      comprobante=0;
      //wprint(xri,xrf,yri,yrf);
    
      Lineaa l= new Lineaa(round(xri),round(yri),round(xrf),round(yrf));
      l.Graficar();
    }
    
  }
  
}

void graficar(){

}
