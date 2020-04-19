import numpy as np

long_strike_price = 0
short_strike_price = 0
long_cost = 0
short_cost = 0
x = np.zeros((1,2000))
y = np.zeros((1,2000))

initial_price = int(input('the price of the underlying stock at the start of the trade: '))
for i in y:
    y[i] = (initial_price - 15) + i*(30/2000)
end

tt = 'Collar Trade: Stock Price vs. Returns'
covered_call_strike = int(input('input the strike price of the covered call: '))
covered_call_cost = int(input('input the cost of the covered call: '))
long_put_strike = int(input('input the strike price of the long put: '))
long_put_cost = int(input('Please input the cost of the long put: '))

max_return = covered_call_strike + covered_call_cost - initial_price - long_put_cost
min_return = long_put_strike - initial_price + covered_call_cost - long_put_cost

for j in x:
    x[j] = y[j] - initial_price + covered_call_cost - long_put_cost; 
    if x[j] < min_return:
        x[j] = min_return
    else:
        x[j] = x[j]
    end
    if x[j] > max_return:
        x[j] = max_return
    else:
        x[j] = x[j]
    end
end

Total_Return = x*100

plot(Total_Return,y,0,y,'k--')
xlabel('Returns')
ylabel('Stock Price')
title(tt)
plt.show()