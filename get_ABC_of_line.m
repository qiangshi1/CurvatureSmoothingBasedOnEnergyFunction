function [A,B,C] = get_ABC_of_line(line)
%GET_ABC_OF_LINE 由一个点和方向确定的射线确定其Ax+By+C=0 的ABC
%   此处显示详细说明
    x0=line(1,1);
    y0=line(1,2);
    theta=line(1,3);
    A=sin(theta);
    B=-cos(theta);
    C=y0*cos(theta)-x0*sin(theta);
end

