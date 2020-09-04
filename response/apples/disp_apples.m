
col = 1;

for val = 10
    
    apple_orig = imread(strcat('images_set1/apple_',int2str(col),'.png'));

    apple_disp=imresize(apple_orig, 0.0145*val, 'bilinear');

    imshow(apple_disp)

    imwrite(apple_disp, strcat('apple_',int2str(val),'.png'))

end

