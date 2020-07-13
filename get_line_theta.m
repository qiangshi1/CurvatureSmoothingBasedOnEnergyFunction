function [p] =get_line_theta(line)
% line x,y
    d_=diff(line);
    d_=[d_;[line(1,:)-line(end,:)]];
    t_=atan2( d_(:,2), d_(:,1));
    line(:,3)=t_;
    p=line;
end

