require_relative('models/merchants.rb')
require_relative('models/tags.rb')
require_relative('models/transactions.rb')
require_relative('models/budget.rb')
require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

get '/my-money/budget/edit' do
  @budget = Budget.show_all
  erb(:"budget/edit")
end

get '/my-money/transaction/:id/edit' do
  @tags = Tag.show_all
  @transaction = Transaction.find_by_id(params[:id].to_i)
  erb(:"transactions/edit")
end

get '/my-money' do
  current_week = Date.today.cweek
  current_month = Date.today.month
  current_year = Date.today.year
  current_week_date = Date.commercial(current_year, current_week)
  next_week_date = Date.commercial(current_year, current_week + 1) - 1
  current_month_date = Date.new(current_year, current_month)
  next_month_date = Date.new(current_year, current_month + 1) - 1
  current_year_date = Date.new(current_year)
  next_year_date = Date.new(current_year + 1) - 1
  @transactions = Transaction.show_all()
  @tags = Tag.show_all()
  @merchants = Merchant.show_all()
  @cweek_total = Transaction.total_by_date(current_week_date, next_week_date).to_f
  @cmonth_total = Transaction.total_by_date(current_month_date, next_month_date).to_f
  @cyear_total = Transaction.total_by_date(current_year_date, next_year_date).to_f
  @budget = Budget.show_all
  erb(:"transactions/home")
end

get '/my-money/index' do
  @transactions = Transaction.show_all()
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index' do
  @transactions = Transaction.show_all()
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/date/up' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_date(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/date/down' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_date(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/amount/up' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_amount(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/amount/down' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_amount(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/merchant/up' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_merchant(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/merchant/down' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_merchant(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/tag/up' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_tag(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index/tag/down' do
  @transactions_us = Transaction.show_all()
  @transactions = Transaction.order_by_tag(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/index' do
  @transactions = Transaction.show_all()
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/index")
end

get '/my-money/:tag_id' do
  @tags = Tag.show_all()
  @transactions = Transaction.show_by_type(params[:tag_id])
  @total = Transaction.sum_by_transactions(@transactions)
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/date/up' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_date(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/date/down' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_date(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/amount/up' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_amount(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/amount/down' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_amount(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/merchant/up' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_merchant(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/merchant/down' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_merchant(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/tag/up' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_tag(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:tag_id/tag/down' do
  @transactions_us = Transaction.show_by_type(params[:tag_id])
  @transactions = Transaction.order_by_tag(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_tag/show")
end

get '/my-money/:month/show-month' do
  @tags = Tag.show_all()
  @transactions = Transaction.show_by_month(params[:month])
  @total = Transaction.sum_by_transactions(@transactions)
  erb(:"transactions/by_date/show")
end


get '/my-money/:month/show-month/date/up' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_date(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/date/down' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_date(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/amount/up' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_amount(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/amount/down' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_amount(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/merchant/up' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_merchant(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/merchant/down' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_merchant(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/tag/up' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_tag(@transactions_us,'asc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/:month/show-month/tag/down' do
  @transactions_us = Transaction.show_by_month(params[:month])
  @transactions = Transaction.order_by_tag(@transactions_us,'desc')
  @total = Transaction.sum_by_transactions(@transactions)
  @tags = Tag.show_all()
  erb(:"transactions/by_date/show")
end

get '/my-money/cweek/show' do
    current_week = Date.today.cweek
    current_year = Date.today.year
    current_week_date = Date.commercial(current_year, current_week)
    next_week_date = Date.commercial(current_year, current_week + 1) - 1
    @tags = Tag.show_all
    @transactions = Transaction.show_by_date(current_week_date, next_week_date)
    @total = Transaction.sum_by_transactions(@transactions)
    erb(:"transactions/cweek/show")
end

get '/my-money/cmonth/show' do
    current_month = Date.today.month
    current_year = Date.today.year
    current_month_date = Date.new(current_year, current_month)
    next_month_date = Date.new(current_year, current_month + 1) - 1
    @tags = Tag.show_all
    @transactions = Transaction.show_by_date(current_month_date, next_month_date)
    @total = Transaction.sum_by_transactions(@transactions)
    erb(:"transactions/cmonth/show")
end

get '/my-money/cyear/show' do
    current_year = Date.today.year
    current_year_date = Date.new(current_year)
    next_year_date = Date.new(current_year + 1) - 1
    @tags = Tag.show_all
    @transactions = Transaction.show_by_date(current_year_date, next_year_date)
    @total = Transaction.sum_by_transactions(@transactions)
    erb(:"transactions/cyear/show")
end

get '/my-money/grouped-totals/show' do
  @tags = Tag.show_all()
  erb(:"transactions/grouped-totals/show")
end


post '/my-money' do
  merchant = Merchant.new(params)
  merchant.save()
  params['merchant_id'] = merchant.id
  transaction = Transaction.new(params)
  transaction.save()
  redirect to '/my-money/index'
end

post '/my-money/:id/edit' do
  merchant = Merchant.new(params)
  merchant.save()
  params['merchant_id'] = merchant.id
  transaction = Transaction.new(params)
  transaction.update()
  redirect to '/my-money/index'
end


post '/my-money/show/:id/delete' do
  Transaction.delete_by_id(params[:id])
  redirect to "/my-money/#{params[:tag_id]}"
end

post '/my-money/dates/:id/delete' do
  Transaction.delete_by_id(params[:id])
  redirect to "/my-money/#{params[:month]}/show-month"
end

post '/my-money/all/:id/delete' do
  Transaction.delete_by_id(params[:id])
  redirect to '/my-money/index'
end

post '/my-money/budget/:id' do
  budget = Budget.new(params)
  budget.update
  redirect to '/my-money'
end

post '/my-money/delete-all' do
  Transaction.delete_all()
  redirect to '/my-money'
end
