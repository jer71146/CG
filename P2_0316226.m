function [out] = P2_0316226(in1);
    [tmp_tor, tmp_rand] = parse(in1);
    operator = reshape(tmp_tor', 1, []);
    operand = reshape(tmp_rand', 1, []);
    operator(1) = '+';
    count = 1;
    tmp = '0/1';
    tmp1 = '';
    sor = '';
    k = 0;
    for i = 1:size(operand, 2)
        if(operand(i) ~= ' ')
            sor = strcat(sor, operand(i));
        end
        if(rem(i,  size(tmp_rand, 2)) == 0)
            if(operator(count) - '+' == 0)
                [tmp] = add(tmp, sor);
            elseif(operator(count) - '-' == 0)
                [tmp] = subtract(tmp, sor);
            end
            [tmp] = simplify(tmp);
            count = count + 1;
            sor = '';
        end
    end
    out =  tmp;
end
function [tor, nd] = parse(in1);
    length = size(in1, 2);
    tmp_tor = '';
    tmp_nd = '';
    for i =  1:length
        if(in1(i) - '+' == 0 | in1(i) - '-' == 0) % operator
            tmp_nd(end+1) = ' ';
            tmp_tor(end+1) = char([in1(i)]);
        elseif(in1(i) - ' ' ~= 0 )         % operand
            tmp_nd(end+1) = char([in1(i)]);
        else
            tmp_nd(end+1) = ' ';
        end
    end
    cell_tor = strsplit(tmp_tor);
    cell_nd = strsplit(tmp_nd);
    t_tor = strcat('+', cell_tor);
    tor = char(t_tor);
    nd = char(cell_nd);
end
function [out] = add(in1, in2);
    tofrac = '/1';
    divide = '/';
    if(isempty(find(in1=='/')))
        aug = strcat(in1, tofrac);
    else
        aug = in1;
    end
    if(isempty(find(in2=='/')))
        add = strcat(in2, tofrac);
    else
        add = in2;
    end
    aug_turn = 0;
    add_turn = 0;
    dend = '';
    sor = '';
    dend_1 = '';
    sor_1 = '';
    k1 = 1;
    k2 = 1;
    k3 = 1; 
    k4 = 1;
    qq = 0;
    for i =  1:size(aug, 2)
        if(aug(i) - '/' == 0)
            aug_turn = aug_turn + 1;
        elseif((aug(i) - '-' == 0) & (aug_turn == 0))
            k1 = -1;
        elseif((aug(i) - '-' == 0) & (aug_turn == 1))
            k2 = -1;
        elseif (aug_turn == 0) % aug_dend
            dend(end+1) = char([aug(i)]);
        elseif (aug_turn == 1)   % aug_sor
            sor(end+1) = char([aug(i)]);
             qq = qq + 1;
        end
    end
    for i =  1:size(add, 2)
        if(add(i) - '/' == 0)
            add_turn = add_turn + 1;
        elseif((add(i) - '-' == 0) & (add_turn == 0))
            k3 = -1;
        elseif((add(i) - '-' == 0) & (add_turn == 1))
            k4 = -1;
        elseif (add_turn == 0) % add_dend
            dend_1(end+1) = char([add(i)]);
        elseif (add_turn == 1)   % add_sor
            sor_1(end+1) = char([add(i)]);
        end
    end 
    dend_int = str2num(dend);
    dend_1_int = str2num(dend_1);
    sor_int = str2num(sor);
    sor_1_int = str2num(sor_1);
    den =  sor_int*sor_1_int; % 分母
    num =  dend_int*sor_1_int*k1*k4 + dend_1_int*sor_int*k2*k3; %分子
    den_str = int2str(den);
    num_str = int2str(num);
    out_tmp = strcat(num_str, divide);
    out = strcat(out_tmp, den_str);
end
function [out] = subtract(in1, in2);
    tofrac = '/1';
    divide = '/';
    if(isempty(find(in1=='/')))
        aug = strcat(in1, tofrac);
    else
        aug = in1;
    end
    if(isempty(find(in2=='/')))
        add = strcat(in2, tofrac);
    else
        add = in2;
    end
    aug_turn = 0;
    add_turn = 0;
    dend = '';
    sor = '';
    dend_1 = '';
    sor_1 = '';
    k1 = 1;
    k2 = 1;
    k3 = 1; 
    k4 = 1;
    qq = 0;
    for i =  1:size(aug, 2)
        if(aug(i) - '/' == 0)
            aug_turn = aug_turn + 1;
        elseif((aug(i) - '-' == 0) & (aug_turn == 0))
            k1 = -1;
        elseif((aug(i) - '-' == 0) & (aug_turn == 1))
            k2 = -1;
        elseif (aug_turn == 0) % aug_dend
            dend(end+1) = char([aug(i)]);
        elseif (aug_turn == 1)   % aug_sor
            sor(end+1) = char([aug(i)]);
             qq = qq + 1;
        end
    end
    for i =  1:size(add, 2)
        if(add(i) - '/' == 0)
            add_turn = add_turn + 1;
        elseif((add(i) - '-' == 0) & (add_turn == 0))
            k3 = -1;
        elseif((add(i) - '-' == 0) & (add_turn == 1))
            k4 = -1;
        elseif (add_turn == 0) % add_dend
            dend_1(end+1) = char([add(i)]);
        elseif (add_turn == 1)   % add_sor
            sor_1(end+1) = char([add(i)]);
        end
    end 
    dend_int = str2num(dend);
    dend_1_int = str2num(dend_1);
    sor_int = str2num(sor);
    sor_1_int = str2num(sor_1);
    den =  sor_int*sor_1_int; % 分母
    num =  dend_int*sor_1_int*k1*k4 - dend_1_int*sor_int*k2*k3; %分子
    den_str = int2str(den);
    num_str = int2str(num);
    out_tmp = strcat(num_str, divide);
    out = strcat(out_tmp, den_str);
end
function [out] = simplify(in1);
    turn = 0;
    ini_dend = '';
    ini_sor = '';
    divide = '/';
    k1 = 1;
    k2 = 1;
    for i =  1:size(in1, 2)
        if(in1(i) - '/' == 0)
            turn = turn + 1;
        elseif((in1(i) - '-' == 0) & (turn == 0))
            k1 = -1;
        elseif((in1(i) - '-' == 0) & (turn == 1))
            k2 = -1;
        elseif (turn == 0) % dend
            ini_dend(end+1) = char([in1(i)]);
        elseif (turn == 1)   % sor
            ini_sor(end+1) = char([in1(i)]);
        end
    end
    dend_int = str2num(ini_dend);
    sor_int = str2num(ini_sor);
    gcd = my_gcd(dend_int, sor_int);
    dend_int = dend_int * k1 / gcd;
    sor_int = sor_int * k2 / gcd;
    dend = int2str(dend_int);
    sor = int2str(sor_int);
    out_tmp = strcat(dend, divide);
    out = strcat(out_tmp, sor);
end
function [out] = my_gcd(in1, in2);
    while in2 > 0
        tmp = rem(in1, in2);
        in1 = in2; 
        in2 = tmp;
    end
    out = in1;
    if(in2 == -1)
        out = -1;
    end
end