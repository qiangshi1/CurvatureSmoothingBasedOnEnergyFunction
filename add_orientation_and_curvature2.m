% ï¿½ï¿½ï¿½Ó·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿?
% close loop
function a=add_orientation_and_curvature2(b)
if(size(b,1)<3)
    a=[];
else
    a=b;
    orientation=atan2( diff( b(:,2) ),diff( b(:,1) ) );
    orientation_end=atan2( ( b(1,2)-b(end,2) ),( b(1,1)-b(end,1) ) );
    orientation=[orientation;orientation_end];
    a(:,3)=[orientation];
    d=sqrt( diff( b(:,2) ).^2+diff( b(:,1) ).^2 );
    d_end=sqrt( ( b(1,2)-b(end,2) ).^2+( b(1,1)-b(end,1) ).^2 );
    d=[d;d(end)];
    d_orientation=diff(orientation);
    d_orientation_end=orientation(1)-orientation(end);
    d_orientation=[d_orientation;d_orientation_end];
    for i=1:size(d_orientation,1)
        while d_orientation(i)>pi
            d_orientation(i)=d_orientation(i)-2*pi;
        end
         while d_orientation(i)<-pi
            d_orientation(i)=d_orientation(i)+2*pi;
        end
    end
    cur=d_orientation./d;
    a(:,4)=[cur];
end

end