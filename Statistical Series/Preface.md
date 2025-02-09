# Statistics for Data Science Roadmap
## Population & Sample
- Standard Error
- Confidence Level
- Margin of Error
- Confidence Interval
- Critical Value
- Sampling Methods
	- Random
 	- Stratified
	- Cluster
- Sampling Bias
- Sampling Distributions
- Law of Large Numbers
  
## Variable Types
- Dependent Variable
- Independent Variable
- Control Variable

## Data Types
- Numerical
	- Discrete
	- Continuous
		- Interval
		- Ratio
	- Time-Series
		- Stock Series
		- Flow Series
	- Spatial
- Categorical
	- Nominal
	- Ordinal
	- Binary
- Structured
- Unstructured
- Semi-Structured
  
## Central Tendency
- Data Distribution
	- Normal Distribution
	- Skewed Distribution
		- Positively/Right Skewed
		- Negatively/Left Skewed
- Mean
	- Arithmetic Mean
	- Geometric Mean
	- Harmonic Mean
	- Weighted Mean
	- Trimmed Mean
	- Winsorized Mean
	- Quadratic Mean (Root Mean Square)
	- Contraharmonic Mean
- Median
- Mode
	- Unimodal
	- Bimodal
	- Multimodal
 
## Frequency Distribution
- Frequency Table
- Cumulative Frequency
- Quantiles
- Ogive (Cumulative Frequency Curve)
	- Less Than Ogive Curve
	- More Than Ogive Curve
- Histogram
- Kernel Density Estimation
- Box Plot & Violin Plot
- Cumulative Distribution Function Plot

## Variability and Dispersion
- Range
- Mean Absolute Deviation
- Variance
- Standard Deviation
- Coefficient of Variation
- IQR
- Skewness & Kurtosis
- Outliers and Extreme Values
- Median Absolute Deviation
- Variance to Mean Ratio
- Covariance & Correlation (Correlation Matrices)

## Probability
- Probability of an Event
- Sample Spaces
- Events
	- Mutually Exclusive Events
	- Independent Events
- Combinations & Permutations
- Probability of Multiple Events
	- Joint Probability
	- Union Probability
	- Marginal Probability
- Event Dependencies
	- Independent Probability
	- Dependent Probability
	- Conditional Independence
- Types of Probability
- Bayesian vs. Frequentist Interpretation
- Probability Axioms
- Extended Additivity
- Probability Rules
	- Complement
	- Addition
	- Multiplication
- Law of Total Probability
- Conditional Probability
- Bayes’ Theorem
	- Bayesian Inference (Priors & Posteriors)
- Probability Distributions
	- Expected Value & Variance
	- Discrete Probability Distribution
		- Probability Mass Function (PMF)
		- Cumulative Distribution Function (CDF)
		- Moment-Generating Function (MGF)
			- Bernoulli Distribution
			- Binomial Distribution
			- Poisson Distribution
			- Geometric Distribution
			- Negative Binomial Distribution
			- Hypergeometric Distribution
			- Categorical Distributions
			- Multinomial Distribution
	- Continuous Probability Distribution
		- Probability Density Function
		- Cumulative Distribution Function
		- Moment-Generating Function
			- Uniform Distribution
			- Normal Distribution
			- Exponential Distribution
			- Gamma Distribution
			- Beta Distribution
			- Log-Normal Distribution
			- Weibull Distribution
			- Chi-Square Distribution
			- T-Distribution
	- Multivariate Distribution
		- Multivariate Normal Distribution
		- Dirichlet Distribution
	- Survival Functions 
	- Hazard Function
   
## Central Limit Theorem
- Expectation (Mean)
- Variance
- Standard Error
- Z-Score
- Normal Approximation
- Lyapunov CLT
- Lindeberg CLT

## Hypothesis Testing
- Confidence Level & Confidence Interval
- Effect Size & Power Analysis
- Degree of Freedom
- Null Hypothesis & Alternative Hypothesis
- Significance Level/Alpha Level
- Critical Values
- P-Value
- Q-Value
- One Tailed Test (Right or Left Tailed) & Two Tailed Test
- Type I Error (False Positive) & Type II Error (False Negative)
- Bayesian Hypothesis Testing
- Bonferroni Correction
- Holm-Bonferroni Correction
- Benjamini-Hochberg Correction
- Sidak Correction
- False Discovery Rate (FDR) & Family-Wise Error Rate (FWER)
- Sequential Testing
	- Based on Decision-Making Rules
		- Likelihood Ratio
		- Z-Score
		- Continuous Monitoring
	- Based on Controlling the Overall Type I Error Rate
		- Pocock’s Method
		- O’Brien-Fleming’s Method
		- Alpha Spending (Lan-DeMets) Method
- P-hacking & Multiple Testing Problem
 
