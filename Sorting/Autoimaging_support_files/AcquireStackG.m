function AcquireStackG(stack,CStack)

folder=CStack.folder;
strain=CStack.strain;
fileinfo=CStack.fileinfo;
num=CStack.num;

switch CStack.StackSaveChoices
    case 1
    case 2 %STACK
        file=strcat(folder,strain,'_Stack_',num,'.tif');
        imwrite(stack(:,:,1),file,'Description',fileinfo);
%         file1=strcat(folder,strain,'_StackG_',num,'.tif');
%         file2=strcat(folder,strain,'_StackR_',num,'.tif');
%         imwrite(stack(:,:,1),file,'Description',fileinfo);
%         imwrite(stack2(:,:,1),file2,'Description',fileinfo);
        for i=2:size(stack,3)
            imwrite(stack(:,:,i),file,'WriteMode','append');
%             imwrite(stack2(:,:,i),file2,'WriteMode','append');
        end
    case 3 %FLATTENED
        file=strcat(folder,strain,'_Projection_',num,'.tif');
%         file2=strcat(folder,strain,'_ProjectionR_',num,'.tif');
        imwrite(max(stack,[],3),file,'Description',fileinfo);
%         imwrite(max(stack2,[],3),file2,'Description',fileinfo);
    case 4 %BOTH
        file=strcat(folder,strain,'_Stack_',num,'.tif');
%         file2=strcat(folder,strain,'_StackR_',num,'.tif');
        imwrite(stack(:,:,1),file,'Description',fileinfo);
%         imwrite(stack2(:,:,1),file2,'Description',fileinfo);
        for i=2:size(stack,3)
            imwrite(stack(:,:,i),file,'WriteMode','append');
%             imwrite(stack2(:,:,i),file2,'WriteMode','append');
        end
        file=strcat(folder,strain,'_Projection_',num,'.tif');
%         file2=strcat(folder,strain,'_ProjectionR_',num,'.tif');
        imwrite(max(stack,[],3),file,'Description',fileinfo);
%         imwrite(max(stack2,[],3),file2,'Description',fileinfo);
end
green=stack;%%%% SPECIFY
% red=stack(481:end,:,:);%%%% SPECIFY

% switch CStack.DisplayChoices
%     case 1 %RATIO
%         mr=max(green,[],3);
%         mg=max(red,[],3);
%         imratio=mg./mr;
%         figure(2);imshow(imratio,[],'InitialMagnification','fit','Border','tight');impixelinfo();
%     case 2 %RED
%         m=max(red,[],3);
%         figure(2);imshow(m,[],'InitialMagnification','fit','Border','tight');impixelinfo();
%     case 3 %GREEN
        m=max(green,[],3);
        figure(2);imshow(m,[],'InitialMagnification','fit','Border','tight');impixelinfo();
%     case 4
% end


