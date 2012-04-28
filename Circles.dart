#library('Circles');
#import('dart:html');
#source('Utils.dart');
#source('Circle.dart');

class Circles {
  static CanvasRenderingContext2D ctx;
  static bool negative = false;  
  static num centerX;
  static num centerY;
  
  Circles() {
    CanvasElement canvas = document.query("#canvas");
    ctx = canvas.getContext("2d");
    ctx.canvas.width = window.innerWidth;
    ctx.canvas.height = window.innerHeight;
    
    centerX = (ctx.canvas.width / 2) - 200;
    centerY = (ctx.canvas.height / 2) + 150;
    
    Element text1 = document.query("#text1");
    text1.style.top = "${(centerY - 70)}px";
    text1.style.left = "${(centerX - 150)}px";
    text1.style.display = "block";
    Element text2 = document.query("#text2");
    text2.style.top = "${centerY}px";
    text2.style.left = "${centerX}px" ;
    text2.style.display = "block";
    
    document.query('#link').on.click.add((e) {
      toggle_colors();
    });
    
    window.on.resize.add((e) {
      print("resized event");
      draw();
    });
    
    document.on.fullscreenChange.add((e) {
      print("fullscreen event");
      draw();
    });
  }

  void toggle_colors() {
    negative = !negative;
    document.query("body").style.backgroundColor = negative ? "#000000" : "#FFFFFF";  
    document.query("#link").style.color = negative ? "white" : "black";
    document.query("#text2").style.color = negative ? "white" : "black";
    draw();
  }
  
  void draw() {
    clear();
    List circles = [
                   new Circle(300, 850, 230, 180),
                   new Circle(220, 585, 310, 160),
                   new Circle(140, 400, 270, 130),
                   new Circle(70, 290, 280, 40),
                   new Circle(70, 290, 80, 150),
                   new Circle(30, 235, 310, 10),
                   new Circle(30, 235, 90, 140),
                   new Circle(10, 210, 320, 40),
                   new Circle(10, 210, 110, 150),
                  ];
    for (var i = 0; i < circles.length; i++) {
      circles[i].animatedDraw();    
    }
  }

  void clear() {
    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
  }
}

void main() {
  new Circles().draw();
}
