Getting and Cleaning Data Course Project - ReadMe
=================================================

## Introduction
This ReadMe will serve to describe the course project, dataset and the methodology used to complete the project.

## The Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Methodology
1. The various datasets were downloaded (train/test feature variables, train/test response variables, train/test subjects, feature names, activity labels).
2. The various files were read in to R.
3. The train/test sets were named by their feature names.
4. The feature variables and reponse variables were column bound together for both train/test datasets.
5. Each observation in the train/test data was labelled with their full activity (ie, translating 1 to WALKING).
6. The train/test sets were row bound together.
7. Any feature variable that did not contain either "-mean()" or "-std()" in the name was stripped from the data set.  66 feature variables remain
8. A dataframe with dimension 180x69 was created to store the means of the remaining predictor variables after the column reduction in step 7 above (69 columns = 66 predictor variables + Activity Column + Subject Column + SubjectActivity Column).  There were 180 rows, one for each of the 30*6 possible combinations between Subject (1-30) and Activity (1-6).
9. Each cell in the data frame (i,j) contains the mean value for the ith Subject and the jth predictor variable (j<=66).
10. This tidy dataset is output to df.txt and df2.csv


