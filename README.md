# influx-xplore
My repository to study, test and explore the InfluxDB timeseries database

I wanted to modify a file but not commit the changes, for example changing the database configuration to run on my local machine, with the URL, the API Token, the specific bucket, and the organization.

Adding the file to .gitignore doesn’t work, because the file is already tracked. Git allows us to manually “ignore” changes to a file or directory:
```
git update-index --assume-unchanged <file>
```
