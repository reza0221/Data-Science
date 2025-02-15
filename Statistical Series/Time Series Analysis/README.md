# This is a series of Time Series Analysis
## AR Model Main Flow
𝐻0, 𝐻𝑎 → 𝛼 → Estimate Model Parameters (OLS, MLE, Yule-Walker) → Compute Test Statistics (Slope & Intercept) → Compute Common Error Variances (Residual Variance, Standard Error) → Compute Model Diagnostics (Autocorrelation Function, Ljung-Box Test, Augmented Dickey-Fuller Test) → Perform Forecasting (One-Step & Multi-Step Ahead, Prediction Interval, Forecast Errors) → Perform Residual Analysis (Durbin-Watson Test, Jarque-Bera Test) → Assess Model Stability (Characteristic Roots, Mean Reversion Time) → Compute Impulse Response Function → Compute Information Criteria (AIC, BIC) → Decision.

## AR Model Derivative Flows
### Flow 1: Parameter Estimation
𝐻0, 𝐻𝑎 → 𝛼 → Compute Best-Fitting Line (OLS, MLE, Yule-Walker) → Compute Test Statistics (Slope & Intercept) → Compute Common Error Variances (Residual Variance, Standard Error) → Decision.

### Flow 2: Model Diagnostics
𝐻0, 𝐻𝑎 → 𝛼 → Compute Autocorrelation Function (ACF & PACF) → Perform Ljung-Box Test → Perform Augmented Dickey-Fuller Test → Compute Standard Error and Confidence Interval → Decision.

### Flow 3: Forecasting Future Values
𝐻0, 𝐻𝑎 → 𝛼 → Compute One-Step Ahead Forecasting → Compute Multi-Step Ahead Forecasting → Compute Prediction Interval → Compute Forecast Errors and Its Confidence Interval → Decision.

### Flow 4: Residual Analysis
𝐻0, 𝐻𝑎 → 𝛼 → Perform Durbin-Watson Test (Check for Autocorrelation) → Perform Jarque-Bera Test (Check for Normality of Residuals) → Decision.

### Flow 5: Stability Analysis
𝐻0, 𝐻𝑎 → 𝛼 → Compute Characteristic Roots → Compute Mean Reversion Time → Decision.

### Flow 6: Impulse Response Function
𝐻0, 𝐻𝑎 → 𝛼 → Compute Response to Shocks (Impulse Response Function) → Decision.

## MA Model Main Flow
𝐻0, 𝐻𝑎 → 𝛼 → Estimate Model Parameters (MLE, CLS) → Compute Test Statistics (MA Coefficients) → Compute Common Error Variances (Residual Variance, Standard Error) → Compute Model Diagnostics (Autocorrelation Function, Ljung-Box Test, Augmented Dickey-Fuller Test, Confidence Interval) → Perform Forecasting (One-Step & Multi-Step Ahead, Prediction Interval, Forecast Errors) → Perform Residual Analysis (Durbin-Watson Test, Jarque-Bera Test) → Assess Model Stability (Characteristic Roots, Mean Reversion Time) → Compute Impulse Response Function → Compute Information Criteria (AIC, BIC) → Decision.

## MA Model Derivative Flows
### Flow 1: Parameter Estimation
𝐻0, 𝐻𝑎 → 𝛼 → Estimate Model Parameters (Maximum Likelihood Estimation, Conditional Least Squares) → Compute Test Statistics (MA Coefficients) → Compute Common Error Variances (Residual Variance, Standard Error) → Decision.

### Flow 2: Model Diagnostics
𝐻0, 𝐻𝑎 → 𝛼 → Compute Autocorrelation Function (ACF) → Perform Ljung-Box Test → Perform Augmented Dickey-Fuller Test → Compute Standard Error and Confidence Interval → Decision.

### Flow 3: Forecasting Future Values
𝐻0, 𝐻𝑎 → 𝛼 → Compute One-Step Ahead Forecasting → Compute Multi-Step Ahead Forecasting → Compute Prediction Interval → Compute Forecast Errors and Its Confidence Interval → Decision.

