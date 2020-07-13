function [seg_index] = get_seg_index(i,n)
%GET_SEG_INDEX 获取seg index 一共6个

if(i>n)
    seg_index=[];
    return;
elseif i<1
    return;
end
seg_index=i-3:1:i+3;
for j=1:size(seg_index,2)
    if(seg_index(j)<1)
        seg_index(j)=seg_index(j)+n;
    elseif(seg_index(j)>n) 
        seg_index(j)=seg_index(j)-n;
    end
end
end

