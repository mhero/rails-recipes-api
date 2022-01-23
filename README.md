## Intro and stories of the project

I tried to make a project that would handle 3 main points

- As a app onwer, I want to be able to parse and import raw data from recipes.json file, so that I'm able to query it from the database
- As a app onwer, I want to be able to see the recipes times I've added to the database in an standard way(currently they are strings) so that I can make calcuclations on recipes times
- As a app onwer, I want to be able to see the recipes times I've added to the database searching in 3 fields the recipe name, the ingredients and the tags

I dockerized the app so it can be run on a local machine, and by following the next steps:
## Dependencies

* Ruby 3.1.0
* Node >= 16.13.2

## Apps info
 * Rails app runs in port 3000 (using this default config)
 * React app runs in port 8084 (using this default config)

## Local Development
## Docker install

1. Install dependencies
```
https://www.docker.com/products/docker-desktop
```

2. Clone repository
3. cd into repository folder

4. Create env files for rails and react (replace variables with credentials and server variables)
```
cp .env.example .env
cp ./recipes-react/.env.example ./recipes-react/.env
```

5. Run
```
docker-compose up
```

6. Migrations tasks(run once)

```
docker exec -it $( docker ps | grep rails-recipes-api | awk "{print \$1}" | head -n 1 ) rake recipes:insert_users
docker exec -it $( docker ps | grep rails-recipes-api | awk "{print \$1}" | head -n 1 ) rake recipes:insert_recipes
docker exec -it $( docker ps | grep rails-recipes-api | awk "{print \$1}" | head -n 1 ) rake curate:convert_string_times_to_seconds
```

7. Rails debug
```
docker exec -it $( docker ps | grep ruby-recipes-api | awk "{print \$1}" | head -n 1 ) rails c
```

## Full install

1. Install dependencies
```
brew install node
\curl -sSL https://get.rvm.io | bash
rvm install "ruby-3.1.0"
rvm use 3.1.0
brew install postgresql
```

2. Clone repository
3. cd into repository folder

4. Run in command line next:

```
npm install -g yarn
gem install bundler && bundle config jobs 7
```

5. Create env files for rails and react (replace variables with credentials and server variables)
```
cp .env.example .env
cp ./recipes-react/.env.example ./recipes-react/.env
```

6. Replace file with credentials of local postgres db(in development section)
```
database.yml
```

7. Run in command line next:
```
bundle install
cd recipes-react && npm install
```

8. Migration tasks(run once) 
```
rake recipes:insert_users
rake recipes:insert_ingredients
rake curate:convert_string_times_to_seconds
```

9. run backend (on aterminal window)
```
rails server --binding 0.0.0.0 --port 4567
```

10. run frontend (on a different terminal window)

```
cd recipes-react && npm run dev
```
