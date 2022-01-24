# Databricks notebook source
# DBTITLE 1,Plotagem gráfico 1
library(ggplot2)
ggplot(diamonds, aes(carat, price, color = color, group = 1)) + geom_point(alpha = 0.3) + stat_smooth()

# COMMAND ----------

# DBTITLE 1,Plotagem gráfico 2
library(ggplot2)

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()

# COMMAND ----------

# DBTITLE 1,Plotagem gráfico 3
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()


# Add aesthetic mappings
p + geom_point(aes(colour = factor(cyl)))

p + geom_point(aes(shape = factor(cyl)))

# A "bubblechart":
p + geom_point(aes(size = qsec))


# Set aesthetics to fixed value
ggplot(mtcars, aes(wt, mpg)) + geom_point(colour = "red", size = 3)


# \donttest{
# Varying alpha is useful for large datasets
d <- ggplot(diamonds, aes(carat, price))
d + geom_point(alpha = 1/10)

d + geom_point(alpha = 1/20)

d + geom_point(alpha = 1/100)

# }

# For shapes that have a border (like 21), you can colour the inside and
# outside separately. Use the stroke aesthetic to modify the width of the
# border
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)


# \donttest{
# You can create interesting shapes by layering multiple points of
# different sizes
p <- ggplot(mtcars, aes(mpg, wt, shape = factor(cyl)))
p +
  geom_point(aes(colour = factor(cyl)), size = 4) +
  geom_point(colour = "grey90", size = 1.5)

p +
  geom_point(colour = "black", size = 4.5) +
  geom_point(colour = "pink", size = 4) +
  geom_point(aes(shape = factor(cyl)))


# geom_point warns when missing values have been dropped from the data set
# and not plotted, you can turn this off by setting na.rm = TRUE
mtcars2 <- transform(mtcars, mpg = ifelse(runif(32) < 0.2, NA, mpg))
ggplot(mtcars2, aes(wt, mpg)) +
  geom_point()
#> Warning: Removed 7 rows containing missing values (geom_point).

ggplot(mtcars2, aes(wt, mpg)) +
  geom_point(na.rm = TRUE)

# }

