clear;
templateModel = load('templatemodel.mat');
templateModel = templateModel.templateModel;
mu_prisparam = templateModel{1};
cov_prisparam = templateModel{2};
meanOfSampleData = templateModel{3};
principleVectors = templateModel{4};

% read clean image
imDis=imread('palace.png');
metricValue = computequality(imDis,mu_prisparam,cov_prisparam,principleVectors,meanOfSampleData);
%imDis is a RGB colorful image
fprintf('The ILNIQE = %2.4f. \n', metricValue);
