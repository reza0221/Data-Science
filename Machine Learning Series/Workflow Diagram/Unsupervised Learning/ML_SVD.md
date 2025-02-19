Main Flow Diagram Format for SVD:
Data → Preprocessing → Train-Test Split → Train Base Model (SVD) → Evaluate → Predict New Data.

Detailed Workflow Diagram Format for SVD:
Raw Data
│
├── Data Collection → Verify Data Integrity
│
├── Exploratory Data Analysis (EDA)
│   ├── Descriptive Statistics
│   ├── Visualize Relationships Between Features
│   ├── Identify Correlations Between Features
│   ├── Outlier Detection
│   └── Check Feature Distributions
│
├── Preprocessing
│   ├── Handle Missing Values → Impute or Remove
│   ├── Categorical Encoding → Label Encoding or One-Hot Encoding (if applicable)
│   ├── Feature Scaling → Standardization (SVD is sensitive to scale)
│   ├── (Optional) Feature Engineering → Polynomial Features, Log Transformations
│   ├── Determine Number of Singular Vectors/Values (Using Explained Variance)
│   └── (Optional) Data Augmentation (For Text/Image Data)
│
├── Data Splitting
│   ├── Train (70%) → Used for model training
│   ├── Validation (15%) → Tune hyperparameters (`n_components`)
│   └── Test (15%) → Evaluate dimensionality reduction effectiveness
│
├── Base Model Training (SVD)
│   ├── Compute Singular Value Decomposition (U, Σ, V^T)
│   ├── Perform Dimensionality Reduction (Truncate Σ)
│   ├── Determine `n_components` (Number of Singular Values to Retain)
│   ├── Transform Data into Reduced Space (Using U, Σ)
│   ├── Check Explained Variance of Each Singular Vector
│   ├── Store Singular Values and Vectors for Later Use
│   └── Save SVD Model for Future Use
│
├── Evaluation
│   ├── Visualize Data in Reduced Space (e.g., 2D/3D plots of components)
│   ├── Compute Explained Variance Ratio (Assess Information Retention)
│   ├── Analyze Feature Contributions (Singular Vectors)
│   ├── Check for Information Loss Due to Dimensionality Reduction
│   ├── Compare Performance with and Without SVD (If Used for Supervised Learning)
│   ├── Identify Whether Reduced Features Still Capture Important Patterns
│   └── Tune `n_components` to Balance Dimensionality Reduction vs. Information Retention
│
├── Predict New Data
│   ├── Preprocess New Data (Apply Same Transformations as Training Data)
│   ├── Transform New Data Using Learned SVD Model
│   ├── Store Reduced-Dimensionality Representation of New Data
│   └── Use Reduced Features for Further Tasks (e.g., Clustering, Classification, Visualization)
│
└── Monitoring
    ├── Track SVD Model Stability Over Time
    ├── Monitor Feature Distributions (Ensure Stability in Input Data)
    ├── Recompute SVD If Data Distribution Changes Significantly
    ├── Adjust `n_components` If More/Fewer Features Are Needed
    ├── Evaluate Whether Dimensionality Reduction Still Improves Model Performance
    └── Automate Updates If Necessary (Adaptive Feature Selection)