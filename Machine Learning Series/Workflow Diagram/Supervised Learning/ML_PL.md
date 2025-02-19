Raw Data  
│  
├── **Data Collection** → Verify Integrity  
│  
├── **EDA** → Descriptive Stats → Visualize Nonlinear Trends → Correlation Analysis → Outlier Detection  
│  
├── **Preprocessing**:  
│   ├── Missing Values → Impute/Remove  
│   ├── Categorical Encoding → One-Hot/Ordinal  
│   ├── Feature Scaling → Standardize/Normalize  
│   └── **Feature Engineering**:  
│       └── Generate Polynomial & Interaction Terms (e.g., \( x_1^2, x_1x_2 \))  
│  
├── **Split** → Train (70%) → Validation (15%) → Test (15%)  
│  
├── **Model Setup**:  
│   ├── Initialize θ (coefficients for polynomial terms)  
│   ├── Set Hyperparams:  
│       - Polynomial Degree (e.g., 2, 3)  
│       - Learning Rate (\( \alpha \))  
│       - Regularization (\( \lambda \), optional)  
│       - Epochs  
│  
├── **Training Loop**:  
│   │  
│   ├── Forward Pass → Compute ŷ = \( X_{\text{poly}} \theta \)  
│   │  
│   ├── Loss Calculation → MSE (+ L1/L2 Regularization)  
│   │  
│   ├── Backward Pass → Compute Gradients → Update θ (GD/SGD)  
│   │  
│   └── Check Convergence → Early Stopping?  
│       │  
│       └── No → Repeat  
│       └── Yes → Exit Loop  
│  
├── **Hyperparameter Tuning**:  
│   ├── Optimize Polynomial Degree (Validation Curves)  
│   ├── Grid Search for \( \alpha \), \( \lambda \), Degree  
│   └── Refit Model  
│  
├── **Evaluation**:  
│   ├── Test Metrics (MSE, R²)  
│   ├── Residual Diagnostics → Check for Overfitting  
│   └── Learning Curves (Bias-Variance Tradeoff)  
│  
├── **Deployment**:  
│   ├── Preprocess New Data → Apply Polynomial Transformation  
│   ├── Predict → \( \hat{y}_{\text{new}} = X_{\text{new, poly}} \theta \)  
│   └── Save Model + Polynomial Config (e.g., degree)  
│  
└── **Monitoring**:  
    ├── Track Prediction Drift (Data Shift Detection)  
    └── Retrain with Updated Polynomial Terms  

Data → Preprocessing (Polynomial Features) → Train-Test Split → Initialize θ → Compute Predictions →  
Calculate Loss → Update θ via Gradient Descent → Repeat Until Convergence → Evaluate → Predict New Data  