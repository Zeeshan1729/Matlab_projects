function [original_img, resized_img] = read_image(filename)

% Read original HD image
original_img = imread(filename);

% Resize to 128x128
resized_img = imresize(original_img,[128 128]);

end