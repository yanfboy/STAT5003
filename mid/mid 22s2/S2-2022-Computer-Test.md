---
title: "Computer Test"
subtitle: "STAT5003 Semester 2, 2022"
date: "14th September, 2022"
author: "Kaidan Huang 510188300 - TEST STUDENT"
output:
  html_document:
    keep_md: yes
---



This document was compiled on: Wed Sep 14  19:49:58 2022 AEST

### Instructions

1. This is an open book quiz, and you are allowed to search the Internet and the course webpage to access any descriptions and `R` code that may help you to solve the questions. However, be mindful that searching for the solution may take longer than you may be capable of doing by youself. Keep track of your time regularly.
2. Place your answers in the code chunk spaces provided adding typed comments below the code chunks as necessary if required (some questions may ask you to interpret your output).
3. We suggest you begin by **knitting** (compiling) the Rmd to make sure the template works on your system.
4. It's a good idea to submit your work **regularly** - if you end up submitting the final version late, the marker can go back and mark only the on-time submission.
5. It is suggested to set an alarm to at least 5-10 mins before the deadline to be able to compile and submit the HTML file on canvas.
6. Two marks will be awarded if a complete HTML file with compiled R code is submitted.
7. No additional packages are required for this test but you are free to use `tidyverse` functions if you wish.


### Question 1

A dataset involving a text encoding of various text documents using Natural Language Processing (NLP) has been given in the files `S2-2022-q1-list.rds` and `S2-2022-q1-df.rds`. There are 10 numeric variables and a categorical variable describing the Genre of the text in the `Genre` variable (coded as `f` for "Fantasy", `a` for "Adventure" and `c` for Crime) along with the model complexity in the `Model` variable. More details are given in this summary table

| R variable(s) | Description                                                                                    |
|:--------------|:-----------------------------------------------------------------------------------------------|
| `X1` -- `X10` | Ten numeric variables encoding a written text                                                  |
| `Genre`       | Genre of the text document coded as `c` for "Crime", `a` for "Adventure" and `f` for "Fantasy" |
| `Model`       | Type of model, coded as either `Basic` or `State.of.the.art`                                   |


Consider the following questions below.

a. __[3 marks]__ Verify that both the data sets, `q1.df` and `q1.list`, are both lists in `R` **and** have similar structure. Comment on how the structure is different.

```r
q1.list <- readRDS("S2-2022-q1-list.rds")
q1.df <- readRDS("S2-2022-q1-df.rds")
# Enter your answer here
str(q1.list)
```

```
## List of 12
##  $ X1   : num [1:34] -0.669 -0.957 -0.533 -1.123 -0.484 ...
##  $ X2   : num [1:34] 0.0351 0.0852 -0.1345 0.0488 -0.3891 ...
##  $ X3   : num [1:34] -0.0502 -0.019 0.6133 -0.1716 0.5754 ...
##  $ X4   : num [1:34] 0.183 -0.166 -0.584 -0.129 -0.286 ...
##  $ X5   : num [1:34] 0.254 -0.061 0.499 0.154 0.225 ...
##  $ X6   : num [1:34] 0.4848 0.0242 -0.0451 0.0381 -0.021 ...
##  $ X7   : num [1:34] -0.1411 0.0489 0.2327 0.0202 0.2292 ...
##  $ X8   : num [1:34] -0.2675 0.1142 0.0233 0.204 -0.2793 ...
##  $ X9   : num [1:34] 0.142 0.183 0.136 -0.113 -0.17 ...
##  $ X10  : num [1:34] 0.1706 0.0307 0.0658 -0.1024 -0.0975 ...
##  $ Genre: Factor w/ 3 levels "f","a","c": 3 2 1 2 1 2 2 1 3 3 ...
##  $ Model: chr [1:34] "Basic" "Basic" "State.of.the.Art" "State.of.the.Art" ...
```

```r
dim(q1.list)
```

```
## NULL
```

```r
str(q1.df)
```

