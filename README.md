LGKinect
========

LGKinect is a Processing sketch for sending a live Kinect feed to another application, via Syphon.


## About

This Processing sketch was commissioned by [Suzanne Kite](http://www.kitekitekitekite.com) to track three dancers using a Kinect and send a mask of their shape to Resolume Arena, where visuals were mixed live and projected onto their bodies.


## Usage

1. Download and install the `SimpleOpenNI` Processing library available [here](https://code.google.com/p/simple-openni/downloads/detail?name=SimpleOpenNI-1.96.zip)
2. Un-zip `Syphon.zip` and install the resulting `Syphon` Processing library.
3. Plug in the Kinect's USB and power adapter.
4. Open and run the `LGKinect.pde` Processing sketch.
5. Open an application capable of receiving live video (ex: Resolume Arena) and select the Syphon video stream source.

### Controls
Once LGKinect is running:
- The `z` and `x` keys decrease and increase the minimum depth value tracked by the Kinect.
- The `n` and `m` keys decrease and increase the maximum depth value tracked by the Kinect.

_Note: Focus must be on the LGKinect video window for the controls to work._

## To Do

- Remove user tracking
- Upload and link to video of performance


## License

LGKinect is available under the MIT license. See the LICENSE file for more info.
