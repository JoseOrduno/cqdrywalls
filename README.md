# cqdrywalls api

this is an example api working with 4 models and relationships, have security with jwt and have  functionality to upload files to google bucket

example server [here](https://rocky-journey-06295.herokuapp.com/index.html)

## Installation 

install ruby and RoR specified in file config

install postgresql
 
guide [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04)



add .env file with this values 
```bash
ENCRYPT_PASSWORD=""
DATABASE_NAME=""
DATABASE_USER=""
DATABASE_PASSWORD=""
DATABASE_USER_TEST=""
DATABASE_NAME_TEST=""
DATABASE_PASSWORD_TEST=""
DATABASE_NAME_DEVELOPMENT=""
DATABASE_USER_DEVELOPMENT=""
GOOGLE_BUCKET=""
GOOGLE_BUCKET_KEY=""
```

install gems 
```bash
bundler install 
```

generate tables in our database 
```
rake db:migrate
```

generate user with admin role
```
rails db:seed
```

## License
[MIT](https://choosealicense.com/licenses/mit/)