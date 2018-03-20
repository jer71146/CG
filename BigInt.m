classdef BigInt
    properties
        num = [];
        cell = {};
        size = 0;
    end
     methods
         function obj = BigInt(in1)
             if nargin == 0
                 obj.num = [0];
                 %disp(obj.num);
             elseif nargin == 1 
                if isnumeric(in1) && (size(in1, 1) == 1)
                    obj.num = num2str(in1)-'0';
                    %disp('here is scalar.');
                elseif iscell(in1)
                    %disp('here is cell.');
                    tmp1_c = [];
                    size_max_c = 1;
                    for i = 1:numel(in1)
                        obj.cell(i) = cell(in1(i));
                        c_1 = cell2mat(in1(i));
                        if(size(c_1, 2) > size_max_c)
                            size_max_c = size(c_1, 2);
                        end
                    end
                    for i = 1:numel(in1)
                        c_2 = cell2mat(in1(i));
                        tt_1_c = c_2 - '0';
                        if(size_max_c - size(c_2, 2) > 0)
                            k = size_max_c - size(c_2, 2);
                            for i = 1:k
                                tmp1_c = [tmp1_c,  0];
                            end
                        end
                        tmp1_c = [tmp1_c,  tt_1_c];
                    end
                    obj.num = reshape(tmp1_c, [], size(in1, 1));
                elseif isnumeric(in1) && (size(in1, 1) > 1)
                    k = num2cell(in1);
                    nn = ndims(k);
                    if(nn == 3)
                        obj.cell = ([obj.cell,  k]);
                    end
                    disp('here is numeric.');
                    tmp1 = [];
                    size_max = 1;
                    for i = 1:numel(in1)
                        if(numel(num2str(in1(i))) > size_max)
                            size_max = numel(num2str(in1(i)));
                        end
                    end
                    for i = 1:numel(in1)
                        tt1 = num2str(in1(i))-'0';
                        if(size_max - numel(num2str(in1(i))) > 0)
                            k = size_max - numel(num2str(in1(i)));
                            for i = 1:k
                                tmp1 = [tmp1,  0];
                            end
                        end
                        tmp1 = [tmp1,  tt1];
                    end
                    obj.num = reshape(tmp1, [], size(in1, 1));
                    %obj.num = tmp1;
                else
                    obj.num = in1-'0';
                    %disp(obj.num);
                end 
             elseif all(in1(:) ~= 0)
                if iscell(in1)
                    %disp('here is cell.');
                    tmp2_c = [];
                    size_max_2_c = 1;
                    for i = 1:numel(in1)
                        obj.cell(i) = cell(in1(i));
                        c_3 = cell2mat(in1(i));
                        if(size(c_3, 2) > size_max_2_c)
                            size_max_2_c = size(c_3, 2);
                        end
                    end
                    for i = 1:numel(in1)
                        c_4 = cell2mat(in1(i));
                        tt_1_c = c_4 - '0';
                        if(size_max_2_c - size(c_4, 2) > 0)
                            k = size_max_2_c - size(c_4, 2);
                            for i = 1:k
                                tmp2_c = [tmp2_c,  0];
                            end
                        end
                        tmp2_c = [tmp2_c,  tt_1_c];
                    end
                    obj.num = reshape(tmp2_c, [], size(in1, 1));
                elseif isnumeric(in1)
                    %disp('here is numeric.');
                    tmp2 = [];
                    size_max_1 = 1;
                    for i = 1:numel(in1)
                        if(numel(num2str(in1(i))) > size_max_1)
                            size_max_1 = numel(num2str(in1(i)));
                        end
                    end
                    for i = 1:numel(in1)
                        tt2 = num2str(in1(i))-'0';
                        if(size_max_1 - numel(num2str(in1(i))) > 0)
                            k1 = size_max_1 - numel(num2str(in1(i)));
                            for i = 1:k1
                                tmp2 = [tmp2,  0];
                            end
                        end
                        tmp2 = [tmp2,  tt2];
                    end
                    %obj.num = reshape(obj.num, size(in1));
                    obj.num = reshape(tmp1, [], size(in1, 1));
                    %obj.num = reshape(obj.num, size(in1));
                end
             else
                error('Input error!');
             end
         end
         function p = plus(in1, in2)
             p = BigInt();
             p_tmp_1 = [];
             if(isa(in1,'BigInt') == 0)   
                pp1 = BigInt(in1);
                in1 = pp1;
             end
             if(isa(in2,'BigInt') == 0)
                %size(in1, 1)
                %size(in1, 2)
                pp2 = BigInt(in2);
                in2 = pp2;
             end
             if(size(in1.num, 1) == 1)
                 in2.num = reshape(in2.num, [], 1);
             end
             if(size(in2.num, 1) == 1)
                 in1.num = reshape(in1.num, [], 1);
             end
             n_2 = max(size(in1.num, 2), size(in2.num, 2));
             for ii = 1:n_2
                if (isa(in1,'BigInt') == 1) & (isa(in2,'BigInt') == 1)
                    if(size(in1.num, 1) == 1 | size(in2.num, 1) == 1)
                        if (size(in1.num, 1) == 1)
                            p_1 = in1.num(1:size(in1.num, 2));
                            p_2 = in2.num(ii);
                        elseif(size(in2.num, 1) == 1)
                            p_1 = in1.num(ii);
                            p_2 = in2.num(1:size(in2.num, 2));
                            
                        end
                    else
                        p_1 = in1.num((1+(ii-1)*size(in1.num, 1)):ii*size(in1.num, 1));
                        p_2 = in2.num((1+(ii-1)*size(in2.num, 1)):ii*size(in2.num, 1));
                    end
                end
                pad_num = abs(size(in1.num, 1) - size(in2.num, 1));
                if(size(in1.num, 1) == 1 | size(in2.num, 1) == 1)
                    if(size(in1.num, 2) > size(in2.num, 2))
                        n_p_1 = p_1;
                        n_p_2 = p_2;
                        for i = 1:pad_num
                            n_p_2 = [0 n_p_2];
                        end
                    elseif(size(in1.num, 2) < size(in2.num, 2))
                        n_p_1 = [p_1];
                        for i = 1:pad_num
                            n_p_1 = [0 n_p_1];
                        end
                        n_p_2 = p_2;
                    else
                        n_p_1 = p_1;
                        n_p_2 = p_2;
                    end
                else
                    if(size(in1.num, 1) > size(in2.num, 1))
                        n_p_1 = p_1;
                        n_p_2 = p_2;
                        for i = 1:pad_num
                            n_p_2 = [0 n_p_2];
                        end
                    elseif(size(in1.num, 1) < size(in2.num, 1))
                        n_p_1 = [p_1];
                        for i = 1:pad_num
                            n_p_1 = [0 n_p_1];
                        end
                        n_p_2 = p_2;
                    else
                        n_p_1 = p_1;
                        n_p_2 = p_2;
                    end
                end
                p.num = plus(n_p_1, n_p_2);
                p.num = [0 p.num];
                p_size = size(n_p_2, 2) + 1;
                for i = 1:p_size
                    if(p.num(p_size-i+1) - 0 > 9)
                        p.num(p_size-i+1) = p.num(p_size-i+1) - 10;
                        p.num(p_size-i) = p.num(p_size-i) + 1;
                    end
                end
                p_size_max = max(size(in1.num, 1),  size(in2.num, 1)) + 1;
               
                p_tmp_1 = [p_tmp_1, p.num];
                p.num = reshape(p_tmp_1, [], size(in1.num, 2));
             end
                 for ii = 1:n_2
                     if p.num(1+(ii-1)*(p_size_max-1)) == 0
                         p.num(1+(ii-1)*(p_size_max-1))=[];
                     end
                 end
                 p.num = reshape(p.num, [], n_2);
                 p = BigInt(char(p.num + '0'));
            %disp(p);
         end
         function t = times(in1, in2)
             t = BigInt();
             t_tmp_1 = [];
             if(isa(in1,'BigInt') == 0)   
                in1 = reshape(in1, [], 1);
                in1_1_size = size(in1, 1);
                tt_1 = BigInt(in1);
                in1 = tt_1;
                in2_1_size = size(in2.num, 1);
                in2.num = reshape(in2.num, 1, []);
             else
                 in1_1_size = size(in1.num, 1);
                 in2_1_size = size(in1.num, 1);
             end
             if(isa(in2,'BigInt') == 0)
                in2 = reshape(in2, [], 1);
                in2_1_size = size(in2, 1);
                tt_2 = BigInt(in2);
                in2 = tt_2;
                in1_1_size = size(in1.num, 1);
                in1.num = reshape(in1.num, 1, []);
             else
                 in1_1_size = size(in1.num, 1);
                 in2_1_size = size(in1.num, 1);
             end
             t_n_2 = max(size(in1.num, 2), size(in2.num, 2));
             for ii = 1:t_n_2
                 if (isa(in1,'BigInt') == 1) & (isa(in2,'BigInt') == 1)
                    if(in1_1_size == 1 | in2_1_size == 1)
                        if (in1_1_size == 1)
                            t_1 = in1.num(1:size(in1.num, 2));
                            t_2 = in2.num(ii);
                        elseif(in1_2_size == 1)
                            t_1 = in1.num(ii);
                            t_2 = in2.num(1:size(in2.num, 2));
                        end
                    else
                        t_1 = in1.num((1+(ii-1)*size(in1.num, 1)):ii*size(in1.num, 1));
                        t_2 = in2.num((1+(ii-1)*size(in2.num, 1)):ii*size(in2.num, 1));
                    end
                 end
                t.num = conv(t_1, t_2);
                t.num = [0 0 t.num];
                t_size = size(t.num, 2);
                
                for i = t_size:-1:2
                    while(t.num(i) - 0 > 9)
                        t.num(i) = t.num(i) - 10;
                        t.num(i-1) = t.num(i-1) + 1;
                    end
                end
                
                t_size_max = max(size(in1.num, 1),  size(in2.num, 1)) + 2;
               
                t_tmp_1 = [t_tmp_1, t.num];
                t.num = reshape(t_tmp_1, [], t_size);
             end
                 for ii = 1:t_n_2
                    if t.num(1+(ii-1)*(t_size_max-1)) == 0
                        if t.num(2+(ii-1)*(t_size_max-1)) == 0
                        %    t.num(1+(ii-1)*(t_size_max-1):2+(ii-1)*(t_size_max-1))=[];
                        else 
                            t.num(1+(ii-1)*(t_size_max-1))=[];
                        end
                    end
                 end
                 t.num = reshape(t.num, [], t_n_2);
                 %t.num
                 t = BigInt(char(t.num + '0'));
         end
         function e = eq(in1, in2)
             depend = 0;
            if(isa(in1,'BigInt') == 0)   
               ee1 = BigInt(in1);
               in1 = ee1;
               depend = 1;
            end
            if(isa(in2,'BigInt') == 0)
               ee2 = BigInt(in2);
               in2 = ee2;
               depend = 1;
               %size(in1.num, 2)
               %size(in2.num, 2)
            end
            e_pad_num = abs(size(in1.num, 1) - size(in2.num, 1));
            e1 = in1.num;
            e2 = in2.num;
            if (size(in1.num, 2) ~= size(in2.num, 2))
                if (isscalar(in1.num))
                    in1.num = repmat(in1.num', size(in2.num, 1), size(in2.num, 2));
                    e = (in1.num==in2.num);
                elseif(isscalar(in2.num))
                    in2.num = repmat(in2.num, size(in1.num, 1), size(in1.num, 2));
                    in1_f = reshape(in1.num, size(in1.num, 2), size(in1.num, 1));
                    in2_f = reshape(in2.num, size(in1.num, 2), size(in1.num, 1));
                    e = (in1_f==in2_f);
                else
                    e = 0;
                    for i= 1:size(in1.num, 2)
                        if(i == 1)    
                            disp(e);
                        end
                    end
                end
                
            else
                e_2 = size(in1.num, 2);
                if(depend == 1)
                    e = (in1.num==in2.num);
                elseif(depend == 0)
                    for ii = 1:e_2
                            et_1 = e1(1+(ii-1)*size(in1.num, 1):ii*size(in1.num, 1));
                            et_2 = e2(1+(ii-1)*size(in2.num, 1):ii*size(in2.num, 1));

                            if(size(in1.num, 1) > size(in2.num, 1))
                                for i = 1:e_pad_num
                                    et_2 = [0 et_2];
                                end
                            elseif(size(in1.num, 1) < size(in2.num, 1))
                                for i = 1:e_pad_num
                                    et_1 = [0 et_1];
                                end
                            end
                               e = all(et_1==et_2);
                        %et_1
                        %et_2
                        if ii == 1
                            disp(e); 
                        end
                    end
                end
            end
         end
         function m = make_str(b)
             m = char(b.num + '0');
         end
         function disp(f)
             %mm = f.make_str();
             %if iscell(f)
             %    obj.num = reshape(obj.num, size(in1));
             %elseif isnumeric(f)
             %end
             if(isa(f,'BigInt') == 1)
                left = '(';
                point = ', ';
                right = ')';
                if(isempty(f.cell) == 1)
                    num = size(f.num, 1)*size(f.num, 2);
                    IND1 = 1:num;
                    s1 = [size(f.num, 1), size(f.num, 2)];
                    [t_front, t_rear] = ind2sub(s1, IND1);
                else
                    tmp = cell2mat(f.cell);
                    num = size(f.num, 1)*size(f.num, 2);
                    IND2 = 1:num;
                    s2 = [size(tmp, 1), size(tmp, 2), size(tmp, 3)];
                    [t_first, t_second, t_third] = ind2sub(s2, IND2);
                end
                %n_dims = ndims(ttt)
                for i = 1:num
                    %head = strcat(left, front, point, rear, right);
                    now = 1;
                    if(isempty(f.cell) == 1)
                        front = int2str(t_front(i));
                        rear  = int2str(t_rear(i));
                        head = strcat(left, front, point, rear, right);
                        kkk = f.num(i);
                        if(kkk(1) == 0)
                            for k = 2:size(kkk, 2) 
                                if(kkk(k) == 0)
                                    now = k;
                                else
                                    kkk(1:now) = [];
                                    break;
                                end
                            end
                        end
                        mmm = char(kkk + '0');
                    elseif(isempty(f.cell) ~= 1)
                        first = int2str(t_first(i));
                        second  = int2str(t_second(i));
                        third = int2str(t_third(i));
                        head = strcat(left, first, point, second, point, third, right);
                        kkk = f.num(i);
                        if(kkk(1) == 0)
                            for k = 2:size(kkk, 2) 
                                if(kkk(k) == 0)
                                    now = k;
                                else
                                    kkk(1:now) = [];
                                    break;
                                end
                            end
                        end
                        mmm = char(kkk + '0');
                    end
                    final = strcat(head, mmm);
                    %mm = f.make_str();
                    fprintf('%s', final);
                    fprintf('\n');
                end
             else
                 mm = f.make_str();
                fprintf('%s', mm);
             end
             fprintf('\n');
         end
     end
end