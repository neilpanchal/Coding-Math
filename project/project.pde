// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2015 Neil Panchal, http://neil.engineer
// ----------------------------------------------------------------------------

// Import color libraries
import com.chroma.*;
import com.luma.*;

// Project details
String title = "Boiler Plate";

int series = 1;
int frame = 1;

// Canvas
int CANVASX = 1280;
int CANVASY = 720;

boolean bgWhite = true;

// Color palette
int lumaNumber = 18, lumaQuality = 60;
int lumaMinL = 15, lumaMaxL = 25;
int lumaMinC = 15, lumaMaxC = 55;
int lumaMinH = 170, lumaMaxH = 360;

Luma lumaColors = new Luma( lumaNumber, lumaQuality,
                            lumaMinL, lumaMaxL,
                            lumaMinC, lumaMaxC,
                            lumaMinH, lumaMaxH);

Chroma[] palette = lumaColors.getClusters();


// ----------------------------------------------------------------------------
float xLoc, yLoc, dx, dy, angle;



// ----------------------------------------------------------------------------
void setup() {

    size(CANVASX, CANVASY, "processing.core.PGraphicsRetina2D");
    background(getRandomColor().get());
    frameRate(60);
    smooth();
    // noLoop();

    ellipseMode(CENTER);

    xLoc = width /2;
    yLoc = height /2;

    angle = 0;

}


void draw() {
    background(getRandomColor().get());

    pushMatrix();
    translate(xLoc, yLoc); // Translate coordinate system to center
    rotate(angle); // Rotate to match the mouse X,Y

    strokeWeight(2);
    stroke(0);
    line(0, 0, 300, 0);
    popMatrix();

    dx = mouseX - xLoc;
    dy = mouseY - yLoc;
    angle = (float)Math.atan2(dy,dx);
}



// ----------------------------------------------------------------------------
void mousePressed() {

    background(getRandomColor().get());

}

void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../export/Series " +
                    series + "/" + title + "_" + series + "_" +
                    frame + ".png");
        frame++;
    }
}

// Get a random palette color
Chroma getRandomColor() {
    return (bgWhite) ? new Chroma(255) : palette[(int)random(0, palette.length)];
}
