#lab3

#Part 1
  #create 2 dataframes using given tables
  DEMscore = data.frame(country = c("USA", "Albania", "Turkey", "China", "Sudan"), Democracy.score = c(19, 16, 16, 5, 10)) 
  DEMscore
  GDPscore = data.frame(country = c("USA", "Albania", "Turkey", "China", "Sudan"), GDP = c(12000, 10000, 9000, 20000, 500))  
  GDPscore

  #find the dimensions of each dataframe
  dim(DEMscore)
  dim(GDPscore)
  
  #merge the two dataframes by country and find new dimension
  Combo=merge(DEMscore, GDPscore, by.x="country", by.y="country")
  Combo
  dim(Combo)

#part 2
  #Find dataset "women" and convert weight in pounds to kilograms
  women
  Weight_kg=(women$weight*2.2)
  Weight_kg

  #convert height to meters
  Height_m=(women$height*39.3700787402)
  Height_m

  #calculate BMI
  BMI=(Weight_kg/Height_m^2)
  BMI

  #find all summary statistics
  summary(women$height)
  summary(women$weight)
  summary(Height_m)
  summary(Weight_kg)
  summary(BMI)

#part 3
  #plot dataset seatbelts and try to reduce the skewness
  Seatbelts
  hist(Seatbelts)
  New_Seatbelts = log(Seatbelts)
  hist(New_Seatbelts)

  New_Seatbelts2 = (1/Seatbelts)
  hist(New_Seatbelts2)
