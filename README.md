# Course: Financial Frictions, Monetary and Macroprudential Policy and Household Heterogeneity

This course is written for the EUI Econ PhD students as an advanced half-credit course. 

In a nutshell:

:round_pushpin: Gives an introduction to DSGE models and their solution with the [Dynare](https://www.dynare.org) package

:round_pushpin: Studies the incorporation of financial frictions in DSGE models 

:round_pushpin: The use of DSGE models for the design of monetary policy and financial regulation

:round_pushpin: Extends modelling framework to household heterogeneity and studies the impact of monetary policy

## Day 1: DSGE models overview, the RBC model & Dynare introduction

During the first lecture we will go through a short introduction on DSGE models and their various solution techniques. 
Then we will set up the very simple RBC model and learn how to use Dynare to solve it (get the policy functions).
This is of hight importance as we will go through much more complicated models in the next lectures

### Material

- DSGE models introduction [slides](Introduction/Introduction.pdf)
- RBC model set up and Dynare introduction [slides](Dynare/slides/Dynare.pdf)
- [Codes](Dynare/codes) to solve the RBC model in Dynare 

#### Take home exercise  

- Extend the simple RBC model to include investment adjustment costs as specified in the end of [slides](Dynare/slides/Dynare.pdf)
- First solve the model by pen and paper and add the new parts in Dynare to find the policy rules
- Construct a vector [0:4] with step=1 grid for the adjustment cost parameter  <img src="https://render.githubusercontent.com/render/math?math=\phi_X">  and show the different IRFs for output, consumption, investment and labour hours for every level of the parameter
- Solution will be uploaded in the Dynare [folder](Dynare)

##### :computer: Prerequisites 
- The model file runs with Matlab and Dynare 4.6.x
- The mod file the SS file need to be at the same folder

## Day 2: Asymmetric information and limited commitment

In the second lecture we will cover one of the most widely used option for financial frictions in DSGE models, the assymetric information friction. 
This started from [Townsded (1979)](https://www.sciencedirect.com/science/article/pii/0022053179900310) and became widely used in a DSGE model from [Bernanke, Gertler and Gilchrist (1999)](https://www.nber.org/system/files/working_papers/w6455/w6455.pdf). We will go through the latter in detail both in terms of theory and coding/ solving the model with Dynare

### Material

- BGG model presentation [slides](Assymetric_Information/slides/Asym_Information.pdf)
- [Codes](Assymetric_Information/codes) to solve the BGG model in Dynare 
- Codes include both flexible price and sticky price specification of the real sector, together with the BGG friction

##  Final Evaluation

 Students are given with two options
 ### Option 1: Solving a Financial Frictions model 
 - This is mainly for those that want to continue with this in their PhD
 - Choose a paper of your choice with some financial friction component
 - Find the steady state and solve it in Dynare
 - Ideally, extend in in some dimension (e.g. add macroprudential regulation policy)
 - Write up a 3-4 pages report with results, analysis etc.
 - Joint works are encouraged 

 ### Option 2: Write a referee report or a research proposal
 #### Referee report
 - Pick a paper of your choice or from the course outline
 - Write a referee report
#### Research Proposal
 - Write a proposal concerning original research in one of the topics examined in the course
 - Write a referee report
 - The proposal could be an extension of one of the papers seen in the course, a new application of the models presented, or a new model/empirical analysis. 
 - The key is to stress the motivation of the proposed research, what is new, why it is interesting and/or important.
