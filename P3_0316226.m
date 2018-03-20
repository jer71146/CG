
function P3_0316226(in1);
    %find files
    f = figure;
    set(f, 'DefaultFigurePosition', [0 0 480 640]);
    hold on
    len = size(in1, 2);
    now_route = [];
    record = [];
    enlarge = 1;
    for i = 1:len
        if (in1(i) ~= '/')
            now_route(end+1) = in1(i); 
        else
            now_route_ic = char(now_route);
            disp(now_route_ic);
            n = cd(now_route_ic);
            now_route = [];
        end
    end
    now_route_oc = char(now_route);
    disp(now_route_oc);
    n = cd(now_route_oc);
    n1 = dir(now_route_oc);
    files = dir(fullfile(n1, '*.jpg'));
    k = struct2cell(files);
    %initial
    now_num = 1;
    pic_num = size(k, 2);
    is_empty = 0;
    if(pic_num == 0)
        is_empty = 1;
        empty = zeros(480, 640);
        imshow(empty);
        pre = 0;
    else
        pic_name = files(now_num).name;
        pre = imread(pic_name);
    end
    if((size(pre, 2) < 640 || size(pre, 1) < 480) & (is_empty == 0))
        tr_height = size(pre, 1);
        tr_width = size(pre, 2);
        times = 'x';
        c_t_h = num2str(tr_height);
        c_t_w = num2str(tr_width);
        pic_size = strcat(c_t_h, times, c_t_w);
    elseif(is_empty == 0)
        pic_size = '640x480';
    end
    ra = (640*480) / (size(pre, 1) * size(pre, 2) ) *100;
    if(ra > 100)
            ra = 100;
    end
    c_ra = num2str(ra);
    pa = '%';
    ratio = strcat(c_ra, pa); 
    half_height = 160;
    half_width = 120;
    center_x = 320;
    center_y = 240;
    plus = 'x';
    if(is_empty == 0)
        str = ['Picture = ' num2str(now_num), ' of ' num2str(pic_num), ' (' pic_name , ' ) '  pic_size, '@' ratio];
    end
    %t = text(0, -5, str);
    on_click = 0;
    while is_empty == 0
        disp('here');
        axis([0 640 0 480])
        %set(t, 'string', num2str(str));
        x_min = center_x - half_height;
        x_max = center_x + half_height;
        y_min = center_y - half_width;
        y_max = center_y + half_width;
        %set(t, 'string', str);
        who = files(now_num).name;
        RGB = imread(who);
        if(size(RGB, 2) < 640 || size(RGB, 1) < 480)
            pad = [480 640 0] - size(RGB);
            pad(pad<0) = 0;
            merged = padarray(RGB, floor(pad./2));
            RGB2 = merged;
        else
            RGB2 = imresize(RGB, [480 640]);
        end
        if(on_click == 0)
            imshow(RGB2);
        end
        %set(RGB2, 'Position', [160, 120, 320, 240]);
        if(on_click == 0)
            t = text(0, -10, str);
        end
        tt = waitforbuttonpress;
        if tt ~= 1
        %process key board inputs
            on_click = 1;
            r = get(gca, 'CurrentPoint');
            disp(r);
            r11 = r(1, 1);
            r12 = r(1, 2);
            rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
            g = figure;
            hold on
            GG = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
            GGG = imresize(GG, [480 640]);
            imshow(GGG);
            set(gcf,'Position',[0,0, 480, 360]);
            axis([x_min x_max y_min y_max]);
        elseif tt == 1
            c = get(gcf, 'CurrentCharacter');
            disp(uint8(c));
            if(uint8(c) == 28 & on_click == 1) % arrow left
                if(r11-half_width > 0)
                    r11 = r11 - 15;
                end
                figure(f);
                clf(f);
                imshow(RGB2);
                t = text(0, -10, str);
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                figure(g);
                Gl = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGl = imresize(Gl, [480 640]);
                imshow(GGl);
                set(gcf,'Position',[0,0, 480, 360]);
                disp('left');
            elseif(uint8(c) == 29 & on_click == 1) % arrow right
                if((r11 + half_width) < 640)
                    r11 = r11 + 15;
                end
                figure(f);
                clf(f);
                imshow(RGB2);
                t = text(0, -10, str);
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                figure(g);
                Gr = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGr = imresize(Gr, [480 640]);
                imshow(GGr);
                set(gcf,'Position',[0,0, 480, 360]);
                disp('right');
            elseif(uint8(c) == 30 & on_click == 1) % arrow up
                if(r12-half_width > 0)
                    r12 = r12 - 10;
                end
                figure(f);
                clf(f);
                imshow(RGB2);
                t = text(0, -10, str);
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                figure(g);
                Gu = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGu = imresize(Gu, [480 640]);
                imshow(GGu);
                set(gcf,'Position',[0,0, 480, 360]);
                disp('up');
            elseif(uint8(c) == 31 & on_click == 1) % arrow down
                if((r12 + half_width) < 480)
                    r12 = r12 + 10;
                end
                figure(f);
                clf(f);
                imshow(RGB2);
                t = text(0, -10, str);
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                figure(g);
                Gd = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGd = imresize(Gd, [480 640]);
                imshow(GGd);
                set(gcf,'Position',[0,0, 480, 360]);
                disp(r12 + half_width*2);
                disp('down');
            elseif(c - '.' == 0)
                on_click = 0;
                close all
                f = figure;
                now_num = rem(now_num+1+pic_num, pic_num);
                if(now_num == 0)
                    now_num = pic_num;
                end
                disp('>');
            elseif(c - ',' == 0)
                on_click = 0;
                close all
                f = figure;
                now_num = rem(now_num-1+pic_num, pic_num);
                if(now_num == 0)
                    now_num = pic_num;
                end
                disp('<');
            elseif(c - '+' == 0  & on_click == 1)
                half_width = half_width*0.9;
                half_height = half_height*0.9;
                disp(half_width);
                figure(f);
                clf(f);
                imshow(RGB2);
                t = text(0, -10, str);
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                figure(g);
                Gp = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGp = imresize(Gp, [480 640]);
                imshow(GGp);
                set(gcf,'Position',[0,0, 480, 360]);
                disp('+++');
            elseif(c - '-' == 0  & on_click == 1)
                half_width = half_width*1.1;
                half_height = half_height*1.1;
                disp(half_width);
                figure(f);
                clf(f);
                imshow(RGB2);
                t = text(0, -10, str);
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                figure(g);
                Gm = imcrop(RGB2,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGm = imresize(Gm, [480 640]);
                imshow(GGm);
                set(gcf,'Position',[0,0, 480, 360]);
                disp('---');
            end
            %plot(r(1, 1) + ra*cosd(0:360),r(1, 2) + ra*sind(0:360), 'LineWidth', lw, 'color', color); % coordinates in 2-D
        end
        new = files(now_num).name;
        new_RGB = imread(new);
        if(size(new_RGB, 2) < 640 || size(new_RGB, 1) < 480)
            tr_height = size(new_RGB, 1);
            tr_width = size(new_RGB, 2);
            times = 'x';
            c_t_h = num2str(tr_height);
            c_t_w = num2str(tr_width);
            l_pic_size = strcat(c_t_h, times, c_t_w);
        else
            l_pic_size = '640x480';
        end
        ra = (640*480) / (size(new_RGB, 1) * size(new_RGB, 2) ) *100;
        if(ra > 100)
            ra = 100;
        end
        c_ra = num2str(ra);
        l_ratio = strcat(c_ra, pa); 
        str = ['Picture = ' num2str(now_num), ' of ' num2str(pic_num), ' (' new , ' ) '  l_pic_size, '@' l_ratio];
        
    end
end