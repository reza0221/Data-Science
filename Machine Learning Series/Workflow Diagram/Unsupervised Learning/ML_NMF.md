Main Flow Diagram for NMF:
Data → Preprocessing → Train-Test Split → Train Base Model (NMF) → Evaluate → Predict New Data.

Detailed Workflow Diagram for NMF:
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
│   ├── Feature Scaling → Ensure Non-Negativity (NMF requires non-negative data)
│   ├── (Optional) Apply Initial Dimensionality Reduction (e.g., PCA before NMF)
│   ├── Choose Number of Components (`n_components` determines reduced dimensions)
│   ├── Set Regularization Parameters (L1 or L2 penalty if needed)
│   └── (Optional) Data Augmentation (For Text/Image Data)
│
├── Data Splitting
│   ├── Train (70%) → Used for model training
│   ├── Validation (15%) → Tune `n_components` and other hyperparameters
│   └── Test (15%) → Evaluate dimensionality reduction effectiveness
│
├── Base Model Training (NMF)
│   ├── Factorize Data Matrix `X` into Two Matrices: `W` (basis) and `H` (coefficients)
│   ├── Optimize Objective Function (Minimize Reconstruction Error)
│   ├── Choose Solver (`mu` for multiplicative updates, `cd` for coordinate descent)
│   ├── Tune Hyperparameters (`n_components`, max iterations)
│   ├── Check Convergence (Ensure Factorization is Stable)
│   ├── Store Factorized Matrices (`W` and `H`) for Further Analysis
│   ├── Interpret Meaning of Reduced Features
│   ├── Compare `n_components` Selection Using Reconstruction Error
│   └── Save NMF Model for Future Use
│
├── Evaluation
│   ├── Compute Reconstruction Error (Check Information Retention)
│   ├── Visualize Basis and Coefficient Matrices (`W` and `H`)
│   ├── Compare NMF Results with Other Techniques (e.g., PCA, t-SNE, SVD)
│   ├── Assess Interpretability of Basis Features (Check Feature Contributions)
│   ├── Analyze Cluster Formation in Reduced Space
│   ├── Tune `n_components` to Balance Complexity vs. Interpretability
│   ├── Ensure No Negative Values in Decomposed Matrices
│   └── Validate Consistency Across Different Runs
│
├── Predict New Data
│   ├── Preprocess New Data (Apply Same Transformations as Training Data)
│   ├── Apply Learned NMF Model to Transform New Data (`H_new = W⁻¹ * X_new`)
│   ├── Compare New Data Representation with Previous Factorized Components
│   ├── Store Reduced-Dimensional Representation of New Data
│   └── Use Reduced Features for Further Tasks (e.g., Clustering, Classification)
│
└── Monitoring
    ├── Track NMF Model Stability Over Time
    ├── Monitor Feature Distributions (Ensure Input Data Remains Non-Negative)
    ├── Recompute NMF If Data Distribution Changes Significantly
    ├── Adjust `n_components` If More/Fewer Features Are Needed
    ├── Evaluate Whether Dimensionality Reduction Still Enhances Interpretability
    └── Automate Updates If Necessary (Adaptive Feature Extraction)