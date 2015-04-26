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
float centerY, centerX, angle, speed, offset, baseRadius;



// ----------------------------------------------------------------------------
void setup() {

    size(CANVASX, CANVASY, "processing.core.PGraphicsRetina2D");
    background(getRandomColor().get());
    frameRate(60);
    smooth();

    ellipseMode(CENTER);

    centerY = height * 0.5;
    centerX = width * 0.5;
    offset = 150;
    angle = 0.0;
    speed = 0.1;

    baseRadius = 200;


}

void draw() {
    background (255);

    float radius = baseRadius + (float)Math.sin(angle) * offset;

    fill(0);
    ellipse(centerX, centerY, radius, radius);
    angle = angle + speed;
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