```
## 'data.frame':	34 obs. of  12 variables:
##  $ X1   : num  -0.669 -0.957 -0.533 -1.123 -0.484 ...
##  $ X2   : num  0.0351 0.0852 -0.1345 0.0488 -0.3891 ...
##  $ X3   : num  -0.0502 -0.019 0.6133 -0.1716 0.5754 ...
##  $ X4   : num  0.183 -0.166 -0.584 -0.129 -0.286 ...
##  $ X5   : num  0.254 -0.061 0.499 0.154 0.225 ...
##  $ X6   : num  0.4848 0.0242 -0.0451 0.0381 -0.021 ...
##  $ X7   : num  -0.1411 0.0489 0.2327 0.0202 0.2292 ...
##  $ X8   : num  -0.2675 0.1142 0.0233 0.204 -0.2793 ...
##  $ X9   : num  0.142 0.183 0.136 -0.113 -0.17 ...
##  $ X10  : num  0.1706 0.0307 0.0658 -0.1024 -0.0975 ...
##  $ Genre: Factor w/ 3 levels "f","a","c": 3 2 1 2 1 2 2 1 3 3 ...
##  $ Model: chr  "Basic" "Basic" "State.of.the.Art" "State.of.the.Art" ...
```

```r
dim(q1.df)
```

```
## [1] 34 12
```

From the output, we can see that the type of q1.list is list, so there is no dimension output. The q1.df is a dataframe, so there is dimension and the dimension is 34 x 12.


b. __[3 marks]__ Using the `attributes` function in `R` (see `? attributes`), print the attributes for `q1.list` and `q1.df`. `q1.list` should only have a `names` attribute which contains a character vector of the variable names. Show `q1.df` has the same attributes as `q1.list` and also contains two more attributes. Comment on the details of the two extra attributes.


```r
# Enter your answer here
attributes(q1.list)
```

```
## $names
##  [1] "X1"    "X2"    "X3"    "X4"    "X5"    "X6"    "X7"    "X8"    "X9"   
## [10] "X10"   "Genre" "Model"
```

```r
attributes(q1.df)
```

```
## $names
##  [1] "X1"    "X2"    "X3"    "X4"    "X5"    "X6"    "X7"    "X8"    "X9"   
## [10] "X10"   "Genre" "Model"
## 
## $row.names
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30 31 32 33 34
## 
## $class
## [1] "data.frame"
```
When the input is a list, then the output is only the names. There is no row.names output as the structure of a list has no rows. As the type of q1.df is a dataframe, then the output will contain class.


c. __[2 marks]__ Convert `q1.list` to a `data.frame` by using `as.data.frame` and assign it the variable name `q1.list.to.df` and show it is identical to `q1.df` using `identical`.

```r
# Enter your answer here
q1.list.to.df <- as.data.frame(q1.list) # Edit this line
identical(q1.list.to.df, q1.df) # This should evaluate to TRUE
```

```
## [1] TRUE
```

d. __[3 marks]__ Convert `q1.list` to a `data.frame` by changing its attributes by using the `attr` function (see `? attr`). In the first approach use `as.data.frame` and assign it the variable name `q1.list.to.df` and show it is identical to `q1.df` using `identical`.

```r
# Enter your answer here
#q1.to.df.via.attr <- attr(q1.list[1],q1.df[1]) # Edit this line and add code below to modify attributes

#identical(q1.to.df.via.attr, q1.df) # This should evaluate to TRUE
```

e. __[3 marks]__ Produce a comparative boxplot of the `X5` variable split by `Genre`.

```r
# Enter your answer here
boxplot(q1.df$X5~q1.df$Genre)
```

![](S2-2022-Computer-Test_files/figure-html/q1e-1.png)<!-- -->

f. __[2 marks]__ Compute the mean values for the first three numeric variables (`X1`, `X2` and `X3`) when the `Genre` is `Crime` and the `Model` is `State.of.the.art`.

```r
# Enter your answer here
cm = q1.df[q1.df$Genre == 'c'& q1.df$Model == 'State.of.the.Art',]
mean(cm$X1)
```

```
## [1] -0.591333
```

```r
mean(cm$X2)
```

```
## [1] -0.08325849
```

```r
mean(cm$X3)
```

```
## [1] 0.1252121
```

g. __[4 marks]__ The data is hard to visualize with 10 variables. Conduct a Principal Components Analysis (PCA) using `prcomp` with the data centered and scaled. Then produce a scatterplot of the first two principal components and colour the points by their `type`. Using the visualiaztion, **comment** if the PCA can help explain the document type.


