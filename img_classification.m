function out = img_classification(img)
load 'net_num11.mat'
[~,~,k] = size(img);
if k==3
    img = rgb2gray(img);
    img = imresize(img,[32 32]);
end 

        img = imresize(img,[32 32]);
        GLCM = graycomatrix(img); 
        out = net1(GLCM(:));
        

end