## Statistical Tests for Inferential Techniques
- Parametric test
	- Z-Test
	- T-Test
		- One Sample T-Test
		- Two Sample T-Test
		- Paired T-Test
		- Cohen’s d
	- F-Test
	- Analysis of Variance (ANOVA)
		- One-Way ANOVA
		- Two-Way ANOVA
		- Repeated Measures ANOVA
		- η²
	- Analysis of Covariance (ANCOVA)
	- Multivariate Analysis of Variance (MANOVA)
		- Wilks' Lambda
		- Pillai's Trace
		- Hotelling's Trace
		- Roy's Largest Root
		- Box’s M Test
		- Partial η²
	- Bayesian ANOVA
- Non-Parametric Test
	- Chi-Square Test
		- Independence Test
			- Cramer’s V
		- Goodness of Fit
	- Mann-Whitney U Test
		- Cliff’s delta
	- Kruskal-Wallis Test
		- Epsilon-squared
	- Wilcoxon Signed-Rank Test
	- Spearman’s Rank Correlation
	- Friedman Test
	- Cochran's Q test
	- McNemar's test
	- Kendall Tau Correlation
		- Tau-a
		- Tau-b
		- Tau-c
	- Bootstrapping
	- Permutation Test

## Statistical Tests for Data Normality Checking
- Shapiro-Wilk Test
- Kolmogorov-Smirnov Test
- Anderson-Darling Test
- D'Agostino-Pearson Test
- Jarque-Bera Test
- Lilliefors Test
- Levene’s test
- Fligner-Killeen test
- Q-Q Plot & Histogram
  
## Post-Hoc Tests
- Tukey's HSD (Honestly Significant Difference) Test
- Duncan's Multiple Range Test
- Fisher's Least Significant Difference (LSD) Test
- Scheffé Test
- Dunnett's Test
- Games-Howell Test
	- Welch-Satterthwaite Approximation

## Regression Analysis
### Simple Linear Regression
- Concept Behind the SLR
- SLR Model Assumptions
- Best-Fitting Line
	- Least Square Method
		- Geometric Intuition
	- Parameter Estimation
		- Slope and Intercept
		- Derivation
- SLR Model
	- Interpretation of Coefficients
- Common Error Variances
	- Residual Variance
	- Standard Error
- Goodness of Fit
	- Metrics
		- Mean Square Error (MSE)
		- Root Mean Square Error (RMSE)
		- Mean Absolute Error (MAE)
		- Pearson Correlation Coefficient
		- Covariance Coefficient
	- Coefficient of Determination (R2)
		- Interpretation
		- R-Square Limitations
- Inference and Predictions
	- Point Estimation
	- Interval Estimation
		- Confidence Intervals
		- Prediction Intervals
- Residual Analysis
	- Residual Sum of Squares (RSS)
	- Residual Plot
- Leverage and Outliers
	- Leverage Points
- SLR Extensions
	- Non-Linear Relationships
		- Logarithmic
		- Polynomial
		- Inverse
	- Categorical Predictors
		- Dummy Coding
    
## Multiple Linear Regression
- Concept Behind the MLR
- MLR Model Assumptions
- Parameter Estimation
	- Coefficient Estimation
	- Ordinary Least Square
		- Derivation
		- Unbiasedness
		- Consistency
		- Efficiency
	- Matrix Form of MLR
	- Categorical Variables
		- Dummy Coding
		- Effects Coding
- Multicollinearity and Its Remedies
	- Variance Inflation Factor
	- Condition Number Analysis
	- Correlation Matrices
	- Dimensionality Reduction
		- Principal Component Analysis (PCA)
		- Partial Least Squares
	- Regularization
		- Ridge Regression
		- Lasso Regression
	- Variable Selection Methods
		- Stepwise Regression
		- Forward Selection
		- Backward Elimination
- Model Selection and Validation
	- Cross-Validation Method
		- K-Fold
		- LOOCV (Leave-One-Out Cross-Validation)
	- Bootstrap Method
	- Model Averaging Method
	- Information Criteria
		- Akaike Information Criterion (AIC)
		- Bayesian Information Criterion (BIC)
- MLR Model Diagnostics
	- Fit Metrics
		- Coefficient of Determination (R2)
		- Adjusted R2
		- Mean Square Error (MSE)
	- Residual Analysis
		- Breusch-Pagan test
		- Durbin-Watson test.
	- Influence Metrics
		- Cook’s Distance
		- Leverage
		- DFBETAS
- Non-Linear Relationships
	- Interaction Terms
	- Polynomial Regression
	- Spline Regression
   
## Logistic Regression
- Concept Behind the LR
- Linear Model Transformation to Logistic Model
	- Logit Function
	- Sigmoid Function
- LR Types
	- Binary Logistic Regression
	- Nominal Logistic Regression
	- Ordinal Logistic Regression
- LR Model Assumptions
- Parameter Estimation
	- Regression Coefficients
	- Maximum Likelihood Estimation (MLE)
		- Log Likelihood Function
		- Newton-Raphson Method
	- Odds Ratio
	- Cost Function
		- Cross Entropy Loss
	- Confidence Interval
- Model Evaluation
	- Metrics
		- ROC-AUC
		- Confusion Matrix
		- Accuracy
		- Precision
		- Recall
		- F1-Score
	- Goodness of Fit
		- Hosmer-Lemeshow test
		- Deviance test
