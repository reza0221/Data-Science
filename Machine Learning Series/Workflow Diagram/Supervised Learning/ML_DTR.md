Data → Preprocessing → Train-Test Split → Initialize Tree → Split Nodes (Recursively) → Calculate Impurity →  
Prune Tree → Validate Hyperparameters → Evaluate → Predict New Data.

Raw Data  
│  
├── **Data Collection** → Verify Integrity  
│  
├── **EDA** → Descriptive Stats → Visualize Relationships → Outlier Detection → Check Feature Distributions  
│  
├── **Preprocessing**:  
│   ├── Missing Values → Impute/Remove  
│   ├── Categorical Encoding → Label/Ordinal Encoding  
│   └── **Feature Engineering** (Optional):  
│       └── Binning Continuous Features  
│  
├── **Split** → Train (70%) → Validation (15%) → Test (15%)  
│  
├── **Model Setup**:  
│   ├── Splitting Criteria → Variance Reduction  
│   ├── Set Hyperparams:  
│       - Max Depth  
│       - Min Samples Split/Leaf  
│       - Max Features  
│       - Pruning (ccp_alpha)  
│  
├── **Training Loop**:  
│   │  
│   ├── Recursive Node Splitting → Minimize Impurity (MSE)  
│   │  
│   ├── Stopping Criteria → Check Depth/Samples  
│   │  
│   └── Prune Tree → Remove Insignificant Nodes  
│  
├── **Hyperparameter Tuning**:  
│   ├── Grid Search/Random Search for Depth, Min Samples, Pruning  
│   ├── Validation Curves → Optimize Tree Complexity  
│   └── Refit Model with Best Params  
│  
├── **Evaluation**:  
│   ├── Test Metrics (MSE, R²)  
│   ├── Residual Analysis → Check Overfitting  
│   └── Feature Importance → Interpret Splits  
│  
├── **Deployment**:  
│   ├── Preprocess New Data → Apply Same Encoding/Binning  
│   ├── Predict → Traverse Tree Rules → Assign Leaf Node Value  
│   └── Save Model + Encoder Config  
│  
└── **Monitoring**:  
    ├── Track Feature Importance Shifts  
    └── Retrain with Updated Splitting Rules  