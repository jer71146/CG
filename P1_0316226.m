function P1_0316226(in1, in2);
    [board, mines] = set_board(in1, in2);
    [mines_row, mines_column, fixed_board] = set_mines(board, mines);
    new_board = set_board_value(fixed_board);
    draw_image(new_board, mines_column, mines_row, mines);
end
function [board, mines] = set_board(in1, in2);
    board = zeros(size(in1'));
    mines = in2;
end
function [m1, m2, m3] = set_mines(in1, in2);
    height = size(in1, 1);
    width = size(in1, 2);
    large_array = randperm(height*width, in2);
    row = ceil(large_array / height);
    column = large_array-(row-1)*height;
    in1(large_array) = 9;
    m1 = row;
    m2 = column;
    m3 = in1;
end
function [m1]= set_board_value(in1);
    large_row = size(in1, 1) + 2; % 32+2
    large_column = size(in1, 2) + 2; %16+2
    B = zeros(large_row, large_column); % B為擴增矩陣
    B(2:end-1, 2:end-1) = in1;
    ii = 2 : size(in1, 1)+1; 
    jj = 2 : size(in1, 2)+1;
    C = ((B(ii-1, jj-1) == 9) + (B(ii-1, jj) == 9) + (B(ii-1, jj+1) == 9) + (B(ii, jj-1) == 9) + (B(ii, jj+1) == 9) + (B(ii+1, jj-1) == 9) + (B(ii+1, jj) == 9) + (B(ii+1, jj+1) == 9)); % 用地雷設定鄰居的值
    D = C + in1; % 與地雷重疊
    k = find(D>=9); % >9均設回為9
    D(k) = 9;
    m1 = D;
end
function draw_image(in1, in2, in3, in4); % input and output are two 16*32 matrix
    % draw color map
    i_k = find(in1==9); % avoid affecting the maximum of matrix
    in1(i_k) = 0;
    tmp1 = in1'; % turn around
    max_value = max(max(tmp1)); % divide it average
    r_k = find(tmp1==-1); % get the value back
    tmp1(r_k) = 9;
    B = ones(6); % expand matrix to 6 times
    tmp2 = kron(tmp1, B); % use kron to expand 1*1 to 5*5
    db = uint8(256*tmp2/max_value); % goto 256
    map = winter(256);
    
    RGB = ind2rgb(db, map);
    RGB(:, 1:6:end+3, :) = 0; %draw x line
    RGB(1:6:end+3, :, :) = 0; %draw y line
    imshow(RGB, 'InitialMagnification', 'fit'); % adjust to proper size
    hold on
    % draw mines
    for i = 1:in4
        new_i = (in2(i)-1)*6 + 3;
        new_j = (in3(i)-1)*6 + 3;
        x = [new_i-1, new_i+3, new_i+3, new_i-1];
        y = [new_j-1, new_j-1,new_j+3, new_j+3]; % draw 1x1
        fill(x, y, 'k', 'EdgeColor', 'w', 'LineWidth', 5);
        hold on
    end
    % add text;
   	hold on 
    b_height = size(in1, 1);
    for i = 1:8
        k1 = find(in1==i);
        row1 = ceil(k1 / b_height);
        column1 = k1-(row1-1)*b_height;
        new_i = (column1-1)*6 + 3.5;
        new_j = (row1-1)*6 + 4;
        str1 = [num2str(i)];
        T1 = text(new_i, new_j, str1, 'FontSize', 15);
        hold on
    end
    % get into image
    grid on
    axis([-0.5 193.5 -0.5 97.5]) % set all range
    set(gca,'Xtick', [0:0:0], 'Ytick', [0:0:0]) % set unit range  
end
