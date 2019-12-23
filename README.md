# Trainwreck

# Task 1

1. Create Custom Rest Api in Each of your orgs.
2. Each Api should have get and post method
3. get method should accept casenuber as parameter and return case details
4. post method should accept json body with case details and create respective case and contact

# Task 2

1. Test api using workbech
2. create connected app 
3. ref: https://github.com/sonicfurqan/Salesforce-Fundamentals/blob/master/Docs/REST%20in%20salesforce to know how to get access token and instance url using connected app
4. Test using workbech same custom api

# Task 3

1. In one org create custom component 
2. componet shoud accept case number and fetch details from all 5 custom apis in round robin formate
3. if not found should pront for creating case and create case in other org randamlyselecting api

# Note
1. Apex architect
2. Helper class that genrates token and call api based on paramters
3. base class extends utiliyt class and calss respective post and get methods
4. each api should have its private method that calls respective orgs
5. apex aura enabled method should interun call private method s for post and get respetivly