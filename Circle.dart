
class Circle {

  final num lineWidth;
  final num radius;
  final num startingAngle;
  final num endingAngle;
  CanvasRenderingContext2D ctx;
  var counterclockwise = false;
  
  
  Circle(num this.lineWidth, num this.radius, this.startingAngle, this.endingAngle) {
    ctx = Circles.ctx;
  }

  void staticDraw() {
      draw(startingAngle, endingAngle);  
  }
  
  void draw(num startAngle, num endAngle) {
    ctx.beginPath();
    ctx.arc(Circles.centerX, Circles.centerY, radius, Utils.convertDegreesToRadians(startAngle), Utils.convertDegreesToRadians(endAngle), counterclockwise);
    ctx.lineWidth = lineWidth;
    ctx.strokeStyle = Circles.negative ? "white" : "black";
    ctx.stroke();
  }
  
  void animatedDraw() {
    var intervalId;
    var tempAngle = startingAngle;
    var tempStartingAngle = startingAngle;
    void animate() {
      if (tempAngle == endingAngle) {
         print("ending angle has reached threshold");  
         window.clearInterval(intervalId);
      }
      if (tempAngle == 360) {
        tempAngle = 0;
      }
      tempAngle = tempAngle + 5;
      draw(tempStartingAngle, tempAngle);
      tempStartingAngle = tempStartingAngle + 4.9;  
    }
    intervalId = window.setInterval(animate, 10); 
  }
}  