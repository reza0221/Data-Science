Main Flow Diagram for Apriori Algorithm:
Data → Preprocessing → Train-Test Split → Train Base Model (Apriori) → Evaluate → Predict New Data.

Detailed Workflow Diagram for Apriori Algorithm:
Raw Data
│
├── Data Collection → Verify Data Integrity
│
├── Exploratory Data Analysis (EDA)
│   ├── Descriptive Statistics
│   ├── Visualize Frequent Itemsets
│   ├── Identify Association Rules
│   ├── Outlier Detection (Unusual Transactions)
│   └── Check Distribution of Itemsets
│
├── Preprocessing
│   ├── Convert Transactions into Itemset Format
│   ├── Handle Missing or Noisy Data (Remove Incomplete Transactions)
│   ├── Encode Categorical Data into One-Hot Format (Transaction Matrix)
│   ├── Choose Minimum Support (`min_support`) Threshold
│   ├── Choose Minimum Confidence (`min_confidence`) Threshold
│   ├── Choose Minimum Lift (`min_lift`) Threshold
│   └── Convert Transaction Data into Boolean Representation
│
├── Data Splitting
│   ├── Train (70%) → Used for association rule mining
│   ├── Validation (15%) → Tune `min_support` and `min_confidence`
│   └── Test (15%) → Evaluate rule relevance and strength
│
├── Base Model Training (Apriori Algorithm)
│   ├── Identify Frequent Itemsets Using Support Threshold
│   ├── Generate Candidate Itemsets Using Apriori Principle
│   ├── Prune Non-Frequent Itemsets
│   ├── Compute Support for Remaining Itemsets
│   ├── Generate Association Rules from Frequent Itemsets
│   ├── Compute Confidence and Lift for Rules
│   ├── Select Strong Rules Based on Confidence and Lift
│   ├── Store Discovered Association Rules
│   ├── Interpret Itemset Relationships
│   ├── Compare Performance of Different `min_support` Values
│   └── Save Discovered Rules for Future Analysis
│
├── Evaluation
│   ├── Analyze Support, Confidence, and Lift of Generated Rules
│   ├── Compare Discovered Rules with Domain Knowledge
│   ├── Assess Business Value of Association Rules
│   ├── Visualize Association Rules Using Network Graphs
│   ├── Compare Apriori Results with Other Algorithms (e.g., FP-Growth)
│   ├── Validate Rule Stability Across Different Runs
│   └── Ensure No Redundant or Contradictory Rules Are Generated
│
├── Predict New Data
│   ├── Preprocess New Transaction Data (Apply Same Encoding as Training Data)
│   ├── Apply Learned Association Rules to Identify Relevant Patterns
│   ├── Compare New Transactions with Previously Discovered Itemsets
│   ├── Recommend Items Based on Association Rules
│   ├── Analyze Market Basket for New Data
│   ├── Store Predicted Item Associations for Future Use
│   └── Use Association Rules for Recommendation Systems
│
└── Monitoring
    ├── Track Rule Stability Over Time
    ├── Monitor Itemset Distributions (Ensure Data Remains Representative)
    ├── Recompute Association Rules If Shopping Patterns Change
    ├── Adjust `min_support` and `min_confidence` If Too Many/Few Rules Are Found
    ├── Evaluate Whether Discovered Rules Continue to Provide Business Insights
    └── Automate Updates If Necessary (Dynamic Rule Mining)