### Flow 4: Residual Analysis
𝐻0, 𝐻𝑎 → 𝛼 → Perform Durbin-Watson Test (Check for Autocorrelation) → Perform Jarque-Bera Test (Check for Normality of Residuals) → Decision.

### Flow 5: Stability Analysis
𝐻0, 𝐻𝑎 → 𝛼 → Compute Characteristic Roots → Compute Mean Reversion Time → Decision.

### Flow 6: Impulse Response Function
𝐻0, 𝐻𝑎 → 𝛼 → Compute Response to Shocks (Impulse Response Function) → Decision.

### Flow 7: Information Criteria
𝐻0, 𝐻𝑎 → 𝛼 → Compute Akaike Information Criterion (AIC) → Compute Bayesian Information Criterion (BIC) → Decision.

## ARIMA Model Main Flow
H0, Ha ​ → α → Estimate Model Parameters (MLE, OLS, Bayesian Estimation) → Compute Model Diagnostics (ACF, Ljung-Box Test, Augmented Dickey-Fuller Test, Standard Error & Confidence Interval) →
Perform Forecasting (One-Step & Multi-Step Ahead, Prediction Interval, Forecast Errors & Its Confidence Interval) → erform Residual Analysis (Durbin-Watson Test, Jarque-Bera Test) →
Assess Model Stability (Characteristic Roots, Mean Reversion Time) → Compute Impulse Response Function → Compute Information Criteria (AIC, BIC) → Decision.

## ARIMA Model Derivative Flows
### Flow 1: Parameter Estimation
H0, Ha ​→ α → Estimate Model Parameters (Maximum Likelihood Estimation, Ordinary Least Squares, Bayesian Estimation) → Compute Test Statistics (AR, MA, and Differencing Coefficients) →
Compute Common Error Variances (Residual Variance, Standard Error) → Decision.

### Flow 2: Model Diagnostics
H0, Ha ​→ α → Compute Autocorrelation Function (ACF & PACF) →  Perform Ljung-Box Test (Check for White Noise) → Perform Augmented Dickey-Fuller Test (Check for Stationarity) →
Compute Standard Error and Confidence Interval → Decision.

### Flow 3: Forecasting Future Values
H0, Ha ​→ α → Compute One-Step Ahead Forecasting → Compute Multi-Step Ahead Forecasting → Compute Prediction Interval → Compute Forecast Errors & Its Confidence Interval → Decision.

### Flow 4: Residual Analysis
H0, Ha ​→ α → Perform Durbin-Watson Test (Check for Autocorrelation in Residuals) →  Perform Jarque-Bera Test (Check for Normality of Residuals) → Decision.

### Flow 5: Stability Analysis
H0, Ha ​→ α → Compute Characteristic Roots (Check Model Stability) → Compute Mean Reversion Time (Time Taken to Return to Mean) → Decision.

### Flow 6: Impulse Response Function
H0, Ha ​→ α → Compute Response to Shocks (Impulse Response Function) → Decision.

### Flow 7: Information Criteria
H0, Ha ​→ α → Compute Akaike Information Criterion (AIC) →  Compute Bayesian Information Criterion (BIC) → Decision.

## SARIMA Model Main Flow
H0, Ha ​→ α → Estimate Model Parameters (MLE, OLS, Bayesian Estimation) → Compute Test Statistics (SAR, SMA, Differencing Coefficients) → Compute Common Error Variances (Residual Variance, Standard Error) → Compute Model Diagnostics (Autocorrelation Function, Ljung-Box Test, Augmented Dickey-Fuller Test, Seasonal Augmented Dickey-Fuller Test, HEGY Test) → Perform Forecasting (One-Step & Multi-Step Ahead, Prediction Interval, Forecast Errors) → Perform Residual Analysis (Durbin-Watson Test, Jarque-Bera Test) → Assess Model Stability (Characteristic Roots, Mean Reversion Time) → Compute Impulse Response Function → Compute Information Criteria (AIC, BIC) → Decision.

## SARIMA Model Derivative Flows
### Flow 1: Parameter Estimation
H0, Ha ​→ α → Estimate Model Parameters (Maximum Likelihood Estimation, Ordinary Least Squares, Bayesian Estimation) → Compute Test Statistics (SAR, SMA, Differencing Coefficients) → Compute Common Error Variances (Residual Variance, Standard Error) → Decision.

