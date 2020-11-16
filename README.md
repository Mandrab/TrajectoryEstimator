# Used tools
- Image Processing Toolbox
- Computer Vision Toolbox

# Usage
To run the code in a matlab environment you need to run this command:

`main("images/main/folder", "path/to/trajectory", ball_size, "path/to/calibration_images", chessboard_pattern_size);`

where:
- "images/main/folder" is the root folder of the images folders (calibration + training)
- "path/to/trajectory" (from the "images/main/folder") is the path of the folder containing the images of the trajectory
- ball_size is the size of the ball in real world (in mm)
- "path/to/calibration_images" (from the "images/main/folder") is the path of the folder containing the calibration images
- chessboard_pattern_size is the size of a square in the calibration images (in mm)

After first run, you can take the result value of the function (the camera parameters) and use them to perform another run/estimation substituing "camera_model" to "path/to/calibration_images":

`main("images/main/folder", "path/to/trajectory", ball_size, camera_model, chessboard_pattern_size);`