# My Money - Budgeting WebApp

My Money is my first full-stack project, which I completed during week 5 of CodeClan's 16-week intensive [course](https://codeclan.com/courses/16-week-course/). It was my first time building a web app from scratch and properly experimenting with integrating back-end functionality with front-end UX design.

## Goal

The aim for this project was to consilidate and expand on our learnings to date, which at the time included:

- Ruby fundamentals*
- OOP
- Web Programming ( REST/MVC )
- Databases(PostgreSQL) with CRUD actions
- Sinatra
- HTML
- CSS

We were given four briefs to choose from, each with supplied MVPs and possible extensions. I decided to choose the MoneyCashboard brief which is outlined below:

## MoneyCashboard

You want to start tracking your spending in an attempt to be more frugal with money. You have decided to make a budgeting app to help you see where all of your money is being spent.
You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco, and a value ) which have an associated Tag (e.g. 'food', 'clothes'). Your app would then be able to track a total, and display this in a view.

### MVP:
- Create new transactions
- Display a list of all transactions
- Display total amount spent
- Display total amount spent by tag

### Possible Extensions:
- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget (set a hard coded budget first)
- Add a date to the transactions and view total spending by month
- Any other ideas you might come up with

## Achievments

I successfully managed to meet all of the MVP objectives as well as the extensions outlined above. I also added my own further extensions, which included:

- Display transactions by month spent and by type
- Sort transactions by date, merchant and type*

*We were not allowed to use JavaScript for this project. Ruby/Sinatra does not lend itself well to adding front-end sorting functionality, however as this was our first project and my first time properly experimenting with front-end design and UX, I wanted to push the boundaries of Ruby functionality. As such the code, particularly in the controller file, is somewhat bulkier than necessary.