### Flow 2: Model Diagnostics
H0, Ha ​→ α → Compute Autocorrelation Function (ACF & PACF) → Perform Ljung-Box Test (Check for White Noise) → Perform Augmented Dickey-Fuller Test (Check for Stationarity) → Perform Seasonal Augmented Dickey-Fuller Test (Check for Seasonal Stationarity) → Perform HEGY Test (Check for Seasonal Unit Roots) → Compute Standard Error and Confidence Interval → Decision.

### Flow 3: Forecasting Future Values
H0, Ha ​→ α → Compute One-Step Ahead Forecasting → Compute Multi-Step Ahead Forecasting → Compute Prediction Interval → Compute Forecast Errors & Its Confidence Interval → Decision.

### Flow 4: Residual Analysis
H0, Ha ​→ α → Perform Durbin-Watson Test (Check for Autocorrelation in Residuals) → Perform Jarque-Bera Test (Check for Normality of Residuals) → Decision.

### Flow 5: Stability Analysis
H0, Ha ​→ α → Compute Characteristic Roots (Check Model Stability) → Compute Mean Reversion Time (Time Taken to Return to Mean) → Decision.

### Flow 6: Impulse Response Function
H0, Ha ​→ α → Compute Response to Shocks (Impulse Response Function) → Decision.

### Flow 7: Information Criteria
H0, Ha ​→ α → Compute Akaike Information Criterion (AIC) → Compute Bayesian Information Criterion (BIC) → Decision.

## Exponential Smoothing Model Main Flow
H0, Ha → α → Estimate Model Parameters (MLE, OLS, Grid Search) → Choose Exponential Smoothing Type (SES, Holt’s Linear, Holt-Winters) 
        → Compute Model Diagnostics (MAE, MSE, MAPE, ACF, Ljung-Box Test, ADF Test) 
        → Forecast Future Values (One-Step, Multi-Step, Prediction Interval, Forecast Errors & Confidence Interval)
        → Perform Residual Analysis (Durbin-Watson, Jarque-Bera, Shapiro-Wilk) 
        → Perform Stability Analysis (Characteristic Roots, Mean Reversion Time) 
        → Compute Impulse Response Function → Compute Information Criteria (AIC, BIC, HQC) → Decision

## Exponential Smoothing Model Derivative Flows
### Flow 1: Parameter Estimation
H0, Ha → α → Estimate Model Parameters using:
      - Maximum Likelihood Estimation (MLE)
      - Ordinary Least Squares (OLS)
      - Grid Search
      → Decision

### Flow 2: Model Selection (Types of Exponential Smoothing)
H0, Ha → α → Choose Model Type:
      - Simple Exponential Smoothing (SES)
      - Holt’s Linear Trend Model
      - Holt-Winters Seasonal Model
      → Decision

### Flow 3: Model Diagnostics
H0, Ha → α → Compute Model Diagnostics:
      - Mean Absolute Error (MAE)
      - Mean Squared Error (MSE)
      - Mean Absolute Percentage Error (MAPE)
      - Autocorrelation Function (ACF)
      - Ljung-Box Test (Check for White Noise)
      - Augmented Dickey-Fuller (ADF) Test (Check for Stationarity)
      → Decision

### Flow 4: Forecasting Future Values
H0, Ha → α → Compute Forecast:
      - One-Step Ahead Forecasting
      - Multi-Step Ahead Forecasting
      - Prediction Interval
      - Forecast Errors & Confidence Interval
      → Decision

### Flow 5: Residual Analysis
H0, Ha → α → Perform Residual Analysis:
      - Durbin-Watson Test (Check for Autocorrelation in Residuals)
      - Jarque-Bera Test (Check for Normality)
      - Shapiro-Wilk Test (Check for Normality)
      → Decision

### Flow 6: Stability Analysis
H0, Ha → α → Compute Stability Metrics:
      - Characteristic Roots (Check Model Stability)
      - Mean Reversion Time (Time Taken to Return to Mean)
      → Decision