- Inference
	- Wald Test
	- Likelihood Ratio Test
- Model Diagnostics
	- Residual Analysis
		- Deviance Residuals
		- Leverage
		- Cook’s Distance
	- Multicollinearity
		- VIF for Logistic Regression
- Regularization
	- Ridge Regression
	- Lasso Regression
	- Elastic Net
- Class Imbalance
	- Oversampling
	- SMOTE (Synthetic Minority Over-Sampling Technique)
	- Cost-Sensitive Learning
	- Threshold Moving
   
## Linear Regression Variants
- Polynomial Regression
- Ridge Regression
- Lasso Regression
- Elastic Net

### Non-Linear Regression
- Exponential Regression
- Power Regression
- Spline Regression
   
### Regression for Count Data
- Poisson Regression
- Negative Binomial Regression
- Zero-Inflated Regression
   
### Categorical Outcome Regression
- Probit Regression
   
### Survival/Time-to-Event Regression
- Cox Proportional Hazards Regression
- Accelerated Failure Time (AFT) Models
   
### Robust Regression
- Quantile Regression
- M-Estimation
   
### Bayesian Regression
- Bayesian Linear Regression
- Bayesian Additive Regression Trees (BART)
   
### Spatial Regression
- Geographically Weighted Regression (GWR)

## Experimental Design
- Introduction and Context
- Research Problem and Objectives
- Methodological Overview
	- Randomization
	- Control Groups
	- A/B Testing
	- Blocking
	- Factorial Design
- Results Interpretation
- Comparison with Existing Literature
- Limitations and Future Directions
- Implications and Recommendation
- Conclusion

## Time Series Analysis
### Autoregressive (AR) Model
- Parameter Estimation
	- Ordinary least Squares (OLS)
	- Maximum Likelihood Estimation (MLE)
	- Yule-Walker Equations
- Model Diagnostics
	- Autocorrelation Function
	- Ljung–Box test
	- Augmented Dickey-Fuller test
	- Standard Error and Confidence Interval
- Forecasting Future Values
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)
   
### Moving Average (MA) Model
- Parameter Estimation
	- Maximum Likelihood Estimation (MLE)
	- Conditional Least Squares (CLS)
- Model Diagnostics
	- Autocorrelation Function (ACF)
	- Ljung-Box test
	- Augmented Dickey-Fuller test
	- Standard Error and Confidence Interval
- Forecasting Future Values
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)
   
### Autoregressive Integrated Moving Average (ARIMA) Model
- Parameter Estimation
	- MLE
	- OLS
	- Bayesian Estimation
- Model Diagnostics
	- ACF
	- Ljung-Box test
	- Augmented Dickey-Fuller test
	- Standard Error and Confidence Interval
- Forecasting Future Values
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)

### Seasonal ARIMA (SARIMA) Model
- Parameter Estimation
	- MLE
	- OLS
	- Bayesian Estimation
- Model Diagnostics
	- ACF
	- Ljung-Box test
	- Augmented Dickey-Fuller test
	- Seasonal Augmented Dickey-Fuller test
	- HEGY (Hylleberg-Engle-Granger-Yoo) test
	- Standard Error and Confidence Interval
- Forecasting Future Values
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)

### Exponential Smoothing Model
- Parameter Estimation
	- MLE
	- OLS
	- Grid Search
- Types
	- Simple Exponential Smoothing (SES)
	- Holt’s Linear Trend Model
	- Holt-Winters Seasonal Model
- Model Diagnostics
	- Mean Absolute Error (MAE)
	- Mean Squared Error (MSE)
	- Mean Absolute Percentage Error (MAPE)
	- ACF
	- Ljung-Box test
	- Augmented Dickey-Fuller test
- Forecasting Future Values
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
	- Shapiro-Wilk test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)
 - Hannan-Quinn Information Criterion (HQC)

### Generalized Autoregressive Conditional Heteroskedasticity (GARCH) Model
- Parameter Estimation
	- MLE
	- Quasi-MLE (QMLE)
- Model Diagnostics
	- ACF
	- Ljung-Box test
	- Augmented Dickey-Fuller test
	- Standard Error and Confidence Interval
- Forecasting Future Volatility
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)

### Vector Autoregression (VAR) Model
- Parameter Estimation
	- OLS
- Model Diagnostics
	- ACF
	- Ljung-Box test
	- Augmented Dickey-Fuller test
	- Standard Error and Confidence Interval
- Forecasting Future Values
	- One-Step Ahead Forecasting
	- Multi-Step Ahead Forecasting
	- Prediction Interval
	- Forecast Errors and Its Confidence Interval
- Residual Analysis
	- Durbin-Watson test
	- Jarque-Bera test
- Stability Analysis
	- Characteristic Roots
	- Mean Reversion Time
- Impulse Response Function
- Information Criteria
	- Akaike Information criterion (AIC)
	- Bayesian Information Criterion (BIC)
	- Hannan-Quinn Information Criterion (HQC)
