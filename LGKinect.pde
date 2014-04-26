//
//  LGKinect.pde
//  LGKinect
//
//  Creatd by Lewis Godowski on 4/1/14.
//  Copyright (c) 2014 Lewis Godowski. All rights reserved.
//

import processing.opengl.*;
import SimpleOpenNI.*;
import codeanticode.syphon.*;

SimpleOpenNI kinect;
SyphonServer server;

boolean tracking = false;
int userID;
int[] depthValues;

PImage resultImage;

int minDistance  = 500;
int maxDistance  = 2000;

void setup() {
  size(640, 480, OPENGL);

  kinect = new SimpleOpenNI(this);
  if (kinect.isInit() == false) {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  kinect.enableDepth();
  kinect.enableUser();
  kinect.enableRGB();
  kinect.alternativeViewPointDepthToImage();

  resultImage = new PImage(640, 480, RGB);

  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  kinect.update();

  if (tracking) {
    loadPixels();

    depthValues = kinect.depthMap();

    for (int i = 0; i < depthValues.length; i++) {
      if (depthValues[i] > minDistance && depthValues[i] < maxDistance) {
        resultImage.pixels[i] = color(255, 255, 255);
      } 
      else {
        resultImage.pixels[i] = color(0);
      }
    }
    resultImage.updatePixels();
    image(resultImage, 0, 0);

    server.sendImage(resultImage);
  }
}

void keyPressed() {
  boolean validKey = false;

  // KEY HANDLER
  switch(key) {
  case 'x':
    // increase minimum distance
    minDistance += 100;
    validKey = true;  
    println(minDistance + " - " + maxDistance);  
    break;
    
  case 'z':
    // decrease minimum distance
    minDistance -= 100;
    validKey = true;
    println(minDistance + " - " + maxDistance);  
    break;
    
  case 'm':
    // increase maximum distance
    maxDistance += 100;
    validKey = true;   
    println(minDistance + " - " + maxDistance);  
    break;
    
  case 'n':
    // decrease maximum distance
    maxDistance -= 100;
    validKey = true;
    println(minDistance + " - " + maxDistance);  
    break;
  }
}

void onNewUser(SimpleOpenNI curContext, int userId) {
  userID = userId;
  tracking = true;
  println("tracking");
  //curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId) {
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId) {
  //println("onVisibleUser - userId: " + userId);
}

