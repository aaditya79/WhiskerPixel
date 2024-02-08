# Data Classification #
## Introduction ##
The following project follows with the idea of developing a program to observe pixels and detect whether each pixel should be classified as “cat” pixel or “grass” pixel. We will collect data, form a probabilistic model, define a classification rule, and apply the rule to the test image and validation image. Through this process, we will be able to understand the effectiveness of the probability distributions chosen to model the data and the limitations of the classification rule derived.

There are six training images and corresponding binary classification masks provided within “Project_Data.zip”, which can be used to collect data and form the probability models. These training images are categorized as either “cat” or “grass” pixels and named “Training_CatX.jpg” and “Training_CatX_mask.jpg”, where “X” is replaced with the numbers 1-6. Using the MATLAB function randsample, we can conduct the process of random sampling. Random sampling is conducted through collecting 1000 random samples of “cat” pixels from the training image. This will result in a total of 6000 random samples of “cat” pixels from all the six training images. Similarly, we can collect 1000 random samples of “grass” pixels from the training image. This will result in a total of 6000 random samples of “grass” pixels from all the six training images. Note that since we are picking these pixels using a random sampling MATLAB function, we will assume that the samples are collected without replacement. From these 6000 random samples of both “cat” and “grass” pixels, we can compute the percentage of pixels that relate to either category. Then after,  we can use this percentage to model the probability density of “cat” versus “grass” pixels. 

## Results Method 1 ##

### Test Image ###
<img width="468" alt="image" src="https://github.com/aaditya79/Data-Classification/assets/71707744/ba626445-e5bc-412d-a8ca-1c2512f723f6">

### Origial Validation Image ###
<img width="468" alt="image" src="https://github.com/aaditya79/Data-Classification/assets/71707744/25244806-55bc-4035-bd08-3509cd92ec0e">

### Validation Image (Accuracy: 94.15%) ###
<img width="468" alt="image" src="https://github.com/aaditya79/Data-Classification/assets/71707744/ef9b35dd-f4b3-4d40-831d-a8c8e1048071">


## Results Method 2 ##

### Test Image ###
<img width="468" alt="image" src="https://github.com/aaditya79/Data-Classification/assets/71707744/feba6f8c-16dd-4fe4-9698-cece8121f503">

### Origial Validation Image ###
<img width="468" alt="image" src="https://github.com/aaditya79/Data-Classification/assets/71707744/9e728f70-e342-44a9-ad69-77ac498b8d19">

### Validation Image (Accuracy: 95.08%) ###
<img width="468" alt="image" src="https://github.com/aaditya79/Data-Classification/assets/71707744/48903ffb-4737-4071-a5f7-891fe87bf912">



