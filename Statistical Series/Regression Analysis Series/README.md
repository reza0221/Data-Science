# This is a series of Regression Analysis.
## SLR Main Calculation Flow:
𝐻0, 𝐻𝑎 → 𝛼 → Compute Best-Fitting Line (Least Squares Method) → Compute Test Statistic (Slope & Intercept) → Compute Common Error Variances (Residual Variance, Standard Error) → Compute Goodness of Fit (MSE, RMSE, MAE, R², Pearson Correlation) → Compute Inference and Predictions (Point & Interval Estimations) → Perform Residual Analysis (RSS & Residual Plots) → Identify Leverage and Outliers → Decision.

## SLR Derivative Calculation Flows:
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

## MLR Main Calculation Flow:
𝐻0, 𝐻𝑎 → 𝛼 → Compute Best-Fitting Line (Least Squares Method & Matrix Form Solution) → Compute Test Statistic (Estimate β Coefficients via OLS, Unbiasedness, Efficiency, Consistency) →
Compute Common Error Variances (Residual Variance, Standard Error, MSE, RMSE, MAE, Adjusted R², AIC, BIC) → Compute Goodness of Fit (R², Pearson Correlation, Model Comparison, Cross-Validation) →
Compute Inference and Predictions (Point & Interval Estimations, Confidence Intervals, Prediction Intervals) → Perform Residual Analysis (RSS, Residual Plots, Breusch-Pagan Test, Durbin-Watson Test) → Identify Leverage and Outliers (Hat Matrix, Cook’s Distance, DFFITS, DFBETAS, VIF for Multicollinearity) → Decision

## MLR Derivative Calculation Flows:
### Flow 1: Parameter Estimation (OLS, Derivation & Categorical Variables)
𝐻0, 𝐻𝑎 → 𝛼 → Compute Least Squares Solution (Matrix Form, Normal Equations) → Derive OLS Estimator → Interpret β Coefficients (Unbiasedness, Efficiency, Consistency) →
Handle Categorical Variables (Dummy Coding, Effects Coding) → Decision

### Flow 2: Error Metrics & Model Fit
𝐻0, 𝐻𝑎 → 𝛼 → Compute Residual Variance & Standard Errors → Compute R², Adjusted R², MSE, RMSE, MAE → Compare Nested Models →
Compute AIC & BIC for Model Selection → Decision

### Flow 3: Model Assumptions & Residual Diagnostics
𝐻0, 𝐻𝑎 → 𝛼 → Check Linearity & Homoscedasticity → Perform Breusch-Pagan Test → Perform Durbin-Watson Test for Autocorrelation → Plot Residuals → Decision

### Flow 4: Multicollinearity & Its Remedies
𝐻0, 𝐻𝑎 → 𝛼 → Compute Variance Inflation Factor (VIF) → Compute Correlation Matrices & Condition Number → Apply PCA & PLS for Dimensionality Reduction →
Apply Regularization (Ridge, Lasso Regression) → Perform Stepwise Regression, Forward Selection, Backward Elimination → Decision

### Flow 5: Influential Observations & Outliers
𝐻0, 𝐻𝑎 → 𝛼 → Compute Hat Matrix for Leverage → Compute Cook’s Distance → Compute DFFITS & DFBETAS → Flag Outliers & Influential Observations → Decision

### Flow 6: Model Selection & Validation
𝐻0, 𝐻𝑎 → 𝛼 → Perform Cross-Validation (K-Fold, LOOCV) → Compute Bootstrap Estimates → Apply Model Averaging → Compare Models Using AIC & BIC → Decision

### Flow 7: Non-Linear Relationships & Interaction Terms
𝐻0, 𝐻𝑎 → 𝛼 → Apply Interaction Terms in MLR → Apply Polynomial Regression & Spline Regression → Compare Performance with Standard MLR Model → Decision

## LR Main Calculation Flow:
𝐻0, 𝐻𝑎 → 𝛼 → Compute Logit Function & Sigmoid Transformation → Compute Maximum Likelihood Estimation (MLE) → Compute Odds Ratio & Cost Function (Cross Entropy Loss) → Compute Goodness of Fit (ROC-AUC, Hosmer-Lemeshow Test) → Compute Inference & Predictions (Wald Test, Likelihood Ratio Test, Confidence Intervals) → Perform Residual Analysis (Deviance Residuals, Cook’s Distance) → Identify Multicollinearity & Class Imbalance → Decision.

## LR Derivative Calculation Flows:
### Flow 1:  Logistic Model Formulation
𝐻0, 𝐻𝑎 → 𝛼 → Transform Linear Model to Logit Function → Apply Sigmoid Function → Compute Log-Odds & Probability → Decision.

### Flow 2: Parameter Estimation (MLE & Odds Ratio)
𝐻0, 𝐻𝑎 → 𝛼 → Compute Log Likelihood Function → Optimize with Newton-Raphson → Estimate Regression Coefficients → Compute Odds Ratio → Decision.

### Flow 3: Model Evaluation (Goodness of Fit & Metrics)
𝐻0, 𝐻𝑎 → 𝛼 → Compute ROC-AUC & Confusion Matrix → Compute Accuracy, Precision, Recall, F1-Score → Perform Hosmer-Lemeshow & Deviance Test → Decision.

### Flow 4: Inference & Hypothesis Testing
𝐻0, 𝐻𝑎 → 𝛼 → Perform Wald Test → Perform Likelihood Ratio Test → Compute Confidence Intervals → Decision

### Flow 5: Model Diagnostics (Residuals & Multicollinearity)
𝐻0, 𝐻𝑎 → 𝛼 → Compute Deviance Residuals → Compute Cook’s Distance & Leverage → Compute VIF for Multicollinearity → Decision.

### Flow 6: Regularization (Handling Overfitting)
𝐻0, 𝐻𝑎 → 𝛼 → Apply Ridge (L2), Lasso (L1), Elastic Net → Optimize Cost Function → Decision.

### Flow 7: Handling Class Imbalance
𝐻0, 𝐻𝑎 → 𝛼 → Apply Oversampling & SMOTE → Apply Cost-Sensitive Learning → Adjust Classification Threshold → Decision.

##
