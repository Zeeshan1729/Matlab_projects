clc;
clear;
close all;

%% Read image
[original_img, img] = read_image('Images/chessboard.png');

%% Convert to grayscale
gray = grayscale_conversion(img);

%% FAST corner detection
corner_img = fast_algorithm(gray);

%% Display results
display_result(original_img, img, gray, corner_img);