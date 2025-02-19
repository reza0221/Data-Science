Main Flow Diagram (GBM Regression):
Data → Preprocessing → Train-Test Split → Initialize Model → Compute Initial Prediction → Calculate Residuals → Fit Weak Learner → Update Predictions → Repeat Until Convergence → Validate Hyperparameters → Evaluate → Predict New Data

Detailed Flow Diagram (GBM Regression):
Raw Data  
│  
├── **Data Collection** → Verify Data Integrity  
│  
├── **Exploratory Data Analysis (EDA)**  
│   ├── Descriptive Statistics  
│   ├── Visualize Relationships  
│   ├── Outlier Detection  
│   └── Check Feature Distributions  
│  
├── **Preprocessing**:  
│   ├── Handle Missing Values → Impute or Remove  
│   ├── Categorical Encoding → Label or One-Hot Encoding  
│   ├── Feature Scaling → Standardization/Normalization  
│   └── (Optional) Feature Engineering → Polynomial Features, Interaction Terms  
│  
├── **Data Splitting**:  
│   ├── Train (70%)  
│   ├── Validation (15%)  
│   └── Test (15%)  
│  
├── **Model Setup**:  
│   ├── Set Hyperparameters:  
│   │   ├── Learning Rate (Shrinkage)  
│   │   ├── Number of Estimators (Trees)  
│   │   ├── Max Depth of Trees  
│   │   ├── Min Samples Split & Leaf  
│   │   ├── Subsampling Ratio  
│   │   └── Loss Function (e.g., Squared Error)  
│  
├── **Boosting Process**:  
│   ├── Compute Initial Prediction (Mean of Target Variable)  
│   ├── For Each Iteration (Estimator):  
│   │   ├── Compute Residuals (Errors from Previous Model)  
│   │   ├── Train Weak Learner (Decision Tree on Residuals)  
│   │   ├── Update Predictions (Adjust with Learning Rate)  
│   │   ├── Repeat Until Number of Estimators is Reached  
│  
├── **Hyperparameter Tuning**:  
│   ├── Grid Search / Random Search for Learning Rate, Trees, Max Depth  
│   ├── Cross-Validation on Training/Validation Sets  
│   └── Select Best Hyperparameters  
│  
├── **Evaluation**:  
│   ├── Compute Evaluation Metrics (MSE, R²)  
│   ├── Residual Analysis → Check for Overfitting  
│   └── Feature Importance → Gain from Each Split  
│  
├── **Deployment**:  
│   ├── Preprocess New Data (Apply Same Scaling/Encoding)  
│   ├── Compute Residuals & Update Predictions Iteratively  
│   ├── Predict Final Output  
│   └── Save Model Configuration & Preprocessing Pipeline  
│  
└── **Monitoring**:  
    ├── Track Feature Importance & Model Drift  
    └── Update Model as New Data Becomes Available