#3. Barangay Density

population = read.csv("population.csv")
regionarea = read.csv("regionarea.csv")

#b. Area of Barangay per Region
Pop_Reg = merge(x = population, y = regionarea, by = "Region", all = TRUE)
NBarangay = setNames(aggregate(Pop_Reg$Barangay, by = list(Pop_Reg$Region), FUN = "length"),c("Region","NBarangay"))
Pop_Reg = merge(x = Pop_Reg, y = NBarangay, by = "Region", all = TRUE)
Pop_Reg

#a. Population Density per Barangay
Pop_Reg$BarangayArea = Pop_Reg$Area / Pop_Reg$NBarangay
Pop_Reg$BarangayDensity = Pop_Reg$Population / Pop_Reg$BarangayArea
PD = data.frame(Pop_Reg$Region,Pop_Reg$Barangay,Pop_Reg$BarangayDensity)
PD

#c. Top 5 Barangays with highest density
PD_Sorted = PD[order(-PD$Pop_Reg.BarangayDensity),]
top_b=head(PD_Sorted,5)
write.csv(top_b,"/Users/jaycejocson/Desktop/DST/Top 5 Barangays.csv",row.names=FALSE)
top_b

