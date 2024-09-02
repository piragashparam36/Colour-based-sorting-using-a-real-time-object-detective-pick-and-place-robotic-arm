cam = webcam;
preview(cam)
% Define color ranges for red, blue, green, and yellow
redRange = [140, 255, 60, 140, 60, 120]; % Define red range in RGB format
blueRange = [0, 70, 100, 255, 190, 255]; % Define blue range in RGB format
greenRange = [0, 100, 0, 160, 0, 100]; % Define green range in RGB format
yellowRange = [150, 255, 150, 255, 0, 150]; % Define yellow range in RGB format

while true
    % Capture a frame from the webcam
    img = snapshot(cam);
    
    % Detect red objects
    redMask = (img(:,:,1) >= redRange(1) & img(:,:,1) <= redRange(2)) & ...
              (img(:,:,2) >= redRange(3) & img(:,:,2) <= redRange(4)) & ...
              (img(:,:,3) >= redRange(5) & img(:,:,3) <= redRange(6));
    redObjects = img .* uint8(redMask);
    
    % Detect blue objects
    blueMask = (img(:,:,1) >= blueRange(1) & img(:,:,1) <= blueRange(2)) & ...
               (img(:,:,2) >= blueRange(3) & img(:,:,2) <= blueRange(4)) & ...
               (img(:,:,3) >= blueRange(5) & img(:,:,3) <= blueRange(6));
    blueObjects = img .* uint8(blueMask);
    
    % Detect green objects
    greenMask = (img(:,:,1) >= greenRange(1) & img(:,:,1) <= greenRange(2)) & ...
                (img(:,:,2) >= greenRange(3) & img(:,:,2) <= greenRange(4)) & ...
                (img(:,:,3) >= greenRange(5) & img(:,:,3) <= greenRange(6));
    greenObjects = img .* uint8(greenMask);
    
    % Detect yellow objects
    yellowMask = (img(:,:,1) >= yellowRange(1) & img(:,:,1) <= yellowRange(2)) & ...
                 (img(:,:,2) >= yellowRange(3) & img(:,:,2) <= yellowRange(4)) & ...
                 (img(:,:,3) >= yellowRange(5) & img(:,:,3) <= yellowRange(6));
    yellowObjects = img .* uint8(yellowMask);
    
    % Display the detected objects
    subplot(2, 2, 1), imshow(redObjects), title('Red Objects');
    subplot(2, 2, 2), imshow(blueObjects), title('Blue Objects');
    subplot(2, 2, 3), imshow(greenObjects), title('Green Objects');
    subplot(2, 2, 4), imshow(yellowObjects), title('Yellow Objects');
    
    % You can add logic here to perform actions based on the detected objects
    
    pause(1); % Adjust the pause time as needed
end

% Clean up by closing the video preview and deleting the video object
closepreview(cam);
clear(cam);