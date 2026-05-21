gt = [];

for y = 16:16:112
    for x = 16:16:112

        gt = [gt;
            x y];

    end
end

save('chessboard_gt.txt','gt','-ascii');