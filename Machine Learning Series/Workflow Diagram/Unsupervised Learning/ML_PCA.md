Main Flow Diagram for PCA:
Data → Preprocessing → Train-Test Split → Train Base Model (PCA) → Evaluate → Predict New Data.

Detailed Workflow Diagram for PCA:
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
│   ├── Feature Scaling → Standardization (PCA is sensitive to scale)
│   ├── (Optional) Feature Engineering → Polynomial Features, Log Transformations
│   ├── Determine Number of Principal Components (Using Explained Variance Ratio)
│   └── (Optional) Data Augmentation (For Text/Image Data)
│
├── Data Splitting
│   ├── Train (70%) → Used for model training
│   ├── Validation (15%) → Tune hyperparameters (`n_components`)
│   └── Test (15%) → Evaluate dimensionality reduction effectiveness
│
├── Base Model Training (PCA)
│   ├── Compute Covariance Matrix of Features
│   ├── Perform Eigenvalue Decomposition
│   ├── Extract Principal Components (Eigenvectors with Highest Eigenvalues)
│   ├── Determine `n_components` (Dimensionality Reduction Target)
│   ├── Transform Data Into New Feature Space (PC1, PC2, ..., PCn)
│   ├── Check Explained Variance of Each Principal Component
│   ├── Store Principal Component Scores for Further Analysis
│   └── Save PCA Model for Future Use
│
├── Evaluation
│   ├── Visualize Principal Components (e.g., Scatter Plots of PC1 vs PC2)
│   ├── Compute Explained Variance Ratio (Assess Information Retention)
│   ├── Analyze Feature Contributions (Eigenvectors)
│   ├── Check for Information Loss Due to Dimensionality Reduction
│   ├── Compare Performance with and Without PCA (If Used for Supervised Learning)
│   ├── Identify Whether Reduced Features Still Capture Important Patterns
│   └── Tune `n_components` to Balance Dimensionality Reduction vs. Information Retention
│
├── Predict New Data
│   ├── Preprocess New Data (Apply Same Transformations as Training Data)
│   ├── Transform New Data Using Learned PCA Model
│   ├── Store Reduced-Dimensionality Representation of New Data
│   └── Use Reduced Features for Further Tasks (e.g., Clustering, Classification, Visualization)
│
└── Monitoring
    ├── Track PCA Model Stability Over Time
    ├── Monitor Feature Distributions (Ensure Stability in Input Data)
    ├── Recompute PCA If Data Distribution Changes Significantly
    ├── Adjust `n_components` If More/Fewer Features Are Needed
    ├── Evaluate Whether Dimensionality Reduction Still Improves Model Performance
    └── Automate Updates If Necessary (Adaptive Feature Selection)