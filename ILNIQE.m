clear;
templateModel = load('templatemodel.mat');
templateModel = templateModel.templateModel;
mu_prisparam = templateModel{1};
cov_prisparam = templateModel{2};
meanOfSampleData = templateModel{3};
principleVectors = templateModel{4};

Original_image_dir  =    '../../CVPR2017/1_Results/Real_ours/';
fpath = fullfile(Original_image_dir, '*.png');
im_dir  = dir(fpath);
im_num = length(im_dir);
NIQE = [];
for i = 1:im_num
    %% read clean image
    IMname = regexp(im_dir(i).name, '\.', 'split');
    IMname = IMname{1};
    imDis=imread(fullfile(Original_image_dir, im_dir(i).name));
    if size(imDis,3) == 3
        metricValue = computequality(imDis,mu_prisparam,cov_prisparam,principleVectors,meanOfSampleData);
        %imDis is a RGB colorful image
        NIQE = [NIQE metricValue];
    end
end
mILNIQE = mean(NIQE);
fprintf('The average ILNIQE = %2.4f. \n', mILNIQE);
save ../../CVPR2017/1_Results/Real_ours.mat NIQE mILNIQE
