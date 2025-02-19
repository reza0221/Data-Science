Main Flow:
Data → Preprocessing → Train-Test Split → Select k & Distance Metric → Compute Distances → Identify k Nearest Neighbors → Aggregate Predictions (Averaging) → Validate Hyperparameters → Evaluate → Predict New Data.

Detailed Flow:
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
│   └── (Optional) Feature Engineering → Binning, Polynomial Features  
│  
├── **Data Splitting**:  
│   ├── Train (70%)  
│   ├── Validation (15%)  
│   └── Test (15%)  
│  
├── **Model Setup**:  
│   ├── Set Hyperparameters:  
│   │   ├── Number of Neighbors (k)  
│   │   ├── Distance Metric (e.g., Euclidean, Manhattan)  
│   │   └── Weighting Scheme (Uniform or Distance-Based)  
│  
├── **Prediction Process**:  
│   ├── For Each Test (or New) Instance:  
│   │   ├── Compute Distances to All Training Instances  
│   │   ├── Identify the k Nearest Neighbors  
│   │   └── Aggregate Neighbors’ Target Values (Averaging/Weighted Average)  
│  
├── **Hyperparameter Tuning**:  
│   ├── Grid Search or Random Search over k and Distance Metrics  
│   ├── Cross-Validation on Training/Validation Sets  
│   └── Select Best Hyperparameters  
│  
├── **Evaluation**:  
│   ├── Compute Evaluation Metrics (MSE, R²)  
│   ├── Residual Analysis → Check for Systematic Errors  
│   └── Compare Performance Across Different Hyperparameter Settings  
│  
├── **Deployment**:  
│   ├── Preprocess New Data (Apply Same Scaling/Encoding)  
│   ├── Compute Distances and Identify Neighbors  
│   ├── Aggregate Predictions  
│   └── Save Model Configuration and Preprocessing Pipeline  
│  
└── **Monitoring**:  
    ├── Track Prediction Performance Over Time  
    └── Update Model as New Data Becomes Available  
