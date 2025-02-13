# This is a series of Regression Analysis.
## SLR Main Calculation Flow:
𝐻0, 𝐻𝑎 → 𝛼 → Compute Best-Fitting Line (Least Squares Method) → Compute Test Statistic (Slope & Intercept) → Compute Common Error Variances (Residual Variance, Standard Error) → Compute Goodness of Fit (MSE, RMSE, MAE, R², Pearson Correlation) → Compute Inference and Predictions (Point & Interval Estimations) → Perform Residual Analysis (RSS & Residual Plots) → Identify Leverage and Outliers → Decision.

## SLL Derivative Calculation Flow:
### Flow 1: Parameter Estimation (Least Squares Derivation & Coefficients Interpretation)
𝐻0, 𝐻𝑎 → 𝛼 → Compute Least Squares Solution → Compute Slope (β₁) & Intercept (β₀) → Derive Partial Derivatives → Solve Normal Equations → Decision

### Flow 2: Error Metrics & Variance Estimation
𝐻0, 𝐻𝑎 → 𝛼 → Compute Residual Variance → Compute Standard Errors → Compute MSE, RMSE, MAE → Compute Confidence Intervals → Decision

### Flow 3: Coefficient of Determination (R²) & Limitations
𝐻0, 𝐻𝑎 → 𝛼 → Compute Total Sum of Squares (TSS) → Compute Residual Sum of Squares (RSS) → Compute Explained Sum of Squares (ESS) → Compute R² → Interpret R² → Compare with Adjusted R² → Decision

### Flow 4: Model Assumptions & Residual Diagnostics
𝐻0, 𝐻𝑎 → 𝛼 → Check Linearity → Check Homoscedasticity → Check Normality → Compute Residual Plot → Compute Durbin-Watson Test for Autocorrelation → Decision

### Flow 5: Identifying Leverage Points & Outliers
𝐻0, 𝐻𝑎 → 𝛼 → Compute Leverage (Hat Matrix) → Compute Cook’s Distance → Compute DFFITS → Compute Studentized Residuals → Decision

### Flow 6: SLR Extensions (Non-Linear & Categorical Predictors)
𝐻0, 𝐻𝑎 → 𝛼 → Apply Logarithmic/Polynomial/Inverse Transformations → Compute New Regression Model → Compute Predictions → Compare Performance with SLR → Decision
