Temperature forecast
========================================================
author: Nelleke van der Steen
date: 01-08-2017
autosize: true

Problem description
========================================================

A temperature forecast is made for based average air temperatures at Nottingham Castle in degrees Fahrenheit for 20 years.

Two models are used to forecast the temperature:

- Linear model
- Support vector machine

To start first data preparation need to be done


```r
### the dataset nottem is in Timeseries format and is converted to a data frame 
library(zoo)
### use zoo to extrach the month and year from the data
data <- data.frame(temp=nottem,date=as.yearmon(time(nottem)))
### extract only the month from the date
data$month <- as.numeric(format(as.Date(data$date), "%m"))
```

Visualize data
========================================================

The figure show the measured temperatures over all the months of the year

![plot of chunk unnamed-chunk-2](mypresentation-figure/unnamed-chunk-2-1.png)


Linear model
========================================================

The model

```r
 model1 <- lm(temp ~ month, data = data)
```

Vizualized
 
![plot of chunk unnamed-chunk-4](mypresentation-figure/unnamed-chunk-4-1.png)

SVM model
========================================================

The model

```r
library(e1071) 
 model2 <- svm(temp ~ month, data = data)
```

Vizualized
 
![plot of chunk unnamed-chunk-6](mypresentation-figure/unnamed-chunk-6-1.png)