### Flow 7: Impulse Response Function
H0, Ha → α → Compute Response to Shocks (Impulse Response Function) → Decision

### Flow 8: Information Criteria
H0, Ha → α → Compute Model Selection Criteria:
      - Akaike Information Criterion (AIC)
      - Bayesian Information Criterion (BIC)
      - Hannan-Quinn Information Criterion (HQC)
      → Decision

## Generalized Autoregressive Conditional Heteroskedasticity (GARCH) Model Main Flow
H0, Ha → α → Parameter Estimation → Model Diagnostics → Forecasting Future Volatility → Residual Analysis →
Stability Analysis → Impulse Response Function → Information Criteria → Decision

## Generalized Autoregressive Conditional Heteroskedasticity (GARCH) Model Derivative Flows
### Flow 1: Parameter Estimation
H0, Ha → α → Estimate GARCH Model Parameters using (Maximum Likelihood Estimation (MLE) & Quasi-MLE (QMLE)) → Decision

### Flow 2: Model Diagnostics
H0, Ha → α → Compute Model Diagnostics (Autocorrelation Function (ACF),  Ljung-Box Test (Check for White Noise in Residuals), Augmented Dickey-Fuller (ADF) Test (Check for Stationarity)
Standard Error and Confidence Interval) → Decision

### Flow 3: Forecasting Future Volatility
H0, Ha → α → Compute Forecast (One-Step Ahead Forecasting, Multi-Step Ahead Forecasting, Prediction Interval, Forecast Errors & Confidence Interval) → Decision

### Flow 4: Residual Analysis
H0, Ha → α → Perform Residual Analysis (Durbin-Watson Test (Check for Autocorrelation in Residuals), Jarque-Bera Test (Check for Normality) → Decision

### Flow 5: Stability Analysis
H0, Ha → α → Compute Stability Metrics (Characteristic Roots (Check Model Stability), Mean Reversion Time (Time Taken to Return to Mean) → Decision

### Flow 6: Impulse Response Function
H0, Ha → α → Compute Response to Shocks (Impulse Response Function) → Decision

### Flow 7: Information Criteria
H0, Ha → α → Compute Model Selection Criteria (Akaike Information Criterion (AIC) & Bayesian Information Criterion (BIC)) → Decision

## Main Calculation Flow of Vector Autoregression (VAR) Model
H0, Ha → α → Parameter Estimation → Model Diagnostics → Forecasting Future Values → Residual Analysis → Stability Analysis → Impulse Response Function → Information Criteria → Decision

## Derivative Calculation Flows of Vector Autoregression (VAR) Model
### Flow 1: Parameter Estimation
H0, Ha → α → Parameter Estimation (Ordinary Least Squares (OLS)) → Estimate Coefficients → Compute standard errors, t-statistics, and p-values → Decision

### Flow 2: Model Diagnostics
H0, Ha → α → Model Diagnostics (Autocorrelation Function (ACF), Ljung-Box Test (Check for serial correlation in residuals), Augmented Dickey-Fuller (ADF) Test (Check for stationarity),
Standard Errors & Confidence Intervals) → Decision

### Flow 3: Forecasting Future Values
H0, Ha → α → Forecasting Future Values (One-Step Ahead Forecasting, Multi-Step Ahead Forecasting, Prediction Interval, Forecast Errors & Confidence Interval) → Decision

### Flow 4: Residual Analysis
H0, Ha → α → Residual Analysis (Durbin-Watson Test (Detect serial correlation in residuals) & Jarque-Bera Test (Check for normality of residuals)) → Decision

### Flow 5: Stability Analysis
H0, Ha → α → Stability Analysis (Characteristic Roots (Check stability condition) & Mean Reversion Time (Assess speed of return to equilibrium)) → Decision

### Flow 6: Impulse Response Function
H0, Ha → α → Impulse Response Function (Impulse Response Function (IRF)) → How variables react to shocks over time → Decision

### Flow 7: Information Criteria
H0, Ha → α → Information Criteria (Akaike Information Criterion (AIC), Bayesian Information Criterion (BIC), Hannan-Quinn Information Criterion (HQC)) → Decision
