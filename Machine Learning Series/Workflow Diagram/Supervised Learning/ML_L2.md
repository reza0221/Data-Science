Raw Data  
│  
├── **Data Collection** → Verify Integrity  
│  
├── **EDA** → Descriptive Stats → Visualize Relationships → Correlation Analysis → Outlier Detection  
│  
├── **Preprocessing**:  
│   ├── Missing Values → Impute/Remove  
│   ├── Categorical Encoding → One-Hot/Ordinal  
│   ├── Feature Scaling → Standardize/Normalize  
│   └── **Feature Engineering** (Optional):  
│       └── Generate Polynomial/Interaction Terms (if nonlinearity suspected)  
│  
├── **Split** → Train (70%) → Validation (15%) → Test (15%)  
│  
├── **Model Setup**:  
│   ├── Initialize θ (coefficients) → Zeros/Random Values  
│   ├── Set Hyperparams:  
│       - Learning Rate (\( \alpha \))  
│       - Regularization Strength (\( \lambda \))  
│       - Epochs  
│       - Polynomial Degree (if using polynomial terms)  
│  
├── **Training Loop**:  
│   │  
│   ├── Forward Pass → Compute ŷ = \( X\theta \)  
│   │  
│   ├── Loss Calculation → MSE + \( \lambda \sum_{j=1}^n \theta_j^2 \)  
│   │  
│   ├── Backward Pass → Compute Gradients:  
│       - \( \frac{\partial J}{\partial \theta_j} = \frac{1}{m} \sum_{i=1}^m (ŷ^{(i)} - y^{(i)})x_j^{(i)} + \frac{\lambda}{m} \theta_j \)  
│   │  
│   ├── Update θ → \( \theta_j := \theta_j - \alpha \frac{\partial J}{\partial \theta_j} \)  
│   │  
│   └── Check Convergence → Early Stopping?  
│       │  
│       └── No → Repeat  
│       └── Yes → Exit Loop  
│  
├── **Hyperparameter Tuning**:  
│   ├── Grid Search/Random Search for \( \lambda \), \( \alpha \), Degree (if polynomial)  
│   ├── Validation Curves → Optimize \( \lambda \)  
│   └── Refit Model with Best \( \lambda \)  
│  
├── **Evaluation**:  
│   ├── Test Metrics (MSE, R²)  
│   ├── Residual Analysis → Check Homoscedasticity  
│   └── Compare Training vs. Test Loss → Diagnose Overfitting  
│  
├── **Deployment**:  
│   ├── Preprocess New Data → Apply Same Scaling/Encoding  
│   ├── Predict → \( \hat{y}_{\text{new}} = X_{\text{new}}\theta \)  
│   └── Save Model + Scaler + \( \lambda \) Configuration  
│  
└── **Monitoring**:  
    ├── Track Feature Distribution Shifts  
    └── Retrain with Updated Data → Re-tune \( \lambda \)  

Data → Preprocessing → Train-Test Split → Initialize θ → Compute Predictions → Calculate Loss (MSE + L2 Penalty) →  
Update θ via Gradient Descent → Repeat Until Convergence → Evaluate → Predict New Data  