```r
# Enter your answer here
q1pca = q1.df[,1:10]
pca <- prcomp(q1pca)
plot(pca$x[,1], pca$x[,2], col = factor(q1.df[[ncol(q1.df)]]),
     xlab = "First Component", ylab = "Second Component")

legend("topright", legend = unique(q1.df[[ncol(q1.df)]]),
       col = factor(unique(q1.df[[ncol(q1.df)]])),
       pch = 1)
```

![](S2-2022-Computer-Test_files/figure-html/q1g-1.png)<!-- -->
Based on the plot we can see that it seems to it can not adequately discriminate between the different data types. There are some points very closed to eache other.

### Question 2

The standard multiple regression model with three features assumes that the response and features follow the model
\[
  Y_i = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \beta_3 X_3  +\varepsilon \qquad \varepsilon \sim \mathcal N(0, \sigma^2).
\]
This can lead to the likelihood model (you do not need to show this) where the log likelihood of the parameters
$\boldsymbol{\theta} = \left( \beta_0, \beta_1, \beta_2, \beta_3, \sigma\right)$ is given by
\[
  \mathcal L(\boldsymbol{\theta}|\mathcal X) = \begin{cases} -\infty, & \qquad \text{if } \sigma < 0;\\
  -\frac{n}{2}\log(2 \pi) - n\log (\sigma) - \frac{1}{2\sigma^2} \sum_{i = 1}^n (Y_i - \beta_0 - \beta_1 X_{1i} - \beta_2X_{2i} - \beta_3 X_{3i})^2, & \qquad \text{otherwise}.\end{cases}
\]
where $\mathcal X = (Y_1, \ldots, Y_n, X_{11}, \ldots, X_{1n}, X_{21}, \ldots, X_{2n}, X_{31}, \ldots, X_{3n})$

For this question consider estimating a linear model using both the standard least squares fitting procedure using `lm` and an approach using the method of Maximum Likelihood Estimation (MLE). In particular, consider the `property.dat` data available in `readRDS` command below. A description of the data is given in the table below

| R variable       | Variable | Description                                        |
|:-----------------|:---------|:---------------------------------------------------|
| `Sold.price`     | $Y$      |   Last sold price (in $AUD)                        |
| `land.estimate`  | $X_1$    |   Estimated land value (in $AUD)                   |
| `existing`       | $X_2$    |   Estimated value of existing structure (in $AUD)  |
| `area`           | $X_3$    |   Size of property (in square metres)              |


a. __[3 marks]__ Inspect the `property.dat` data, determining the dimension of the data and produce a matrix scatterplot (using the function `pairs` or other equivalent function).

```r
property.dat <- readRDS("S2-2022-q2.rds")
# Enter your answer here
dim(property.dat)
```

```
## [1] 40  4
```

```r
pairs(property.dat)
```

![](S2-2022-Computer-Test_files/figure-html/unnamed-chunk-3-1.png)<!-- -->


b. __[2 marks]__ Fit the linear regression using the `lm` function in `R` and extract the regression coefficients (the $\beta$ values) and the estimate of $\sigma$.

```r
# Enter your answer here
lm1 = lm(Sold.price ~ land.estimate + existing + area,data = property.dat)
coef(lm1)
```

```
##   (Intercept) land.estimate      existing          area 
##  1.700411e+04  9.695303e-01  7.171243e-01  1.625240e+03
```


```r
sigma(lm1)
```

```
## [1] 78806.12
```

c. __[3 marks]__ Define a function in `R` that computes the _negative_ log-likelihood as a function of $\boldsymbol{\theta}$ defined above. (Note $\boldsymbol{\theta} = (\beta_0, \beta_1, \beta_2, \beta_3, \sigma)$ has 5 elements and will require a function with five input arguments e.g. `fun <- function(v, w, x, y, z)` has five arguments `v, w, x, y, z`)

```r
# Enter your answer here
negLogLikelihood <- function(beta0, beta1, beta2,beta3, sigma) {
  Y <- property.dat[["Sold.price"]]
  X1 <- property.dat[["land.estimate"]]
  X2 <- property.dat[["existing"]]
  X3 <- property.dat[["area"]]
  n <- nrow(property.dat)
  if (sigma < 0) 
    return(Inf)
  else 
    n/2*log(2*pi)+n * log(sigma)+ sum((Y-beta0-beta1*X1-beta2*X2-beta3*X3)^2)/(2*(sigma**2))
}
```

