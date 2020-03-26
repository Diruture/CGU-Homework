Q<-matrix(c(0,1,0, 0,0,1, 1/2,1/2,0), ncol = 3, nrow = 3, byrow = TRUE)
q<-matrix(c(-1,1,0, 0,-2,2, 3/2, 3/2 -3), ncol = 3, nrow = 3, byrow = TRUE)
P_0<- matrix(c(1,0,0, 0,1,0, 0,0,1), ncol = 3, nrow = 3, byrow = TRUE)

P_0.1<- expm(q*0.1) %*% P_0

