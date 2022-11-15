clc
close all
clear all
predictionMethod ='GPMF_1layer';%'grmf'%'GPMF_1layer'%'mgrnnm'%'MF_MC_latest' %'GPMF_1layer'%'gr1bmc_ppxa'%'mc 'dmf'%'mf' %'grmc_admm' %'grmf' 
% % read virus-drug assocaitions

% MATRICES WITHOUT SARS COV 2
% load('data_processed/virus_drug_association_first.mat')
% mat=mat'; %size of data matrix: #drugsx#vir

global Sd
% load('C:/Users/Stuti/Desktop/CVN/GPMF_FINAL/data_processed/ddi_matrix.mat')
% load('C:/Users/Stuti/Desktop/CVN/GPMF_FINAL/data_processed/dd_sim.mat')
% load('data_processed/first_drug_sim_matrix.mat')
% load('data_processed/vir_sim_matrix_first.mat')
% load('data_processed/drugs_moa_sim.mat')
% load('data_processed/virus_symptoms_sim_second_cos.mat')
% load('data_processed/virus_drug_association_first.mat')
% load('data_processed/RnaDna/drug_sim_matrix.mat')
% load('data_processed/RnaDna/vir_sim_matrix.mat')
% load('data_processed/RnaDna/virus_drug_association.mat')
%**************************************************************************
% Y = xlsread('Drug_Interaction_Set2.xlsx');
% Sd = xlsread('Drug_Similarity_Set2.xlsx');
%**************************************************************************
%% June 29th 2022 Change in train data
cd data_files
% cd revised_data_files_29_June_2022
Y = xlsread('Drug_Interaction_Set2_rev.xlsx');
Sd = xlsread('Drug_Similarity_Set2_rev.xlsx');
train_ind = xlsread('X_train_Set2_rev.xlsx');
test_ind = xlsread('X_test_Set2_rev.xlsx');
cd ..
cd ..

rows1 = test_ind(:,1)+1;
cols1 = test_ind(:,2)+1;

sz = [927 927];
test_ind = sub2ind(sz,rows1,cols1);

rows2 = train_ind(:,1)+1;
cols2 = train_ind(:,2)+1;

train_ind = sub2ind(sz,rows2,cols2);
%Y=mat;
% mat
% Sd 

%----add dependencies to path----
addpath(genpath('helper_functions'));

%----define parameters----
n = 1;% 'n' in "n-fold experiment"  


tic
for cv_setting=[11] %8
   
getParameters(predictionMethod,cv_setting)
[ auc,aupr,pre,rec,f1, acc]=get_CV_results(Y,n,cv_setting,predictionMethod, train_ind, test_ind);
   
auc
aupr
pre
rec
f1
acc
metrics =[aupr auc pre rec f1 acc];

end
toc