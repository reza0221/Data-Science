Data → Preprocessing → Train-Test Split → Bootstrap Sampling → Train Multiple Trees → Feature Subsetting →  
Aggregate Predictions (Averaging) → Validate Hyperparameters → Evaluate → Predict New Data

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
│   ├── Ensemble Parameters → Number of Trees (n_estimators)  
│   ├── Set Hyperparams:  
│       - Max Depth  
│       - Min Samples Split/Leaf  
│       - Max Features (per split)  
│       - Bootstrap Sampling (True/False)  
│  
├── **Training Loop**:  
│   │  
│   ├── For Each Tree:  
│   │   ├── Bootstrap Sample → Random Subset of Training Data  
│   │   ├── Feature Subset → Random Selection of Features  
│   │   ├── Recursive Node Splitting → Minimize Impurity (MSE)  
│   │   └── Grow Unpruned Tree → No Pruning (Default)  
│   │  
│   └── Aggregate Trees → Build Forest  
│  
├── **Hyperparameter Tuning**:  
│   ├── Grid Search/Random Search for n_estimators, max_depth, max_features  
│   ├── Validation Curves → Optimize Forest Complexity  
│   └── Refit Model with Best Params  
│  
├── **Evaluation**:  
│   ├── Test Metrics (MSE, R²)  
│   ├── Residual Analysis → Check Overfitting  
│   └── Feature Importance → Mean Decrease in Impurity  
│  
├── **Deployment**:  
│   ├── Preprocess New Data → Apply Same Encoding/Binning  
│   ├── Predict → Average Predictions Across All Trees  
│   └── Save Model + Encoder Config  
│  
└── **Monitoring**:  
    ├── Track Feature Importance Shifts  
    └── Retrain with Updated Forest  