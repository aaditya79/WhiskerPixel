% Initialization of arrays to store cat pixel data
cat = [];
percent_cat = [];
% Initialization of arrays to store grass pixel data
grass = []; percent_grass = [];
for x = 1:6
% Reading cat image and corresponding mask image
% and then rounding and scaling
image_file = strcat('Training_Cat', num2str(x), '.jpg'); image_read = imread(image_file);
mask_image = strcat('Training_Cat', num2str(x), '_mask.jpg'); mask_normalization = double(imread(mask_image)) / 255;
m_bin = logical(round(mask_normalization));
% Collecting uniform random sample of 1000 cat % pixels for each cat image
c_vector = image_read(m_bin);
c_pixel = randsample(c_vector, 1000);
% Collecting uniform random sample of 1000 grass % pixels for each grass image
g_vector = image_read(~m_bin);
g_pixel = randsample(g_vector, 1000);
cat = [cat; c_pixel]; grass = [grass; g_pixel];
% Calculating relative percentages for cat and % grass pixels
count_cat = nnz(m_bin);
count_grass = nnz(~m_bin);
percent_cat = count_cat / (count_cat + count_grass); percent_grass = count_grass / (count_cat + count_grass);
end
disp(percent_cat); disp(percent_grass);
%% Plotting
% The following is adapted from Homework 3
% Plotting two histograms in the same plot for both % cat and grass data
figure
histogram(cat)
hold on;
histogram(grass)
hold off;
title('Histograms of Cat and Grass Data') xlabel('Pixel Values [0, 255]') ylabel('Frequency of Pixels') legend({'Cat', 'Grass'});
%% Method 1: Probability Models
% Model 2 - Gaussian/Normal for Cat Data
% The following is partly adapted from "Project_Example_Code.m" % "*" surround the adapted areas
% Creating normal distribution and finding % the mean and variance
pd = fitdist(cat,'Normal');
var_cat = var(pd);
mean_cat = mean(pd); disp(var_cat); disp(mean_cat);
bin_width = 2;
% Plotting figure of the data and the normal distribution
figure
histogram(cat, 0:bin_width:256, 'Normalization', 'probability') hold on;
% Start ***********************************************************
x = 0:280;
y = zeros(size(x));
% End *************************************************************
% Using normpdf function to find distribution values
for k = 1:length(y)
y(k) = normpdf(x(k), mean_cat, var_cat);
end
% Start ***********************************************************
plot(x, y * bin_width, 'k', 'Linewidth', 4)
% End *************************************************************
hold off;
title('Model 2: Uniform Distribution for Cat Data'); xlabel('Pixel Value [0, 255]');
ylabel('Normalized Frequency of Pixels');
legend({'Cat Training Data Histogram', 'Cat Data PDF Model'})
% Model 1 - Uniform for Grass Data
% Determining a and b from visual approximation
g_a = 5;
g_b = 150;
% Plotting figure of the data and the uniform distribution
figure
histogram(grass, 0:bin_width:256, 'Normalization', 'probability') hold on;
% Start ***********************************************************
x = 0:280;
y = zeros(size(x));
% End *************************************************************
% Using unifpdf function to find distribution values
for k = 1:length(y)
y(k) = unifpdf(x(k), g_a, g_b);
end
% Start ***********************************************************
plot(x, y * bin_width, 'k', 'Linewidth', 4)
% End *************************************************************
hold off;
title('Model 1: Uniform Distribution for Grass Data'); xlabel('Pixel Value [0, 255]');

ylabel('Normalized Frequency of Pixels');
legend({'Grass Training Data Histogram', 'Grass Data PDF Model'})
%% Testing Method 1 Test Image
% The following is partly adapted from "Project_Example_Code.m" % "*" surround the adapted areas
% Reading test cat image and corresponding mask image
% and then rounding and scaling
test_image = imread('Test_Cat.jpg');
mt_bin = logical(round(double(imread('Test_Cat_mask.jpg')) / 255));
% Start *********************************************************** % Initializing variables for classification of data points
s_image = size(test_image);
predicted = zeros(s_image);
classified = zeros(s_image);
% End *************************************************************
% Using
for i = for
% Start
% End *************************************************************
end end
figure
colormap(gray)
imagesc(predicted);
title('Method 1: Pixel Classification of Test Image');
% Calculating the accuracy of the method model
disp(nnz(classified) / numel(test_image));
%% Testing Method 1 Validation Image
% Reading validation cat image
% and converting image to gray scale img = imread('Validation_Img.jpg'); img = rgb2gray(img);
% Initializing variable for classification of data points
predicted = zeros(size(img));
% Using
for i = for
defined decision rule to classify pixels
1:size(img, 1)
j = 1:size(img, 2)
x_dist = double(img(i,j));
f_x_c = normpdf(x_dist, mean_cat, var_cat);
defined decision rule to classify
1:size(test_image, 1)
j = 1:size(test_image, 2)
x_dist = double(test_image(i,j));
f_x_c = normpdf(x_dist, mean_cat, f_x_g = unifpdf(x_dist, g_a, g_b);
class_cat = mean(percent_cat); class_grass = mean(percent_grass);
pixels
var_cat);
if (f_x_g * class_grass) < (f_x_c * class_cat) ***********************************************************
predicted(i,j) = 1;
end
if mt_bin(i,j) == predicted(i,j) classified(i,j) = 1;
end

f_x_g = unifpdf(x_dist, g_a, g_b);
class_cat = mean(percent_cat); class_grass = mean(percent_grass);
if (f_x_g * class_grass) < (f_x_c * class_cat)
% Start ***********************************************************
predicted(i,j) = 1;
% End *************************************************************
end end
end
figure
colormap(gray)
imagesc(predicted);
title('Method 1: Pixel Classification for Validation Image');
