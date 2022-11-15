Graph Regularized Probabilistic Matrix Factorization for Drug-Drug Interactions Prediction (https://arxiv.org/pdf/2210.10784.pdf)

Co-administration of two or more drugs simultaneously can result in adverse drug reactions. Identifying drug-drug interactions (DDIs) is necessary, especially for drug development and for repurposing old drugs. DDI prediction can be viewed as a matrix completion task, for which matrix factorization (MF) appears as a suitable solution. This paper presents a novel Graph Regularized Probabilistic Matrix Factorization (GRPMF) method, which incorporates expert knowledge through a novel graph-based regularization strategy within an MF framework. An efficient and sounded optimization algorithm is proposed to solve the resulting non-convex problem in an alternating fashion. The performance of the proposed method is evaluated through the DrugBank dataset, and comparisons are provided against state-of-the-art techniques. The results demonstrate the superior performance of GRPMF when compared to its counterparts.

1. Go to the run.m script
2. Put the algorithm you want to run in the "predictionMethod"
3. Load your train and test data
4. Our data is made publicly available. It can be found in the data_files.zip folder
5. Run the run.m script to get the aupr, auc, precision, recall, f1 score and accuracy