d. __[2 marks]__ As an alternative algorithm to estimate the regression coefficients and $\sigma$, use the `property.dat` data to compute the MLE of $\boldsymbol{\theta}$ using the using the `stats4::mle` function (i.e. the function `mle` in the `stats4` package). **Print** the mle estimates in the output belowe. __Hint__: Start the algorithm with the values $\beta_i = 0$ and $\sigma = 1$ by using the `start` argument in `stats4::mle` or setting default arguments in the `negLogLikelihood` function above.

```r
# Enter your answer here

mle <- stats4::mle(minuslogl = negLogLikelihood,start = list(beta0 = 0, beta1 = 0, beta2 = 0,beta3 = 0, sigma = 1))
mle_coef <- mle@coef
mle_coef
```

```
##        beta0        beta1        beta2        beta3        sigma 
## 3.654973e+01 7.684926e-01 9.006369e-01 1.373709e+03 2.127172e+04
```

e. __[2 marks]__ Compare the outputs generated from `lm` and the MLE method above and **comment**. To do this, take the code below that produces a matrix with missing values and replace the missing values with the appropriate estimated coefficients from each model.

```r
# Enter your answer here and edit some of the lines or add lines below as appropriate

coef.table <- matrix(c(coef(lm1)[1], coef(lm1)[2],coef(lm1)[3],coef(lm1)[4], sigma(lm1),mle_coef[1],mle_coef[2], mle_coef[3], mle_coef[4], mle_coef[5]), nrow = 5, ncol = 2,
                     dimnames = list(c(paste0("beta", 0:3), "sigma"), c("Least squares", "MLE")))
coef.table
```

```
##       Least squares          MLE
## beta0  1.700411e+04 3.654973e+01
## beta1  9.695303e-01 7.684926e-01
## beta2  7.171243e-01 9.006369e-01
## beta3  1.625240e+03 1.373709e+03
## sigma  7.880612e+04 2.127172e+04
```
The outputs for the lm method and MLE are not closed when estimating beta0, beta1, beta2 and sigma. The biggest discrepancy in the intercept estimate. The sigma from lm method is much larger than MLE.

f. __[3 marks]__ Compute the predicted `Sold.prices` using the least squares model (from the model generated by `lm`) and using the MLE estimate computed earlier. Print the first six predictions from each model by using the `head` function.


```r
# Enter your answer here

head(predict(lm1, data.frame(land.estimate =property.dat[["land.estimate"]] , existing=property.dat[["existing"]], area=property.dat[["area"]]), interval = "confidence"))
```

```
##         fit      lwr       upr
## 1  680049.1 617325.0  742773.2
## 2  443823.3 400057.0  487589.6
## 3  505216.4 471986.1  538446.6
## 4  589659.3 556825.5  622493.0
## 5 1048579.1 981661.0 1115497.1
## 6  433456.4 390719.6  476193.2
```

g. __[3 marks]__ Using the predicted values in part f. above, compute the Root Mean Square Error (RMSE) of both models.
$$
    RMSE = \sqrt{\frac{\sum_{i = 1}^n (Y_i - \widehat{Y}_i)^2}{n}}
$$
where $Y_i$ is the observed sold price and $\widehat Y_i$ is the predicted sold price from the model.

```r
# Enter your answer here
c(`RMSE:Least Squares` = NA, `RMSE: MLE` = NA) # Replace the NA values with the RMSE for each model
```

```
## RMSE:Least Squares          RMSE: MLE 
##                 NA                 NA
```

```r
a = predict(lm1, data.frame(land.estimate =property.dat[["land.estimate"]] , existing=property.dat[["existing"]], area=property.dat[["area"]]), interval = "confidence")[,1]
lm2 = lm(a~property.dat$land.estimate+property.dat$existing+property.dat$area)
RSS <- c(crossprod(lm2$residuals))
MSE <- RSS / length(lm2$residuals)
RMSE <- sqrt(MSE)

RMSE
```

```
## [1] 9.494759e-11
```
