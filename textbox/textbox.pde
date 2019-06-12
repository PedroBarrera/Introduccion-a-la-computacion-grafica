public class TEXTBOX {
   public int X = 0, Y = 0, H = 35, W = 200;
   public int TEXTSIZE = 24;
   
   // COLORES
   public color Fondo = color(140, 140, 140);
   public color Cletra = color(255, 0, 0);
   public color FondoS = color(255, 255, 255);
   public color Borde = color(0, 0, 0);
   
   public boolean BorderEnable = false;
   public int BorderWeight = 1;
   
   public String Text = "";
   public int TextLength = 0;

   private boolean selected = false;
   
   TEXTBOX() {
    
   }
   
   TEXTBOX(int x, int y, int w, int h) {
      X = x; Y = y; W = w; H = h;
   }
   
   void DRAW() {
      // FONDO
      if (selected) {
         fill(FondoS);
      } else {
         fill(Fondo);
      }
      
      if (BorderEnable) {
         strokeWeight(BorderWeight);
         stroke(Borde);
      } else {
         noStroke();
      }
      
      rect(X, Y, W, H);
      
      // LETRAS
      fill(Cletra);
      textSize(TEXTSIZE);
      text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
   }
   
   
   
   boolean KEYPRESSED(char KEY, int KEYCODE) {
      if (selected) {
         if (KEYCODE == (int)BACKSPACE) {
            BACKSPACE();
         } else if (KEYCODE == 32) {
            // SPACE
            addText(' ');
         } else if (KEYCODE == (int)ENTER) {
            return true;
         } else {
            // revisar que tipo de caracter estan ingresando
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(KEY);
            }
         }
      }
      
      return false;
   }
   
   private void addText(char text) {
      // revisar si el tamao está en los parametros del textboxss
      if (textWidth(Text + text) < W) {
         Text += text;
         TextLength++;
      }
   }
   
   private void BACKSPACE() {
      if (TextLength - 1 >= 0) {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }
   
   // revisar si se está encima de un punto en el textbox
  
   private boolean overBox(int x, int y) {
      if (x >= X && x <= X + W) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y) {
      if (overBox(x, y)) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
