% Initialize webcam
cam = webcam;

% Capture loop
while true
    % Take snapshot
    img = snapshot(cam);
    
    % Convert image to HSV color space
    img_hsv = rgb2hsv(img);
    
    % Extract H (hue) channel
    hue = img_hsv(:,:,1);
    
    % Calculate histogram of hue values
    num_bins = 100;
    h_hist = imhist(hue, num_bins);
    
    % Find the bin with the maximum count
    [~, max_bin] = max(h_hist);
    
    % Map bin index to corresponding hue value
    max_hue = max_bin * (360 / num_bins);
    
    % Define hue ranges for red, green, blue, and white
    hue_ranges = [0, 30; 210, 270; 60, 150; 0, 360]; % Red, Blue, Green, White
    color_names = {'Red', 'Blue', 'Green', 'White'};
    
    % Check if the detected hue falls within any range
    color_detected = '';
    for i = 1:length(hue_ranges)
        if max_hue >= hue_ranges(i, 1) && max_hue <= hue_ranges(i, 2)
            color_detected = color_names{i};
            break;
        end
    end
    
    % Display the detected color
    disp(['Detected color: ' color_detected]);
    
    % Check if the detected color is red, green, blue, or white
    if strcmp(color_detected, 'Red') || strcmp(color_detected, 'Blue') || ...
            strcmp(color_detected, 'Green') || strcmp(color_detected, 'White')
        disp('Detected stop color. Stopping video input.');
        
        % Save the image
        imwrite(img, 'detected_color_image.jpg');
        break;
    end
    
    % Display the image
    imshow(img);
    drawnow;
end

% Display the captured image
captured_img = imread('detected_color_image.jpg');
imshow(captured_img);

% Clear webcam object
clear cam;


