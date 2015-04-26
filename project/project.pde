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
float centerY, centerX, angle, speed, offset, baseAlpha;



// ----------------------------------------------------------------------------
void setup() {

    size(CANVASX, CANVASY, "processing.core.PGraphicsRetina2D");
    background(getRandomColor().get());
    frameRate(60);
    smooth();
    noStroke();

    ellipseMode(CENTER);

    centerY = height * 0.5;
    centerX = width * 0.5;
    offset = 0.5;
    angle = 0.0;
    speed = 0.1;

    baseAlpha = 0.5;


}

void draw() {
    background (255);

    float alpha = baseAlpha + (float)Math.sin(angle) * offset;
    fill(0, alpha*255);
    ellipse(centerX, centerY, 100, 100);
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
