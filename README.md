# appdensitycalculation
Read the csv file of popluation and regionarea. It contains data pertinent to the population to each barangay in the Philippines. This data set contains information about region, province, city, barangay, population in each barangay, householdpopulation, and number of households. As per the region area file it comprises information about the area per each region in square kilometer.
3. Barangay Density Since we are only concerned with the barangay density, using the formula:
density = population/area
We calculated the barangay density. It was assumed that the regional area is uniformly distributed accross all the barangays within each region. This can be calculated using:
Area of Barangay per Region = Area of the Region / No. barangays in Region.
Note: We generated the numbers of barangay per region by the aggregate() function. After this we sorted all the barangays according to population density and reach with the top 5 barangays with highest population densities. Based on the generated results, these are the 5 barangays with the highest population densities:
Barangay Population Density (population/sq.km)
1. Barangay 176 - 678,817.5
2. Commonwealth - 546,008.7
3. Batasan Hills - 444,464.9
4. Pinagbuhatan - 418,497.9
5. Payatas - 358,892.2
6. City Density In this part, we are now concerned with calculating the City Density, using the same formula of density:
density = population/area
Same assumptions are taken that as all cities in a particular region will have equal land area.
Note: The generated output for the numbers of cities per region are done using aggregate() function by the help of duplicated() function to provide unique values of elements under the CityProvince column. Prior to that step, we concatenate the columns of City and Province to catch some of the cities with same name but different provinces using paste() function. From this, we use the head() function to get the top 5 cities with highest population densities:
City Population Density (population/sq.km)
1. Quezon City - 80,566.18
2. City of Manila - 48,846.75
3. Caloocan City - 43,463.90
4. Taguig City - 22,086.64
5. City of Pasig - 20,725.22
This top 5 barangays and cities with highest population densities are then generated to a csv file uploaded in this repo.




appdensitycalculation/ at main · jayce0902/appdensitycalculation · GitHub 
