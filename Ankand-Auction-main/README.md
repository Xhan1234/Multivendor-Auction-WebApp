# Ankand Auction
An online auction is a sale or bid for auctions and services that takes place over the internet. It's also known as an electronic auction, e-auction, virtual auction, or eAuction. 
This project is running on django version 5.0.2 and python version 3.10.12


# Introduction
This is a multivendor e-comm project.
An auction/biding system that have on the frontend a countdown do be visible without refreshing the page. The last bidder to win the item. A biding system for example the seller can put a reserve price (that is not showed on the buyer/bidder page). If the bidders bids above this reserve price the last bidder can win it. If the bidders bids below the reserve price no one can win it. In the same time there is also a buy it now price.

_Fixing bugs, integrate new feature and deploy it and to be ready for usage from customers._

### Features
<<<<<<< HEAD
* Auction / Bidding System.
* Direct Buy Products System
* PayPal, Credit Card System
* User Verifications System
* Searching & filtering System
* Invoices System
* Messaging System
* Ratings and Reviews System
* Notifications System
* Mailing System (When Win, Buy, About to End an auction)
* Shipping and delivery options
* Admin Gain Percentage(%)
* Change Password
* Forgot Password
* Documentation
* Reporting System (where users can report a listed product to the admin (if it is inappropriate, etc.).)
* Reporting feature on vendors and customers. It calculates the sum of the products they sold (daily, weekly, monthly, yearly).

### Technologies
* Python - 3.10.12
* Django Framework - 5.0.2
* Javascript (Pure JS, Ajax, Jquery)
* Asynchronous Tasks With Django and Celery
* Database - MySQL
=======
* Integrated the auction/bidding system.
* And it's frontend technologies
* PayPal, Credit card
* User Authentication and Authorization
* Templates and Static Files
* Models and Database Interactions
* MySQL Database Configuration
* Documentation
* Version Control and Collaboration

>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388

# Project Setup

To use this project to your own machine follow this steps

### Clone repository from github

First of all, clone this repository using this command

<<<<<<< HEAD
    git clone https://github.com/mehedishovon01/Ankand-Auction.git
=======
    git clone https://github.com/Xhan1234/webapp-auction.git
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388

### Create a virtualenv

Make a virtual environment to your project directory. Let's do this,

<<<<<<< HEAD
If you have already an existing python virtualenv then run this
=======
If you have already an existing python3 virtualenv then run this
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388

    virtualenv venv

Or if virtualenv is not install in you machine then run this

    python -m venv venv
    
Activate the virtual environment and verify it

    . venv/bin/activate

### Install the dependencies

Most of the projects have dependency name like requirements.txt file which specifies the requirements of that project, so let’s install the requirements of it from the file.

    pip install -r requirements.txt

# Database Configuration

I am using `MySQL` database here. To configure MySQL in your Django project, you'll need to update the `DATABASES` setting in your settings.py file as follows:

    'default': {  
    'ENGINE': 'django.db.backends.mysql',  
    'NAME': 'database_name',
    'USER': 'root',  
    'PASSWORD': 'mysql_password',  
    'HOST': '127.0.0.1',  
    'PORT': '3306',  
    'OPTIONS': {  
        'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"  
        }
    }

<<<<<<< HEAD
### Make an .env

Copy .env from .env.example file for put the secret credentials

    cp .env.example .env

After that, put the database credentials and mail credentials `(Do not use the direct Mail Password)`
=======
Copy .env.example to .env and then put credentials.
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388


### Create database

We have already configured the MySQL in our project.

So, simply apply the migrations:

<<<<<<< HEAD
    python manage.py migrate
    
Boooooom! Project setup is done.
=======
    python3 manage.py migrate
    
Boooooom! Your project setup is done.
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388

### Run this project

Let's run the development server:

<<<<<<< HEAD
    python manage.py runserver
=======
    python3 manage.py runserver
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388

That’s it! Now you’re project is already run into a development server. 

Just click this link, [http://127.0.0.1:8000/](http://127.0.0.1:8000/)


Thanks for reading.# Ankand-Auction
