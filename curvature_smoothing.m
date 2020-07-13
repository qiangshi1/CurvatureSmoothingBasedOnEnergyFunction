line=roa;
init_line=line;
max_cir=100000;
cir=max_cir;
num_ite=20;
max_cir=cir;
Fig1=figure(23);axis equal;
Fig2=Fig1;
init_here=1;
m=0;
ref_m=0;
while cir>0
    if(mod(max_cir-cir,200)==0)
        subplot(1,2,1);
        plot([line(:,1);line(1,1)],[line(:,2);line(1,2)],'k');axis equal;axis([-1,6,-1,6]);
        xlabel('X: m');
        ylabel('Y: m');
        line=add_orientation_and_curvature2(line);
        subplot(1,2,2);
        x=1:size(line,1);
        x=x/size(line,1);
        x=x';
        plot(x,line(:,4),'k');
        xlabel('Path length normalization parameter');
        ylabel('Curvature: m^-^1');
        axis([0,1,-1,7]);
        pause(0.0001);
    end
    for i=1:size(line,1)
        this_seg_index=get_seg_index(i,size(line,1));
        rm_p3=get_line_theta(line(this_seg_index([1:3,5:7]),1:2));
        d_theta=diff(rm_p3(1:6,3));
        for mm=1:size(d_theta)
            while(d_theta(mm)<-pi)
                d_theta(mm)=d_theta(mm)+2*pi;
            end
            while(d_theta(mm)>pi)
                d_theta(mm)=d_theta(mm)-2*pi;
            end
        end
        theta3=(4*d_theta(2)+4*d_theta(3)-d_theta(1)-d_theta(4))/10;
        lin1=[ line(this_seg_index(3),1),line(this_seg_index(3),2), rm_p3(3,3)-theta3/2 ];
        lin2=[get_center_point(rm_p3(3,1:2),rm_p3(4,1:2)),rm_p3(3,3)+pi/2 ];
        cannot_move_line=0;
        if cannot_move_line==0
            line(this_seg_index(4),1:2)=cross_point_between_line_and_line(lin1,lin2);
        else
            cannot_move_line=1;
        end
    end
    cir=cir-1;
end
