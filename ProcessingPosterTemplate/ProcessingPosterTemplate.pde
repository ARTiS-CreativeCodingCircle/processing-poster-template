// Resolution: 350dpi
// Bleed: 3mm

// A0 (847mm * 1195mm) : size(11671, 16467);
// A1 (600mm *  847mm) : size(8268, 11671);
// A2 (426mm *  600mm) : size(5870, 8268);
// A3 (303mm *  426mm) : size(4175, 5870);
// A4 (216mm *  303mm) : size(2976, 4175);
// A5 (154mm *  216mm) : size(2122, 2976);
// A6 (111mm *  154mm) : size(1530, 2122);

// B0 (1036mm * 1462mm) : size(14276, 20146);
// B1 ( 734mm * 1036mm) : size(10114, 14276);
// B2 ( 521mm *  734mm) : size(7179, 10114);
// B3 ( 370mm *  521mm) : size(5098, 7179);
// B4 ( 263mm *  370mm) : size(3624, 5098);
// B5 ( 188mm *  263mm) : size(2591, 3624);
// B6 ( 134mm *  188mm) : size(1846, 2591);

// Business card           ( 97mm *  61mm) : size(1337, 841);
// Western Business card   ( 95mm *  57mm) : size(1309, 785);
// Member's card           ( 91mm *  60mm) : size(1254, 827);
// Stamp card - vertical   ( 91mm * 112mm) : size(1254, 1543);
// Stamp card - horizontal (176mm *  60mm) : size(2425, 827);

// Postcard              (106mm * 154mm) : size(1461, 2122);
// Round-trip postcard   (206mm * 154mm) : size(2839, 2122);
// Large format postcard (241mm * 126mm) : size(3321, 1736);

import processing.pdf.*;

int bleedPx = 83; // 3mm = 83px
boolean isExportPDF = true;

void setup() {
  size(2976, 4175);
  
  textAlign(LEFT);
}

void draw() {
  if (isExportPDF) {
    exportPDF();
    exit();
  } else {
    drawPoster();
    noLoop();
  }
}

void drawPoster() {
  background(255);
  
  // Sample
  fill(0);
  textSize(120);
  text("text", 100, 200);
  
  // Draw Bleed line
  stroke(150);
  noFill();
  rect(bleedPx, bleedPx, width-bleedPx*2, height-bleedPx*2);
}

void exportPDF() {
  beginRecord(PDF, "Poster.pdf");
  drawPoster();
  endRecord();
}
