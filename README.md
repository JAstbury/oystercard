#oystercard

User Stories:
```
In order to use public transport
As a customer
I want money on my card

```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Card|have_balance|

```
In order to keep using public transport
As a customer
I want to add money to my card
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Card|top_up|

```
In order to protect my money
As a customer
I don't want to put too much money on my card
```

|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Card|top_up.limit|

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Card|deduct_fare|

```
In order to get through the barriers
As a customer
I need to touch in and out
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|touch_in|
|Barriers|which_zone|
|Barriers|touch_out|
|Barriers|which_zone|

```
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|card.balance|
|Barriers|minimum_balance|

```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|touch_out|
|Card|deduct_fare|

```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```

|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|touch_in|
|Station|which_zone?|
|Card|zones_travelled|

```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|touch_in|
|Station|which_zone?|
|Barriers|touch_out|
|Station|which_zone?|
|Card|zones_travelled|

```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Station|which_zone?|

```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|touch_in|
|Barriers|touch_out|
|Card|zones_travelled|
|Card|deduct_penalty|

```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
|Objects| Message|
| ----- |:-------|
|_Customer_| |
|Barriers|touch_in|
|Barriers|which_zone|
|Barriers|touch_out|
|Barriers|which_zone|
|Barriers|calculate_fee|
|Card|deduct_fare|

Issues:

Challenge 3. Ruby NameError - uninitialized constant oystercard
/Users/rylangooch/Documents/Coding/MakersAcademy/oystercard/spec/oystercard_spec.rb:1
