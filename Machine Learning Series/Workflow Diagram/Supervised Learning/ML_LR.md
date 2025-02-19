Raw Data  
│  
├── **Data Collection** → Verify Integrity  
│  
├── **EDA** → Descriptive Stats → Visualizations → Correlation Analysis → Outlier Detection  
│  
├── **Preprocessing** → Missing Values → Categorical Encoding → Feature Scaling → Feature Engineering  
│  
├── **Split** → Train (70%) → Validation (15%) → Test (15%)  
│  
├── **Model Setup** → Initialize θ → Set Hyperparams (α, λ, epochs)  
│  
├── **Training Loop**:  
│   │  
│   ├── Forward Pass → Compute ŷ = Xθ  
│   │  
│   ├── Loss Calculation → MSE + Regularization  
│   │  
│   ├── Backward Pass → Compute Gradients → Update θ (GD/SGD)  
│   │  
│   └── Check Convergence → Early Stopping?  
│       │  
│       └── No → Repeat  
│       └── Yes → Exit Loop  
│  
├── **Hyperparameter Tuning** → Grid Search → Refit Model  
│  
├── **Evaluation** → Test Metrics (MSE, R²) → Residual Diagnostics  
│  
├── **Deployment** → Preprocess New Data → Predict → Save Model  
│  
└── **Monitoring** → Track Performance → Retrain as Needed  

Data → Preprocessing → Train-Test Split → Initialize θ → Compute Predictions → Calculate Loss →  
Update θ via Gradient Descent → Repeat Until Convergence → Evaluate on Test Set → Predict New Data