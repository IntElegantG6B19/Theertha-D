function main_training_GLCM()
for i=1:4
diry=[pwd '\data\' num2str(i)];
   
   feature1=training(diry);
   disp('Tranning');
   
   
    if i==1
        out1 = feature1;
       group=ones(size(feature1(1,:)))*i;
   else
       group1=ones(size(feature1(1,:)))*i;
       group=[group,group1];
       
       out1 =[out1,feature1];
       
    end
       
end

X = out1;
Tc = group;

T = ind2vec(Tc);
net1 = newpnn(X,T,100);


save('net_num11.mat','net1');
% save('Trained3.mat')


msgbox('Training Completed');
end


function out1=training(directory)

       file=dir(directory);
       out1=[];
for i1=3:length(file)
    
       filename=[directory '\' file(i1).name];
       color=imread(filename);
%        color = histeq(color);
       
       color=imresize(color,[32 32]);
%        color=histeq(color1);
      [~,~,n]= size(color);
      if n>1
       color = rgb2gray(color);
      end     
      % Feature extraction
      [GLCMS,~] = graycomatrix(color,'NumLevels',32,'G',[]);
     F_GLCM1 = GLCMS./100;
     F_GLCM = F_GLCM1(:)';
     F_LBP = double(color(:)');
     
      out1(:,i1-2) = [F_LBP,F_GLCM]';


end


end
   
   
   
   
   
   
   