classdef Point3
    properties
        x = [];
        y = [];
        z = [];
    end
     methods
         function obj = Point3(in1, in2, in3)
             if nargin == 0
                 obj.x = [0];
                 obj.y = [0];
                 obj.z = [0];
             elseif nargin == 3 
                if isnumeric(in1) & isnumeric(in2) &isnumeric(in3)
                    disp('array');
                    obj.x = in1;
                    obj.y = in2;
                    obj.z = in3;
                    disp(obj.x);
                    disp(obj.y);
                    disp(obj.z);
                end  
             else
                error('Input error!');
             end
         end
         function n = norm(in1)
             if (isa(in1,'Point3') == 1) 
                 norm_ans = [];
                 for i = 1:size(in1.x, 1)*size(in1.x, 2)
                    tmp = [in1.x(i) in1.y(i) in1.z(i)];
                    norm_tmp = norm(tmp);
                    norm_ans = [norm_ans norm_tmp];
                 end
                 n = reshape(norm_ans, [], size(in1.x, 2));
             end
         end
         function m = minus(in1, in2)
             m = Point3();
             if (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 0) 
                m1_x = in1.x;
                m1_y = in1.y;
                m1_z = in1.z;
                
                mt1_m2_x = [];
                for i = 1:size(in1.x, 1)*size(in1.x, 2)
                    mt1_m2_x  = [mt1_m2_x  in2];
                end
                m2_x = reshape(mt1_m2_x, [], size(in1.x, 2));
                m2_y = m2_x;
                m2_z = m2_x;
            elseif (isa(in1,'Point3') == 0) & (isa(in2,'Point3') == 1)
                mt2_m1_x = [];
                for i = 1:size(in2.x, 1)*size(in2.x, 2)
                    mt2_m1_x  = [mt2_m1_x  in1];
                end
                m1_x = reshape(mt2_m1_x, [], size(in2.x, 2));
                m1_y = m1_x;
                m1_z = m1_x;
                
                m2_x = in2.x;
                m2_y = in2.y;
                m2_z = in2.z;
            elseif (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 1)
                    m1_x = in1.x;
                    m1_y = in1.y;
                    m1_z = in1.z;
                    m2_x = in2.x;
                    m2_y = in2.y;
                    m2_z = in2.z;
                %error('Input error!');
             end
            m_x_ans = m1_x - m2_x;
            m_y_ans = m1_y - m2_y;
            m_z_ans = m1_z - m2_z;
            m = Point3(m_x_ans, m_y_ans, m_z_ans);
         end
         function p = plus(in1, in2)
             p = Point3();
             if (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 0) 
                p1_x = in1.x;
                p1_y = in1.y;
                p1_z = in1.z;
                
                pt1_p2_x = [];
                for i = 1:size(in1.x, 1)*size(in1.x, 2)
                    pt1_p2_x  = [pt1_p2_x  in2];
                end
                p2_x = reshape(pt1_p2_x, [], size(in1.x, 2));
                p2_y = p2_x;
                p2_z = p2_x;
            elseif (isa(in1,'Point3') == 0) & (isa(in2,'Point3') == 1)
                pt2_p1_x = [];
                for i = 1:size(in2.x, 1)*size(in2.x, 2)
                    pt2_p1_x  = [pt2_p1_x  in1];
                end
                p1_x = reshape(pt2_p1_x, [], size(in2.x, 2));
                p1_y = p1_x;
                p1_z = p1_x;
                
                p2_x = in2.x;
                p2_y = in2.y;
                p2_z = in2.z;
            elseif (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 1)
                    p1_x = in1.x;
                    p1_y = in1.y;
                    p1_z = in1.z;
                    p2_x = in2.x;
                    p2_y = in2.y;
                    p2_z = in2.z;
                %error('Input error!');
             end
            p_x_ans = p1_x + p2_x;
            p_y_ans = p1_y + p2_y;
            p_z_ans = p1_z + p2_z;
            p = Point3(p_x_ans, p_y_ans, p_z_ans);
         end
         function e = eq(in1, in2)
            e = Point3();
            if (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 0) 
                e1_x = in1.x;
                e1_y = in1.y;
                e1_z = in1.z;
                
                et1_e2_x = [];
                for i = 1:size(in1.x, 1)*size(in1.x, 2)
                    et1_e2_x  = [et1_e2_x  in2];
                end
                e2_x = reshape(et1_e2_x, [], size(in1.x, 2));
                e2_y = e2_x;
                e2_z = e2_x;
            elseif (isa(in1,'Point3') == 0) & (isa(in2,'Point3') == 1)
                et2_e1_x = [];
                for i = 1:size(in2.x, 1)*size(in2.x, 2)
                    et2_e1_x  = [et2_e1_x  in1];
                end
                e1_x = reshape(et2_e1_x, [], size(in2.x, 2));
                e1_y = e1_x;
                e1_z = e1_x;
                
                e2_x = in2.x;
                e2_y = in2.y;
                e2_z = in2.z;
            elseif (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 1)
                    e1_x = in1.x;
                    e1_y = in1.y;
                    e1_z = in1.z;
                    e2_x = in2.x;
                    e2_y = in2.y;
                    e2_z = in2.z;
            end
            e_tmp1 = [];
            for i = 1:size(in1.x, 1)*size(in1.x, 2)
                e_tmp = all((e1_x(i)==e2_x(i)) & (e1_y(i)==e2_y(i)) & (e1_z(i)==e2_z(i)));
                e_tmp1 = [e_tmp1 e_tmp];
            end
            e = reshape(e_tmp1, [], size(in1.x, 2));
         end
         function s = sum(in1, in2)
             s = Point3();
             s1_x = in1.x;
             s1_y = in1.y;
             s1_z = in1.z;
             s_x_ans = [];
             s_y_ans = [];
             s_z_ans = [];
             if nargin == 1
                 for i = 1:size(in1.x, 2)
                    s_x_tmp1 = 0;
                    s_y_tmp1 = 0;
                    s_z_tmp1 = 0;
                    for j = 1:size(in1.x, 1)
                        s_x_tmp1 = s_x_tmp1 + s1_x(j, i);
                        s_y_tmp1 = s_y_tmp1 + s1_y(j, i);
                        s_z_tmp1 = s_z_tmp1 + s1_z(j, i);
                    end
                    s_x_ans = [s_x_ans s_x_tmp1];
                    s_y_ans = [s_y_ans s_y_tmp1];
                    s_z_ans = [s_z_ans s_z_tmp1];
                 end
             elseif nargin == 2
                 if (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 0) 
                    if(in2 == 1)
                        for i = 1:size(in1.x, 2)
                            s_x_tmp2 = 0;
                            s_y_tmp2 = 0;
                            s_z_tmp2 = 0;
                            for j = 1:size(in1.x, 1)
                                s_x_tmp2 = s_x_tmp2 + s1_x(j, i);
                                s_y_tmp2 = s_y_tmp2 + s1_y(j, i);
                                s_z_tmp2 = s_z_tmp2 + s1_z(j, i);
                            end
                            s_x_ans = [s_x_ans s_x_tmp2];
                            s_y_ans = [s_y_ans s_y_tmp2];
                            s_z_ans = [s_z_ans s_z_tmp2];
                         end
                    elseif(in2 == 2)
                        for i = 1:size(in1.x, 1)
                            s_x_tmp3 = 0;
                            s_y_tmp3 = 0;
                            s_z_tmp3 = 0;
                            for j = 1:size(in1.x, 2)
                                s_x_tmp3 = s_x_tmp3 + s1_x(i, j);
                                s_y_tmp3 = s_y_tmp3 + s1_y(i, j);
                                s_z_tmp3 = s_z_tmp3 + s1_z(i, j);
                            end
                            s_x_ans = [s_x_ans; s_x_tmp3];
                            s_y_ans = [s_y_ans; s_y_tmp3];
                            s_z_ans = [s_z_ans; s_z_tmp3];
                         end
                    end
                 end
             end
             s = Point3(s_x_ans, s_y_ans, s_z_ans);
         end
         function mn = mean(in1, in2)
             mn = Point3();
             mn1_x = in1.x;
             mn1_y = in1.y;
             mn1_z = in1.z;
             mn_x_ans = [];
             mn_y_ans = [];
             mn_z_ans = [];
             if nargin == 1
                 for i = 1:size(in1.x, 2)
                    mn_x_tmp1 = 0;
                    mn_y_tmp1 = 0;
                    mn_z_tmp1 = 0;
                    for j = 1:size(in1.x, 1)
                        mn_x_tmp1 = mn_x_tmp1 + mn1_x(j, i);
                        mn_y_tmp1 = mn_y_tmp1 + mn1_y(j, i);
                        mn_z_tmp1 = mn_z_tmp1 + mn1_z(j, i);
                    end
                    mn_x_ans = [mn_x_ans mn_x_tmp1 / size(in1.x, 1)];
                    mn_y_ans = [mn_y_ans mn_y_tmp1 / size(in1.x, 1)];
                    mn_z_ans = [mn_z_ans mn_z_tmp1 / size(in1.x, 1)];
                 end
             elseif nargin == 2
                 if (isa(in1,'Point3') == 1) & (isa(in2,'Point3') == 0) 
                    if(in2 == 1)
                        for i = 1:size(in1.x, 2)
                            mn_x_tmp2 = 0;
                            mn_y_tmp2 = 0;
                            mn_z_tmp2 = 0;
                            for j = 1:size(in1.x, 1)
                                mn_x_tmp2 = mn_x_tmp2 + mn1_x(j, i);
                                mn_y_tmp2 = mn_y_tmp2 + mn1_y(j, i);
                                mn_z_tmp2 = mn_z_tmp2 + mn1_z(j, i);
                            end
                            mn_x_ans = [mn_x_ans mn_x_tmp2 / size(in1.x, 1)];
                            mn_y_ans = [mn_y_ans mn_y_tmp2 / size(in1.x, 1)];
                            mn_z_ans = [mn_z_ans mn_z_tmp2 / size(in1.x, 1)];
                         end
                    elseif(in2 == 2)
                        for i = 1:size(in1.x, 1)
                            mn_x_tmp3 = 0;
                            mn_y_tmp3 = 0;
                            mn_z_tmp3 = 0;
                            for j = 1:size(in1.x, 2)
                                mn_x_tmp3 = mn_x_tmp3 + mn1_x(i, j);
                                mn_y_tmp3 = mn_y_tmp3 + mn1_y(i, j);
                                mn_z_tmp3 = mn_z_tmp3 + mn1_z(i, j);
                            end
                            mn_x_ans = [mn_x_ans; mn_x_tmp3 / size(in1.x, 2)];
                            mn_y_ans = [mn_y_ans; mn_y_tmp3 / size(in1.x, 2)];
                            mn_z_ans = [mn_z_ans; mn_z_tmp3 / size(in1.x, 2)];
                         end
                    end
                 end
             end
             mn = Point3(mn_x_ans, mn_y_ans, mn_z_ans);
         end
         function disp(f)
             left = '(';
             point = ',';
             right = ')';
             for i = 1:size(f.x, 1)
                 for j = 1:size(f.x, 2)
                    out = [];
                    c_x = num2str(f.x(i, j));
                    c_y = num2str(f.y(i, j));
                    c_z = num2str(f.z(i, j));
                    out = strcat(left, c_x, point, c_y, point, c_z, right);
                    fprintf('%15s', out);
                 end
                 fprintf('\n');
             end
         end
     end
end