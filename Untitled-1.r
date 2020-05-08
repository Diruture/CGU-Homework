# Call pricing ::: Multiperiod Binomial Tree ::: 
​
#Data
So <- 79.28
r <- 0.00687
n <- 30
Te <- 51/365
sigma <- 0.55069
k <- 80
​
dT <- Te/n
u <- exp(sigma*sqrt(dT))
d <- exp(-sigma*sqrt(dT))
​
#--------------------------------------
#Getting Stock values at each node
Sp <- matrix( ncol = n+1, nrow = n+1)
​
for (i in 1:(n+1)) {
  for (j in 1:i) {
    Sp[i,j] <- So * u^(j-1) * d^((i-1)-(j-1))
  }
}
​
#--------------------------------------
#Getting payoff at each node
payoff <- matrix( ncol = n+1, nrow = n+1)
​
for (i in 1:(n+1)) {
  for (j in 1:i) {
    payoff[i,j] <- max(Sp[i,j]-k,0)
  }
}
​
#--------------------------------------
#Risk-neutral probability
q <- (exp(r*dT)-d)/(u-d)
​
#Recursively, computing the Call price from the Multi period binomial tree
callp <- matrix( ncol = n, nrow = n)
​
for (i in n:1) {
  for (j in 1:i) {
    if (i==n) {
      callp[i,j] <- exp(-r*dT)*((q)*payoff[i+1,j+1] + (1-q)*payoff[i+1,j])
    }
    else {
      callp[i,j] <- exp(-r*dT)*((q)*callp[i+1,j+1] + (1-q)*callp[i+1,j])
    }
  }
}
​
#--------------------------------------
#Computing the Call price, using the binomial formula
binomf <- matrix(nrow = n, ncol = 1)
​
for (i in 0:n) {
  binomf[i] <- (choose(n,i)*((q)^(i))*(1-q)^(n-i))*max(((So*(u^i)*(d^(n-i)))-k),0)
}
​
#--------------------------------------
#Printing answers and plotting Stock lattice
print((Sp),na.print = "")
print(callp[1,1])
print(exp(-r*Te)*sum(binomf))
matplot(Sp, main="Stock Price", ylab="Price", xlab="n", type = "p")