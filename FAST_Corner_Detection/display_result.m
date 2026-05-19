function display_result(original_img, img, gray, corner_img)

figure;

%% 1. Original HD Image
subplot(2,3,1);

imshow(original_img);

title('Original HD Image');

%% 2. Resized 128x128 Image
subplot(2,3,2);

imshow(img);

title('Resized 128x128 Image');

%% 3. Grayscale Image
subplot(2,3,3);

imshow(gray);

title('Grayscale Image');

%% 4. Corner-only Image
subplot(2,3,4);

imshow(corner_img);

title('Detected Corners');

%% 5. Overlay on Resized Image
subplot(2,3,5);

imshow(img);
hold on;

% Find corner coordinates
[rows, cols] = find(corner_img == 255);

% Plot corners
plot(cols, rows, 'r.', 'MarkerSize', 10);

title('FAST Corners Overlay');

end