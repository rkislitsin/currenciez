## Install and run 

``` bash
git clone git@github.com:rkislitsin/currenciez.git
```

``` bash
cd /currensiez
```

``` bash
bundle install
```

``` bash
rake db:create && rake db:migrate
```

``` bash
rake currencies:refresh
```

### Usage

 ##### create user
 ![create user](public/img/1.png)

 ##### login user 
![create user](public/img/2.png)

 ##### get currencies (by default returns first page with 10 currencies) 
 need to pass token returned on login
![create user](public/img/3.png)

 ##### get currencies with specified page
 need to pass token returned on login
![create user](public/img/5.png)

 ##### get currency by :id
 need to pass token returned on login
![create user](public/img/4.png)
