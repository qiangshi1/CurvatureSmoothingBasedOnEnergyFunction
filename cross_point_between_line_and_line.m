function [point,is] = cross_point_between_line_and_line(line,line1)
%CROSS_POINT_BETWEEN_CRIRCLE_AND_ARROW 直线与圆的交点
%   此处显示详细说明
is=0;
point=[];
[A,B,C]=get_ABC_of_line(line);
[A1,B1,C1]=get_ABC_of_line(line1);
if abs(A*B1-A1*B)<=0.000000001   %%平行
    is=0;
    point=[];
else
    x=-(B1*C-B*C1)/(B1*A-B*A1);
    y=-(A1*C-A*C1)/(A1*B-A*B1);
    is=1;
    point=[x,y];
end 
end

