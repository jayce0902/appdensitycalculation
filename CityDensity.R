#4. City Density

population = read.csv("population.csv")
regionarea = read.csv("regionarea.csv")

#b. Area of City per Region
Pop_Reg = merge(x = population, y = regionarea, by = "Region", all = TRUE)
CityPopulation = setNames(aggregate(Pop_Reg$Population, by = list(Pop_Reg$CityProvince), FUN = "sum"),c("CityProvince","CityPopulation"))
Pop_Reg = merge(x = Pop_Reg, y = CityPopulation, by = "CityProvince", all = TRUE)
Pop_Reg

#a. Population Density per City
Pop_Reg$CityProvinceProvince = paste(Pop_Reg$CityProvince, Pop_Reg$Province,sep=", ")
Pop_Reg = Pop_Reg[!duplicated(Pop_Reg$CityProvinceProvince),]
NCity = setNames(aggregate(Pop_Reg$CityProvinceProvince, by = list(Pop_Reg$Region), FUN = "length"),c("Region","NCity"))
Pop_Reg = merge(x = Pop_Reg, y = NCity, by = "Region", all = TRUE)

Pop_Reg$CityArea = Pop_Reg$Area / Pop_Reg$NCity
Pop_Reg$CityDensity = Pop_Reg$CityPopulation / Pop_Reg$CityArea
PD_City = data.frame(Pop_Reg$Region,Pop_Reg$CityProvince,Pop_Reg$Province,Pop_Reg$Area,Pop_Reg$CityPopulation,Pop_Reg$NCity,Pop_Reg$CityArea,Pop_Reg$CityDensity)
PD_City

#c. Top 5 City with highest density
Pop_Sorted = PD_City[order(-PD_City$Pop_Reg.CityDensity),]
top_c = head(Pop_Sorted,5)
top_c
write.csv(top_c,"/Users/jaycejocson/Desktop/DST/Top 5 Cities.csv",row.names=FALSE)
